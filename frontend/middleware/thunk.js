const thunk = ({dispatch, getState}) => next => action => {
  if(typeof action === "function"){
      return action(dispatch, getState);
  }
  return next(action);
};
export default thunk;

// middleware signature, more info here:
// http://redux.js.org/docs/api/applyMiddleware.html