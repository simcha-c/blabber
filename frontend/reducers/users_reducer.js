import { RECEIVE_USER, RECEIVE_USERS } from '../actions/user_actions';

export default (state = {}, action) => {
  const newState = Object.assign({}, state);

  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_USERS:
      // let users = {};
      // action.users.map(user => users[user.id] = user);
      return action.users;
    case RECEIVE_USER:
      newState[action.user.id] = action.user;
      return newState;
    default:
      return state;
  }
};