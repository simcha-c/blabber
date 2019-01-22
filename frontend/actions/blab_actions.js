export const RECEIVE_BLABS = 'RECEIVE_BLABS';
export const RECEIVE_BLAB = 'RECEIVE_BLAB';
import * as BlabAPIUtil from '../util/blab_api_util';

export const receiveBlabs = (blabs) => {
  return {
    type: RECEIVE_BLABS,
    blabs,
  };
};

// actions are POJO with a type attribute


export const receiveBlab = (blab) => {
  return {
    type: RECEIVE_BLAB,
    blab,
  };
};

// this function is invoked inside of the function passed to our components through mapDispatchToProps
export const fetchBlabs = () => {
  // This function is the actual callback dispatched. It is the 'thunk action'.
  // Note that the argument `dispatch` does not get passed in when this function is first dispatched.
  //  Instead, the dispatch function is passed in by the Thunk Middleware when it invokes the thunk action.
  return (dispatch) => {

    // This is the inside of the thunk action, and the real meat of the process. 
    // Here, we make our ajax request. fetchBlabsAjax() will return a promise, 
    //  which we can chain onto using `.then`. Once the promised is fulfilled, IE the ajax request comes back,
    //  it will invoke its success callback function, passing in the response as an argument.
    return BlabAPIUtil.fetchBlabsAjax().then( blabs => {
  
      // The success callback for our ajax request.
      // Invokes the receiveBlabs action creator, passing in our blabs (the response from the ajax request).
      // After the action is created, that action is dispatched, which will hit our reducers and change our
      //  Redux (pronunced 'reh-dux', not 'ree-dux' :P ) state.
      return dispatch(receiveBlabs(blabs));
    });
  }
};

export const fetchBlab = id => {
  return dispatch => {
    return BlabAPIUtil.fetchBlabAjax(id).then(blab => {
      return dispatch(receiveBlab(blab));
    });
  };
};

export const createBlab = (blab) => {
  return (dispatch) => {

    return BlabAPIUtil.createBlabAjax(blab).then(blab => {
  
      return dispatch(receiveBlab(blab));
    });
  }
}

