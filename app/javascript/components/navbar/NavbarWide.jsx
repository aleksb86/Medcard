import React, { Component } from 'react';
import { Menu, Image, Container } from 'semantic-ui-react';
import { withRouter } from 'react-router-dom';
import logo from 'gnu_head.svg';

class NavbarWide extends Component {

  render() {
    return (
      <Menu inverted fixed="top">
        <Container>
          <Menu.Item>
            <Image src={logo} size="mini" />
          </Menu.Item>
          {this.props.mainItems.map((item, i) =>
            <Menu.Item
              {...item}
              active={item.to === this.props.location.pathname}
              key={i}
            />
          )}
          <Menu.Menu position="right">
            {this.props.secondaryItems.map((item, i) => <Menu.Item {...item} key={i} />)}
          </Menu.Menu>
        </Container>
      </Menu>
    );
  }
}

export default withRouter(NavbarWide);
