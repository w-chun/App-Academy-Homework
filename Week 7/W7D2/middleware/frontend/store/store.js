import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState);

  applyMiddleware(addLoggingtoDispatch);
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingtoDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const secondMiddleware = store => next => action => {
  next(action);
  console.log(next);
};

export default configureStore;
