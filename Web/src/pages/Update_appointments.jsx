import React, { useState, useEffect } from 'react';
import { db } from '../firebase config';
import { Container, Row, Col, Form, FormGroup } from 'reactstrap'
import { collection, query, onSnapshot, orderBy, deleteDoc, doc, where, getDoc, updateDoc } from 'firebase/firestore';
import { useParams } from 'react-router-dom';

import '../styles/update.css'
 // assuming you have already initialized Firebase in a separate file



const UpdateDetails = ( props ) => {
  // var [name, setName] = useState('');
  // var [email, setEmail] = useState('');
  // var [counselorName, setCounselorName] = useState('');
  // var [date, setDate] = useState('');
  // var [time, setTime] = useState('');

  const { id } = useParams();

  const [data,setData] = useState("");
  const {
  name,
  email,
  counselorName,
  date,
  time
  } = data;

  useEffect(() =>{
    id && getSingleUser();
  })

const getSingleUser = async () =>{
  const docRef = doc(db, 'appointment', id);
  const snapshot = await getDoc(docRef);
  if(snapshot.exists()){
    setData({...snapshot.data()});
    console.log(data)
  }
}

const handleChange = (e) => {
  setData({...data, [e.target.name]: e.target.value});
}

const handleSubmit = async (e) =>{
  e.preventDefault();

  await updateDoc(doc(db,"appointment",id),{
    ...data
  })
}
  // this useEffect will fetch the existing details from Firebase and populate the state when the component mounts
//   useEffect(() => {
//     db.collection('users').doc(userId).get().then((doc) => {
//       if (doc.exists) {
//         const data = doc.data();
//         setName(data.name);
//         setEmail(data.email);
//         setCounselorName(data.counselorName);
//         setDate(data.date);
//         setTime(data.setTime);
//       }
//     }).catch((error) => {
//       console.log('Error fetching user details: ', error);
//     });
//   }, [userId]);

// const [appointments, setAppointments] = useState('');

//   useEffect(() => {
//     const q = query(collection(db, 'appointment'), where('email', '==', 'Mary7@gmail.com'), where('date', '==', '2023-05-05'));

//     const unsubscribe = onSnapshot(q, (snapshot) => {
//       const appointmentData = snapshot.docs.map((doc) => ({
//         id: doc.id,
//         ...doc.data(),
//       }));
//       //console.log(appointmentData)
//       setAppointments(appointmentData[0]);
//       setName(appointmentData[0].name)
//         setEmail(appointmentData[0].email);
//         setCounselorName(appointmentData[0].counselorName);
//         setDate(appointmentData[0].date);
//         setTime(appointmentData[0].setTime);
//     });

//     //console.log(appointments)
//     //return unsubscribe;
//   }, []);



  // async function handleSubmit (event)  {
  //   event.preventDefault(); // prevent the default form submission behavior

    // update the user details in Firebase
    // db.collection('appointment').doc(id).update({
    //   name,
    //   email,
    //   counselorName,
    //   date,
    //   time
    // })
    // .then(() => {
    //   console.log('User details updated successfully!');
    //   // update the state with the new values from Firebase
    //   setName(name);
    //   setEmail(email);
    //   setCounselorName(counselorName);
    //   setDate(date);
    //   setTime(time)
    // })
    // .catch((error) => {
    //   console.error('Error updating user details: ', error);
    // });
    
    // const docRef = doc(db, 'appointment', id);
    // const docSnap = await getDoc(docRef);

    // await updateDoc(docRef, {
    //     name: name,
    //   email: email,
    //   counselorName: counselorName,
    //   date: date,
    //   time: time
    // })
    // .then(() => {
    //       console.log('User details updated successfully!');
    //       // update the state with the new values from Firebase
    //       setName(name);
    //       setEmail(email);
    //       setCounselorName(counselorName);
    //       setDate(date);
    //       setTime(time)
    //     })
    //     .catch((error) => {
    //       console.error('Error updating user details: ', error);
    //     });
  //};

  

  
  return (

    <Container>
      <Row>
        <Col lg='8'>
        <form classname='box1' onSubmit={handleSubmit}>
        <h1><center> EDIT APPOINTMENT </center> </h1>

        <FormGroup className='box_group1'>
      <label htmlFor="name" className='topic1'>Your Name:</label>
      <input className='tboxName1' type="text" id="name" value={name} onChange={handleChange} />
      </FormGroup>

      <FormGroup className='box_group1'>
        <label htmlFor="email" className='topic1'>Email:</label>
      <input className='tboxEmail1' type="email" id="email" value={email} onChange={handleChange} />
      </FormGroup>

      <FormGroup className='box_group1'>
        <label htmlFor="counselorName" className='topic1'>Counselor Name:</label>
      <input className='tboxCName1' type="text" id="name" value={counselorName} onChange={handleChange} />
      </FormGroup>

      <FormGroup className='box_group1'>
        <label htmlFor="date" className='topic1'>Date:</label>
      <input className='tboxDate1' type="date" id="date" value={date} onChange={handleChange} />
      </FormGroup>

      <FormGroup className='box_group1'>
        <label htmlFor="time" className='topic1'>Time:</label>
      <input className='tboxTime1' type="time" id="time" value={time} onChange={handleChange} />
      </FormGroup>

      <button className='book_btn1'>Update </button>
    </form>

        </Col>
      </Row>
    </Container>
    
  );
};

export default UpdateDetails;
