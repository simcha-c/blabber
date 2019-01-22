import React from 'react';
import BlabIndex from './blab_index';
import BlabShow from './blab_show';
import UserIndex from './user_index';
import { HashRouter, Route } from 'react-router-dom';

export default () => {
  return (
    <HashRouter>
      <div className="app-main">
        <Route exact path='/' component={BlabIndex} />
        <Route path='/blabs/:blabId' component={BlabShow} />
      </div>
    </HashRouter>
  );
}