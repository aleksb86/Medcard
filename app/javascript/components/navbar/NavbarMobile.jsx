import React, { Component } from 'react';
import { Sidebar, Menu, Icon, Image, Segment } from 'semantic-ui-react';
import logo from 'gnu_head.svg';

const NavbarMobile = ({ children, secondaryItems, mainItems, onPusherClick, onToggle, visible }) =>
  (
    <Sidebar.Pushable>
      <Sidebar
        as={Menu}
        animation="overlay"
        icon="labeled"
        vertical
        inverted
        visible={visible}
      >
        <Menu.Item>
          <Icon name="close" onClick={onToggle} />
        </Menu.Item>
        {mainItems.map((item, i) =>
          <Menu.Item
            {...item}
            onClick={onToggle}
            // active={item.to === item.to}
            key={i}
          />
        )}
      </Sidebar>
      <Sidebar.Pusher
        dimmed={visible}
        onClick={onPusherClick}
        // style={{ minHeight: "50vh" }}
      >
          <Menu secondary pointing>
            <Menu.Item>
              <Image src={logo} size="mini" />
            </Menu.Item>
            <Menu.Item onClick={onToggle}>
              <Icon name="sidebar" />
            </Menu.Item>
            <Menu.Menu position="right">
              {secondaryItems.map((item, i) => <Menu.Item {...item} key={i} />)}
            </Menu.Menu>
          </Menu>
          {children}
      </Sidebar.Pusher>
    </Sidebar.Pushable>
  )

export default NavbarMobile;
