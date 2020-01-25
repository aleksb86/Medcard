import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Navbar from './navbar/NavbarWide';
import Footer from './footer/Footer';
import { Divider } from 'semantic-ui-react';
import Home from './pages/Home';
import HowToUse from './pages/HowToUse';
import About from './pages/About';

const left_items = [
  { name: "Home", route: "/" },
  { name: "How to use", route: "/how-to-use" },
  { name: "About", route: "/about" }
];

const right_items = [
  { name: "Log In", route: "/log_in" },
  { name: "Sign In", route: "/sign_in" },
  { name: "Log Out", route: "/log_out" }
];

export default class Medcard extends Component {
  render() {
    return (
      <Router>
        <div className="content-wrapper">
          <Navbar
            routes={left_items}
            right_items={right_items}
            onItemClick={item => this.onItemClick(item)}
          />
          <div className="content">
            <Switch>
              <Route path="/" exact component={Home} />
              <Route path="/how-to-use" component={HowToUse} />
              <Route path="/about" component={About} />
            </Switch>
          </div>
          <Footer />
        </div>
      </Router>
    );
  }
}
