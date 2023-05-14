/* eslint-disable no-unused-vars */
/* eslint-disable react/jsx-no-undef */
import React, {useState} from 'react'
import Head from '../components/head/Head'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import { Link, useNavigate } from 'react-router-dom';
import { signInWithEmailAndPassword } from 'firebase/auth';
import {auth} from '../firebase config'


import '../styles/admin.css'

function Admin() {

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false)
    const navigate = useNavigate()

    const Signin = async (e) => {
        e.preventDefault()
        setLoading(true)

        try {

            const userCredential = await signInWithEmailAndPassword(auth, username, password)

            const user = userCredential.user
            console.log(user)
            setLoading(false)
            
            navigate('/')
            
        } catch (error) {
            setLoading(false)
            
            
        }
    }
  return (
    <Head title = 'login'>
        
        <section>
            <Container>
                <Row>
            
                    <Col lg='6' className='auto_text'>
                        <h3 className='login_title'>
                            <center>
                            <Form className='auth_form' onSubmit={Signin}>
                            <h1> ADMIN LOGIN </h1>
                                <FormGroup className='form_group'>
                                    <input type='text' className='user' placeholder='Enter Username' value={username} onChange={e => setUsername(e.target.value)}></input>
                                </FormGroup>

                                <FormGroup className='form_group'>
                                    <input type='password' className='pass' placeholder='Enter Password' value={password} onChange={e => setPassword(e.target.value)}></input>
                                </FormGroup>

                               
                                <button type='submit' className='buy_btn auth_btn1'><Link to= '/dashboard'> Create account </Link> </button>
                               
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

export default Admin