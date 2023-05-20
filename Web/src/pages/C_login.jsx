import React, { useState } from 'react';
import { Container, Row, Col, Form, FormGroup } from 'reactstrap';
import { Link, useNavigate } from 'react-router-dom';

import { createUserWithEmailAndPassword } from 'firebase/auth';
import { auth } from '../firebase config';

import '../styles/login.css';

function CounselorLogin() {
  const [name, setname] = useState('');
  const [email, setemail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleCounselorLogin = async (e) => {
    e.preventDefault();

    try {
      const userCredential = await createUserWithEmailAndPassword(
        auth,
        email,
        password
      );

      // You can access the user data from the userCredential object
      const user = userCredential.user;
      console.log(user);

      // Redirect the user to the home page after sign up
      navigate('/list');
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <section>
      <Container>
        <Row>
          <Col lg="6" className="auto_text">
            <h3 className="login_title">
              <center>
                <Form className="auth_form" onSubmit={handleCounselorLogin}>
                  <h1> COUNSELOR LOGIN </h1>

                  <FormGroup className="form_group">
                    <input
                      type="text"
                      className="user"
                      placeholder="Enter Full Name"
                      value={name}
                      onChange={(e) => setname(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="email"
                      className="user"
                      placeholder="Enter Email"
                      value={email}
                      onChange={(e) => setemail(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="password"
                      className="pass"
                      placeholder="Enter Password"
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                    />
                  </FormGroup>

                  <button type="submit" className="buy_btn auth_btn">
                  <Link to="/dashboard">
                    Login
                    </Link>
                  </button>

                  <p>
                    Don't have an account?{' '}
                    <Link to="/create_couns">
                      Create your profile
                    </Link>
                  </p>
                </Form>
              </center>
            </h3>
          </Col>
        </Row>
      </Container>
    </section>
  );
}

export default CounselorLogin;
