import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Table, Button } from 'reactstrap';
import { db } from '../firebase config';
import { collection, query, onSnapshot, orderBy, deleteDoc, doc } from 'firebase/firestore';
import { Link, useNavigate } from 'react-router-dom'
import '../styles/viewUser.css'

function CounselorProfile() {
  const [counselors, setClients] = useState([]);
  const [successMessage, setSuccessMessage] = useState('');

  const navigate = useNavigate();

  useEffect(() => {
    const q = query(collection(db, 'counselors'), orderBy('email'));

    const unsubscribe = onSnapshot(q, (snapshot) => {
      const counselorsData = snapshot.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
      }));
      setClients(counselorsData);
    });

    return unsubscribe;
  }, []);

  const handleDelete = async (id) => {
    try {
      await deleteDoc(doc(db, 'counselors', id));
      setSuccessMessage('Appointment deleted successfully');
    } catch (error) {
      console.error('Error removing document: ', error);
    }
  };


  const deletecounselors = async (id) => {
    const confirmDelete = window.confirm('Are you sure you want to delete this appointment?');
    if (confirmDelete) {
      try {
        await deleteDoc(doc(db, 'counselors', id));
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
          <h1 className='booking_title'>Recent Counselors</h1>
          {successMessage && <p>{successMessage}</p>}
          <Table className='table'>
            <thead>
              <tr>
               
                <th className='columns'>Email</th>
                <th className='columns'>Spacialities</th>
                <th className='columns'>Licening</th>
                <th className='columns'>Decription</th>
                
              
              </tr>
            </thead>
            <tbody>
              {counselors.map((counselors) => (
                <tr key={counselors.id}>
                 
                  <td>{counselors.email}</td>
                  <td>{counselors.spacialties}</td>
                  <td>{counselors.licening}</td>
                  <td>{counselors.description}</td>
                  
                  
                  
                  <td>
                    <button className='dlt-btn' onClick={() => deletecounselors(counselors.id)}>
                    <i class="ri-delete-bin-line"></i>
                    </button>
                    {' '}
                    
                  </td>

                  
                </tr>
              ))}
            </tbody>
          </Table>
        </Col>
      </Row>
    </Container>
  );
}

export default CounselorProfile;
