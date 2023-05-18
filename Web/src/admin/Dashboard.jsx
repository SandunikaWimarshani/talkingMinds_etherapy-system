import React, { useState, useEffect } from 'react';
import '../styles/dashboard.css';
import { Chart } from 'react-chartjs-2';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom'
import { Container, Row, Col, Table, Button } from 'reactstrap';


import { CircularProgressbar } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import Userprofile from './User_profile';


function Dashboard() {

  const [Clients, setClients] = useState([]);

  const navigate = useNavigate();
 
  useEffect(() => {
    const q = query(collection(db, 'Clients'), orderBy('date'));

    const unsubscribe = onSnapshot(q, (snapshot) => {
      const ClientsData = snapshot.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
      }));
      setClients(ClientsData);
    });

    return unsubscribe;
  }, []);
  return (
    <div>
      <div className='featuredGrid'>
        <div className='featured'>
          <div className='featuredItem'>
            <span className='featuredTitle'>
              <i className='ri-user-3-line'></i> COUNSELOR
            </span>
            <div className='featuredContainer'>
              <span className='featured_counselor'>06</span>
            </div>
          </div>
        </div>

        <div className='featured'>
          <div className='featuredItem'>
            <span className='featuredTitle'>
              <i className='ri-group-line'></i> USER
            </span>
            <div className='featuredContainer'>
              <span className='featured_counselor'>10</span>
            </div>
          </div>
        </div>

        <div className='featured'>
          <div className='featuredItem'>
            <span className='featuredTitle'>
              <i className='ri-calendar-line'></i> APPOINTMENTS
            </span>
            <div className='featuredContainer'>
              <span className='featured_counselor'>08</span>
            </div>
          </div>
        </div>
      </div>

      <Userprofile/>

      {/* <div className='charts'>
        <div className='top'>
          <h1 className='title'> Average Customer</h1>
         
        </div>
        <div className='bottom'>
          <div className='featuredChart'>
            <CircularProgressbar value={70} text={'70%'} strokeWidth={5}/>

          </div>
          </div>  
        
        
        
        
        <h2> chart </h2> */}
      
        {/* <Container>
      <Row>
        <Col lg='12'>
          <h1 className='booking_title'>Recent Users</h1>
          
          <Table className='table'>
            <thead>
              <tr>
                <th className='columns'>Username</th>
                <th className='columns'>Email</th>
               
                
                <th className='columns actions-column'>Actions</th>
              </tr>
            </thead>
            <tbody>
              {Clients.map((Clients) => (
                <tr key={Clients.id}>
                  <td>{Clients.username}</td>
                  <td>{Clients.email}</td>
                  
                  
                 
                </tr>
              ))}
            </tbody>
          </Table>
        </Col>
      </Row>
    </Container> */}
        {/* <ResponsiveContainer width= '100%' aspect = {4 / 1}>
          <LineChart data={data}>

          </LineChart>
        </ResponsiveContainer> */}
        
      </div>
    // </div>
  );
}

export default Dashboard;
