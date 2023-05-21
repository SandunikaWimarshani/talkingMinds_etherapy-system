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

      </div>
  );
}

export default Dashboard;
