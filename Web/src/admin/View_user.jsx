import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Table, Button } from 'reactstrap';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom'
import '../styles/list-appointments.css'

function ViewUser() {
  const [Clients, setClients] = useState([]);
  const [successMessage, setSuccessMessage] = useState('');

  const navigate = useNavigate();

  useEffect(() => {
    const q = query(collection(db, 'Clients'), orderBy('email'));

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
    <Container>
      <Row>
        <Col lg='12'>
          <h1 className='booking_title'>User Profiles</h1>
          {successMessage && <p>{successMessage}</p>}
          <Table className='table'>
            <thead>
              <tr>
                <th className='columns'>Username</th>
                <th className='columns'>Email</th>
                <th className='columns'>Age</th>
                <th className='columns'>Relationship Status</th>
                <th className='columns'>Type of therapy </th>
                <th className='columns'>Concern </th>
                <th className='columns'>Therapy Before (Yes/No) </th>
                
                
              </tr>
            </thead>
            <tbody>
              {Clients.map((Clients) => (
                <tr key={Clients.id}>
                  <td>{Clients.username}</td>
                  <td>{Clients.email}</td>
                  <td>{Clients.age}</td>
                  <td>{Clients.relationshipstatus}</td>
                  <td>{Clients.typeOfTherapy}</td>
                  <td>{Clients.concern}</td>
                  <td>{Clients.therapybefore}</td>
                  
                  
                </tr>
              ))}
            </tbody>
          </Table>
        </Col>
      </Row>
    </Container>
  );
}

export default ViewUser;
