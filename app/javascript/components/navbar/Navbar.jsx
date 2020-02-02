import React, { Component } from 'react';
import { Container, Responsive } from 'semantic-ui-react';
import NavbarWide from './NavbarWide';
import NavbarMobile from './NavbarMobile';
import Footer from '../footer/Footer';

const NavbarChildren = ({ children, style }) => (
  <div className={style}>
    <div className="content">
      {children}
    </div>
    <Footer />
  </div>
);

export default class Navbar extends Component {
  state = {
    visible: false
  };

  handlePusher = () => {
    const { visible } = this.state;
    if (visible) this.setState({ visible: false });
  };

  handleToggle = () => this.setState({ visible: !this.state.visible });

  render() {
    const { children, secondaryItems, mainItems } = this.props;
    const { visible } = this.state;

    return (
      <div>
        <Responsive {...Responsive.onlyMobile}>
          <NavbarMobile
            secondaryItems={secondaryItems}
            onPusherClick={this.handlePusher}
            onToggle={this.handleToggle}
            mainItems={mainItems}
            visible={visible}
          >
            <NavbarChildren style={"sticky-content-mobile"}>{children}</NavbarChildren>
          </NavbarMobile>
        </Responsive>
        <Responsive minWidth={Responsive.onlyTablet.minWidth}>
          <NavbarWide secondaryItems={secondaryItems} mainItems={mainItems} onItemClick={item => this.onItemClick(item)} />
          <NavbarChildren style={"sticky-content"}>{children}</NavbarChildren>
        </Responsive>
      </div>
    );
  }
}
