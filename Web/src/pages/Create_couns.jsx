import React, { useState } from 'react';
import { Container, Row, Col, Form, FormGroup } from 'reactstrap';
import { useNavigate } from 'react-router-dom';
import { collection, addDoc } from 'firebase/firestore';
import { db } from '../firebase config';
import { getStorage, ref, uploadBytes } from 'firebase/storage';
import {  storage } from '../firebase config';
import { Link } from 'react-router-dom'

import '../styles/createprofile.css'


function CreateCouns() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [specialties, setSpecialties] = useState('');
  const [licening, setLicening] = useState('');
  const [description, setDescription] = useState('');
  const [image, setImage] = useState(null);

//   const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleCreateProfile = async (e) => {
    e.preventDefault();
  
   
     try {
      // Create a new document in the "counselors" collection
      const docRef = await addDoc(collection(db, 'counselors'), {
        name,
        email,
        specialties,
        licening,
        description,
        imageUrl: await uploadImage(),
      });
      console.log('Counselor profile created with ID:', docRef.id);

  
       // Redirect the user to the home page after creating the profile
       navigate('/');
    } catch (error) {
      console.error('Error creating counselor profile:', error);
    }
  };

  // Function to upload image to Firebase Storage and get its download URL
    const uploadImage = async () => {
    // Create a reference to the Firebase Storage root directory
    const storageRef = ref(storage, 'images');
  
    // Create a reference to the selected image file
    const fileRef = storageRef.child(image.name);
  
    // Upload the image bytes to Firebase Storage
    await uploadBytes(fileRef, image);
  
    // Get the download URL of the uploaded image
    return await fileRef.getDownloadURL();
  }

  const handleImageChange = (e) => {
    if (e.target.files[0]) {
      setImage(e.target.files[0]);
    }
  };

  
  

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
                      type="password"
                      className="pass"
                      placeholder="Enter Password"
                    //   value={password}
                    //   onChange={(e) => setPassword(e.target.value)}
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
                     
                      onChange={(e) => setImage(e.target.files[0])}
                    />
                  </FormGroup>

                  

                  <button type="submit" className="create_btn"><Link to= '/Counselor_Profile'>
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
