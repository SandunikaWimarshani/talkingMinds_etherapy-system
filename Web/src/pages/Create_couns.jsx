import React, { useState } from 'react';
import { Container, Row, Col, Form, FormGroup } from 'reactstrap';
import { useNavigate } from 'react-router-dom';
import { collection, addDoc } from 'firebase/firestore';
import { db } from '../firebase config';
import { getStorage, ref, uploadBytes } from 'firebase/storage';
import {  storage } from '../firebase config';
import { Link } from 'react-router-dom'

import '../styles/createprofile.css';



function CreateCouns() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [specialties, setSpecialties] = useState('');
  const [licening, setLicening] = useState('');
  const [description, setDescription] = useState('');
  //const [image, setImage] = useState(null);



 

//   const [password, setPassword] = useState('');
  // const navigate = useNavigate();

 

  const handleCreateProfile = async (e) => {
    e.preventDefault();

    if (name == '' || email == '' || specialties == '' || licening == '' || description == '' ) return;
 

    try{
      await addDoc(collection(db, "counselors"),
       {
        name: name,
        email: email,
        specialties: specialties,
        licening: licening,
        description: description,
        image: "image",
    });
  }catch(error){
console.log(error)
  }
  }
   
  
  

  return (
    <section>
      <Container>
        <Row>
          <Col lg="6" className="auto_text">
            <h3 className="login_title">
              <center>
                <Form className="auth_form_profile" onSubmit={handleCreateProfile}>
                  <h1>Create Counselor Profile</h1>
                    <h4> We appreciate your participation. We require passionate, qualified counselors. We're interested in finding out more about you.</h4>

                    <FormGroup className="form_group">
                    <input
                      type="text"
                      className="user"
                      placeholder="Enter Full Name"
                      value={name}
                      onChange={(e) => setName(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="email"
                      className="user"
                      placeholder="Enter Email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                    />
                  </FormGroup>

                  

                  <FormGroup className="form_group">
                    <input
                      type="specialties"
                      className="user"
                      placeholder="Enter your specialties"
                      value={specialties}
                      onChange={(e) => setSpecialties(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="licening"
                      className="user"
                      placeholder="Enter Your License number"
                      value={licening}
                      onChange={(e) => setLicening(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="description"
                      className="user_des"
                      placeholder="Enter more about you"
                      value={description}
                      onChange={(e) => setDescription(e.target.value)}
                    />
                  </FormGroup>

                  <FormGroup className="form_group">
                    <input
                      type="file"
                      className='img_class'
                     
                     // onChange={(e) => setImage(e.target.files[0])}
                    />
                  </FormGroup>
                  

                  <button type="submit" className="create_btn">
                    <Link to= '/dashboard'>
                    Create Profile
                    </Link>
                  </button>
                </Form>
              </center>
            </h3>
          </Col>
        </Row>
      </Container>
    </section>
  );
}

export default CreateCouns;
