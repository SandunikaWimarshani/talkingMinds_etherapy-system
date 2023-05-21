import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Table, Button } from 'reactstrap';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom';
import '../styles/viewUser.css';

function Userprofile() {
  const [Clients, setClients] = useState([]);
  const [successMessage, setSuccessMessage] = useState('');
  const [sessionId, setSessionId] = useState('');
  const [sessionDate, setSessionDate] = useState('');

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

  useEffect(() => {
    const fetchSessionData = async () => {
      const sessionSnapshot = await collection(db, 'sessions').get();
      if (!sessionSnapshot.empty) {
        const sessionData = sessionSnapshot.docs[0].data();
        setSessionId(sessionData.sessionId);
        setSessionDate(sessionData.date);
      }
    };

    fetchSessionData();
  }, []);

  const handleDelete = async (id) => {
    try {
      await deleteDoc(doc(db, 'Clients', id));
      setSuccessMessage('Appointment deleted successfully');
    } catch (error) {
      console.error('Error removing document: ', error);
    }
  };

  const deleteClients = async (id) => {
    const confirmDelete = window.confirm('Are you sure you want to delete this appointment?');
    if (confirmDelete) {
      try {
        await deleteDoc(doc(db, 'Clients', id));
        setSuccessMessage('Appointment deleted successfully');
      } catch (error) {
        console.error('Error removing document: ', error);
      }
    }
  };

  return (
    <Container>
      <Row>
        <Col lg='12'>
          <h1 className='booking_title'>Recent Clients</h1>
          {successMessage && <p>{successMessage}</p>}
          <Table className='table'>
            <thead>
              <tr>
                <th className='columns'>Username</th>
                <th className='columns'>Email</th>
              </tr>
            </thead>
            <tbody>
              {Clients.map((client) => (
                <tr key={client.id}>
                  <td>{client.username}</td>
                  <td>{client.email}</td>
                  <td>
                    <button className='view-btn'>
                      <Link to='/View_user'>View Profile</Link>
                    </button>
                    {' '}
                  </td>
                  <td>
                    <button className='dlt-btn' onClick={() => deleteClients(client.id)}>
                      <i className="ri-delete-bin-line"></i>
                    </button>
                    {' '}
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
          {/* {sessionId && (
            <div className='session-id'>
              <h3>Session ID: {sessionId}</h3>
              <p>Date: {sessionDate}</p>
            </div>
          )} */}
        </Col>
      </Row>
    </Container>
  );
}

export default Userprofile;
