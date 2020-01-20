import React, { Component } from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import { Links } from './Routes'

export default class Navbar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      links: [
        {href: '/', name: 'Home'},
        {href: '#', name: 'How to use'},
        {href: 'pages/about', name: 'About'}
      ],
      linksVisible: false
    }
    this.toggleLinksVisible = this.toggleLinksVisible.bind(this);
  }

  // TODO: use arrow declaration (see Tiles)
  toggleLinksVisible() {
    this.setState({linksVisible: !this.state.linksVisible});
  }

  render() {
    return (
      <div className="search-pane p-3">
          <nav className="flex items-center justify-between flex-wrap p-6">
            <div className="flex items-center flex-shrink-0 text-white mr-6">
              <svg className="fill-current h-8 w-8 mr-2" width="54" height="54" viewBox="0 0 54 54" xmlns="http://www.w3.org/2000/svg"><path d="M13.5 22.1c1.8-7.2 6.3-10.8 13.5-10.8 10.8 0 12.15 8.1 17.55 9.45 3.6.9 6.75-.45 9.45-4.05-1.8 7.2-6.3 10.8-13.5 10.8-10.8 0-12.15-8.1-17.55-9.45-3.6-.9-6.75.45-9.45 4.05zM0 38.3c1.8-7.2 6.3-10.8 13.5-10.8 10.8 0 12.15 8.1 17.55 9.45 3.6.9 6.75-.45 9.45-4.05-1.8 7.2-6.3 10.8-13.5 10.8-10.8 0-12.15-8.1-17.55-9.45-3.6-.9-6.75.45-9.45 4.05z"/></svg>
              <span className="font-semibold text-xl tracking-tight">{this.props.serviceName}</span>
            </div>
            <div className="block lg:hidden">
              <button onClick={this.toggleLinksVisible} className="flex items-center px-3 py-2 border rounded text-teal-200 border-teal-400 hover:text-white hover:border-white">
                <svg className="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
              </button>
            </div>
            <div className={`w-full ${this.state.linksVisible ? 'block' : 'hidden'} flex-grow lg:flex lg:items-center lg:w-auto`}>
              <Links />
              <div>
                <a href="#" className="inline-block text-sm px-4 py-2 leading-none border rounded text-white border-white hover:border-transparent hover:text-teal-500 hover:bg-white mt-4 lg:mt-0 mr-4">LogIn</a>
                <a href="#" className="inline-block text-sm px-4 py-2 leading-none border rounded text-white border-black hover:border-transparent hover:text-teal-500 hover:bg-white mt-4 lg:mt-0">SignUp</a>
              </div>
            </div>
          </nav>
      </div>
    );
  }
}

