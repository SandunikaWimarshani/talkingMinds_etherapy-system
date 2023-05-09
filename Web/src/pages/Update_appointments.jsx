// import React, { useState, useEffect } from 'react';
// import { db } from '../firebase config';
//  // assuming you have already initialized Firebase in a separate file

// const UpdateDetails = ({ userId }) => {
//   const [name, setName] = useState('');
//   const [email, setEmail] = useState('');
//   const [counselorName, setCounselorName] = useState();
//   const [date, setDate] = useState();
//   const [time, setTime] = useState();

//   // this useEffect will fetch the existing details from Firebase and populate the state when the component mounts
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

//   const handleSubmit = (event) => {
//     event.preventDefault(); // prevent the default form submission behavior

//     // update the user details in Firebase
//     db.collection('users').doc(userId).update({
//       name,
//       email,
//       counselorName,
//       date,
//       time
//     })
//     .then(() => {
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
//   };

//   return (
//     <form onSubmit={handleSubmit}>
//       <label htmlFor="name">Name:</label>
//       <input type="text" id="name" value={name} onChange={(e) => setName(e.target.value)} />

//       <label htmlFor="email">Email:</label>
//       <input type="email" id="email" value={email} onChange={(e) => setEmail(e.target.value)} />

//       <label htmlFor="counselorName">Counselor Name:</label>
//       <input type="text" id="name" value={counselorName} onChange={(e) => setCounselorName(e.target.value)} />

//       <label htmlFor="date">Date:</label>
//       <input type="date" id="date" value={date} onChange={(e) => setDate(e.target.value)} />

//       <label htmlFor="time">Time:</label>
//       <input type="time" id="time" value={time} onChange={(e) => setTime(e.target.value)} />

//       <button type="submit">Update Details</button>
//     </form>
//   );
// };

// export default UpdateDetails;
