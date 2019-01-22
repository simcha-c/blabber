import { RECEIVE_BLAB, RECEIVE_BLABS } from '../actions/blab_actions';

const blabsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_BLABS:
      const newState = {};
      action.blabs.forEach(blab => {
        newState[blab.id] = blab;
      });
      return newState;
    case RECEIVE_BLAB:
      const { blab } = action;
      // destructuring by taking the .blab key out of the action object and setting the
      // variable blab = to that key's attributes
      // blab === action.blab

      return Object.assign({}, state, { [blab.id]: blab });
      // return merge({}, state, {[blab.id]:blab});
      // merge recursively dups data
  
    default:
      return state;
  }
};

export default blabsReducer;