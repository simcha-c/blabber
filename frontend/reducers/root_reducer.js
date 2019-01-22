import { combineReducers } from 'redux';
import blabs from './blabs_reducer';
import users from './users_reducer';
import locations from './locations_reducer';

export default combineReducers({ 
  blabs,
  users, 
  locations,
});

// export default combineReducers({ blabs: blabs }); - same as above

// export default combineReducers({
//     blabs,
//     tweets,
//     potatos
// })


// Below is what combineReducers is doing 

// export default (state, action) => {
//   return {
//     blabs: blabs(state, action)
//   };
// };
