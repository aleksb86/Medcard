import React from 'react';
import { Segment, Container, Responsive } from 'semantic-ui-react';

const FooterContent = ({ style_params }) =>
  <Container>
    <p>
      {`Medcard - ${new Date().getFullYear()}`}
    </p>
  </Container>

const Footer = () =>
  <>
    <Responsive minWidth={ Responsive.onlyTablet.minWidth }>
      <Segment inverted vertical style={{ padding: '2em 0em' }}>
        <FooterContent />
      </Segment>
    </Responsive>
    <Responsive { ...Responsive.onlyMobile }>
      <Segment inverted vertical mini>
        <FooterContent />
      </Segment>
    </Responsive>
  </>

export default Footer;