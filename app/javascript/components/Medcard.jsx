import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Switch, Link } from 'react-router-dom';
import Navbar from './navbar/Navbar';
import { CookiesProvider } from 'react-cookie';
import LoginForm from './authentication/LoginForm';
import Home from './pages/Home';
import HowToUse from './pages/HowToUse';
import About from './pages/About';

const mainItems = [
  { as: Link, content: "Home", to: "/" },
  { as: Link, content: "How to use", to: "/how-to-use" },
  { as: Link, content: "About", to: "/about" },
  { as: Link, content: "Item 1", to: "/item 1" },
  { as: Link, content: "Item 2", to: "/item 2" },
  { as: Link, content: "Item 3", to: "/item 3" },
  { as: Link, content: "Item 4", to: "/item 4" }
];

const secondaryItems = [
  { as: Link, content: "Log In", to: "/log_in" },
  { as: Link, content: "Sign In", to: "/sign_in" },
  { as: Link, content: "Log Out", to: "/log_out" }
];

export default class Medcard extends Component {
  render() {
    return (
      <div>
        <CookiesProvider>

        </CookiesProvider>
        <Router>
          <div className="sticky-content">
            <Navbar
              mainItems={mainItems}
              secondaryItems={secondaryItems}
              onItemClick={item => this.onItemClick(item)}
            >
              <div className="content">
                <Switch>
                  <Route path="/" exact component={Home} />
                  <Route path="/how-to-use" component={HowToUse} />
                  <Route path="/about" component={About} />
                  <Route path="/sign_in" component={LoginForm} />
                </Switch>
              </div>
            </Navbar>
          </div>
        </Router>
      </div>
    );
  }
}
