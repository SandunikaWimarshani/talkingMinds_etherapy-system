/* eslint-disable no-undef */
import React, {useState} from 'react'
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import { Link} from 'react-router-dom';

//import { createUserWithEmailAndPassword, updateProfile } from 'firebase/auth';
//import { ref, uploadBytesResumable, getDownloadURL} from 'firebase/auth'
//import { signInWithEmailAndPassword } from 'firebase/auth';

//import {auth} from '../firebase config'
//import { storage } from '../firebase config'
//import { setDoc, doc } from 'firebase/firestore';

//import {db} from '../firebase config'

//import { toast } from 'react-toastify';




import '../styles/login.css'

function C_login() {

    const [name, setname] = useState('')
    const [email, setemail] = useState('')
    const [password, setPassword] = useState('');
    //const [file, setFile] = useState(null);
    //const [ setLoading] = useState(false);



    //const navigate = useNavigate()

    /*const C_login = async (e) => {
        e.preventDefault()
        setLoading(true)

        try {
            const user = userCredential.user;

            const userCredential = await signInWithEmailAndPassword(auth, name, email, password, file)

            const storageRef = ref(storage, 'images/${Date.now() + username')
            const uploadTask = uploadBytesResumable(storageRef, file)

            uploadTask.on(
                (error) => {
                toast.error(error.message);
            }, () => {
                getDownloadURL(uploadTask.snapshot.ref).then(async,
                    (downloadURL) => {

                        update counselor profile
                        await updateProfile(user, {
                            displayName: name,
                            photoURL: downloadURL,
                        });

                        // store counselor data in firebase databse
                        await setDoc(doc (db, 'users', user.uid),{
                            uid: user.uid,
                            displayName: name,
                            email,
                            photoURL: downloadURL,
                        });

                    });
                    
            }
            );

            
            
            setLoading(false)
            toast.success('Account created')
            navigate('/c_login')
            
          
            
        } catch (error) {
            setLoading(false)
           toast.error("Something went wrong");
            
            
        }*/
  

  return (
  
   
        <section>
            
            <Container>
                <Row>
                
                    <Col lg='6' className='auto_text'>
                        <h3 className='login_title'>
                            <center>
                            <Form className='auth_form' onSubmit={C_login}>
                            <h1> COUNSELOR LOGIN </h1>
                            <h5> We appreciate your participation. We require passionate, qualified counselors. We're interested in finding out more about you.</h5>
                                <FormGroup className='form_group'>
                                    <input type='text' className='user' placeholder='Enter Full Name' value={name} onChange={e => setname(e.target.value)}></input>
                                </FormGroup>
                                
                                <FormGroup className='form_group'>
                                    <input type='email' className='user' placeholder='Enter Email' value={email} onChange={e => setemail(e.target.value)}></input>
                                </FormGroup>

                                <FormGroup className='form_group'>
                                    <input type='password' className='pass' placeholder='Enter Password' value={password} onChange={e => setPassword(e.target.value)}></input>
                                </FormGroup>

                                <FormGroup className='form_group'>
                                  <input type='file'  onChange={(e) => setFile(e.target.files[0])}
                                  />
                                </FormGroup>

                                <button type='submit' className='buy_btn auth_btn'><Link to= '/dashboard'> Create account </Link>
                                    
                                </button>

                                
                            </Form>
                            </center>
                            
                        </h3>

                    </Col>
                    
                    
                </Row>
            </Container>

           
        </section>

  
  )
  
  }

export default C_login