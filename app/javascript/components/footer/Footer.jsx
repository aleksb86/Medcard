import React from 'react';
import { Segment, Container, Icon } from 'semantic-ui-react';

const Footer = () =>
  <Segment>
    <Container textAlign="center">
      {`Medcard - ${new Date().getFullYear()}`}
      <Icon name="cog" />
    </Container>
  </Segment>

export default Footer;