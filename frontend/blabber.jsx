import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import configureStore from './store/store';
import App from './components/App';

// destructuring the store out of our props
const Root = ({ store }) => {
  return (
    <div>
      <Provider store={store}>
        <App />
      </Provider>
    </div>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  // const preloadedState = {
  //   blabs: {
  //     1: { id: 1, body: "I'm a little seed blab, short and stout." },
  //     2: { id: 2, body: "Here is my body, here is my author." },
  //     3: { id: 3, body: "Jk we haven't implemented frontend auth yet."}
  //   }
  // }
  const store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
}); 