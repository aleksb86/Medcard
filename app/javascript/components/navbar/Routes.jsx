import React from 'react';
import { Switch, Route, NavLink } from 'react-router-dom';
import Home from '../pages/Home';
import HowToUse from '../pages/HowToUse';
import About from '../pages/About';

const Links = () =>
  <div className="text-sm lg:flex-grow">
    <NavLink exact activeClassName="active" to="/">Home</NavLink>
    <NavLink activeClassName="active" to="/how_to_use">How it use</NavLink>
    <NavLink activeClassName="active" to="/about">About</NavLink>
  </div>

const Routes = () =>
  <Switch>
    <Route exact path="/" component={Home} />
    <Route path="/how_to_use" component={HowToUse} />
    <Route path="/about" component={About} />
  </Switch>

export {Links, Routes};