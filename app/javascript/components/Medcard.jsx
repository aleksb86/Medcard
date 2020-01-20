// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, {Component} from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import Navbar from './navbar/Navbar';
import { Routes } from './navbar/Routes';

export default class Medcard extends Component {
  render() {
    return (
      <div>
        <Router>
          <header>
            <Navbar serviceName="Medcard" />
          </header>
          <div className="flex flex-col h-full">
            <div className="flex-1 container mx-auto p-8">
              <Routes />
            </div>
          </div>
        </Router>
      </div>
    );
  }
}
