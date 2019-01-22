import { RECEIVE_USER } from "../actions/user_actions";

export default (state = {}, action) => {
  const nextState = Object.assign({}, state);

  switch(action.type) {
    case RECEIVE_USER:
      const { location } = action;
      nextState[location.id] = location;
      return nextState;
    default: 
      return state;
  }
};