import React, { Component } from 'react';
import { Menu, Image, Container } from 'semantic-ui-react';
import { Link, withRouter } from 'react-router-dom';
import logo from 'gnu_head.svg';

class Navbar extends Component {

  render() {
    return (
      <Menu pointing secondary fixed="top">
        <Container>
          <Menu.Item>
            <Image src={logo} size="mini" />
          </Menu.Item>
          {this.props.routes.map((route, i) =>
            <Menu.Item
              key={i}
              as={Link}
              to={route.route}
              active={route.route === this.props.location.pathname}
              content={route.name}
            />
          )}
          <Menu.Menu position="right">
            {this.props.right_items.map((item, i) =>
              <Menu.Item
                key={i}
                as={Link}
                to={item.route}
                content={item.name}
              />
            )}
          </Menu.Menu>
        </Container>
      </Menu>
    );
  }
}

export default withRouter(Navbar);
