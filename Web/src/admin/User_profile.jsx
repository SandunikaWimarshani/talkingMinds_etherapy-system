import React from 'react';
import { Container, Row, Col } from 'reactstrap';

import '../styles/user.css';
import user from '../assets/images/user.jpg';

function User_profile() {
  return (
    <div>
      <div className="user_img">
        <img src={user} alt="" />
      </div>
      <Container>
        <Row>
          <Col md={6}>
            <div className="user_info">
              <h3>User Information</h3>
              <p>Name: John Doe</p>
              <p>Email: johndoe@gmail.com</p>
              <p>Phone: 123-456-7890</p>
              <p>Address: 123 Main St, Anytown, USA</p>
            </div>
          </Col>
          <Col md={6}>
            <div className="user_actions">
              <h3>User Actions</h3>
              <button className="btn">Edit Profile</button>
              <button className="btn">Change Password</button>
              <button className="btn">Delete Account</button>
            </div>
          </Col>
        </Row>
      </Container>
    </div>
  );
}

export default User_profile;
