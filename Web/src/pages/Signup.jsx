/* eslint-disable no-unused-vars */
/* eslint-disable no-undef */
/* eslint-disable react/jsx-no-undef */
import React, {useState} from 'react'
import Head from '../components/head/Head'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import { Link } from 'react-router-dom'
import {  createUserWithEmailAndPassword } from "firebase/auth";


import { setDoc, doc } from 'firebase/firestore';
import { auth} from '../firebase config'
import { storage } from '../firebase config';
import { db} from '../firebase config'


import '../styles/signup.css'

function Signup() {

    const [email, setEmail] = useState('')
    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')
    const [confirmpassword, setConfirmPassword] = useState('')
    const [loading, setLoading] = useState(false)

    const signup = async(e) => {
        e.preventDefault()
        setLoading(true)

        try {
            const userCredential = await createUserWithEmailAndPassword(auth,email,password);

            const user = userCredential.user;
            console.log(user);

            
            
        } catch (error) {
           
        }

        await setDoc(doc(db, "users", user.uid), {
            uid: user.uid,
            email,
            displayName: username
        });
    }
    
  return (
    <Head title = 'signup'>
        <section>
            <Container>
                <Row>
                    <Col lg='6' className='auto_text'>
                        <h3 className='login_title'>
                            <center>
                            <Form className='auth_form' onSubmit={signup}>
                            <h1> SIGNUP </h1>

                               <FormGroup className='form_group'>
                                    <input type='email' className='email' placeholder='Enter Email' value={email} onChange={e => setEmail(e.target.value)}></input>
                                </FormGroup>
                                <FormGroup className='form_group'>
                                    <input type='text' className='user' placeholder='Enter Username' value={username} onChange={e => setUsername(e.target.value)}></input>
                                </FormGroup>

                                <FormGroup className='form_group'>
                                    <input type='password' className='pass' placeholder='Enter Password' value={password} onChange={e => setPassword(e.target.value)}></input>
                                </FormGroup>
                                <FormGroup className='form_group'>
                                    <input type='password' className='con_pass' placeholder='Confirm Password' value={confirmpassword} onChange={e => setConfirmPassword(e.target.value)}></input>
                                </FormGroup>

                                <button type='submit' className='buy_btn auth_btn1'>
                                    Create an Account
                                </button>
                                <p> Already have an account? <Link to= '/signin'> LOGIN </Link></p>
                            </Form>
                            </center>
                            
                        </h3>

                    </Col>
                </Row>
            </Container>
        </section>
    </Head>
  )
}

export default Signup