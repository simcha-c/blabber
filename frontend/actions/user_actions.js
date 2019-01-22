import * as UserAPIUtil from '../util/user_api_util';

export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_USERS = 'RECEIVE_USERS';

const receiveUser = ({ user, location }) => {
  return {
    type: RECEIVE_USER,
    user,
    location
  };
};

const receiveUsers = users => {
  return {
    type: RECEIVE_USERS,
    users
  };
};

export const fetchUser = id => {
  return dispatch => {

    UserAPIUtil.fetchUser(id).then(user => {
  
      return dispatch(receiveUser(user));
    });
  };
};

export const fetchUsers = () => {
  return dispatch => {

    UserAPIUtil.fetchUsers().then(user => {
  
      return dispatch(receiveUsers(user));
    });
  };
};