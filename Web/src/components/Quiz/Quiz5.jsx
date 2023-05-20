import React from 'react'
import '../../styles/quiz.css'
import {Link} from 'react-router-dom';
import { getAuth, onAuthStateChanged } from "firebase/auth";

import {db} from '../../firebase config';
import { collection, addDoc,where,serverTimestamp, onSnapshot,query, orderBy, doc, updateDoc, getDocs, collectionRef } from 'firebase/firestore';
import { useEffect, useState } from 'react'


import start from '../../assets/images/start1.jpg'

function Quiz5() {
  const [showPopup, setShowPopup] = useState(false);

  const collectionRef = collection(db, "Clients");
  var docid;
  //const email = firebase.auth().currentUser.email;

  
    const updateClient = async (val) => {
      var email;
      const auth = getAuth();
      onAuthStateChanged(auth, (user) => {
        if (user) {
          email = user.email;
        } 
      });
      const filteredRef = query(
        collectionRef,
        where(`email`, "!=", `${email}`)
      );

      const querySnapshot = await getDocs(filteredRef);
      docid = await querySnapshot.docs[0].id;
      console.log(docid);


      const taskDocRef = doc(db, 'Clients', docid);
      await updateDoc(taskDocRef, {
        concern: val,
      });

      
    };
  return (
    
    <div>
       <div>
      <div className={showPopup ? 'overlay' : ''} onClick={() => setShowPopup(false)}>
        {showPopup && (
          <div className='popup'>
            <center>
            <img src={start} alt='' className='popupimg'/>

            </center>
            
            <h2 className='wait'> We're waiting for you! Now you can choose your counselor...</h2>

            <button onClick={() => setShowPopup(true)} className='btnpop'><Link to = '/List'>OK</Link></button>
            <button onClick={() => setShowPopup(false)} className='btnpop'>Close</button>
          </div>
        )}
      </div>
        <div>
          <p>
            <span className='count'> Question 5 of 5</span>
          </p>
        </div>
        <h2 className='q1'> Please select all issues you have experienced or been concerned with recently</h2>
        <div className='option-container'>
          <p className='option' onClick={(e) => updateClient("Trouble concentrating on simple things")}>Trouble concentrating on simple things</p>
          <p className='option' onClick={(e) => updateClient("Depression")}>Depression</p>
          <p className='option' onClick={(e) => updateClient("Feeling like a failure")}>Feeling like a failure</p>
          <p className='option' onClick={(e) => updateClient("Feeling tired or low energy")}>Feeling tired or low energy</p>
          <p className='option' onClick={(e) => updateClient("Anxiety or panic attacts")}>Anxiety or panic attacts</p>
          <p className='option' onClick={(e) => updateClient("Moving or speaking slowly")}>Moving or speaking slowly</p>
          <p className='option' onClick={(e) => updateClient("None of the above")}>None of the above</p>
          

        </div>

        <div className='button-container'>
          <button className='pre'><Link to = '/Quiz4'>Previous</Link></button>
          <button className='submit'onClick={() => setShowPopup(true)}>Done</button>


          
        </div>
      </div>
    </div>
  )
}

export default Quiz5