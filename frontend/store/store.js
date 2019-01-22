import { createStore , applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from '../middleware/thunk';
import logger from 'redux-logger';

export default (preloadedState = {}) => {
  // const appliedMiddleware = applyMiddleware(thunk);
  return createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger));
};

// logger should be the last argument of applyMiddleware