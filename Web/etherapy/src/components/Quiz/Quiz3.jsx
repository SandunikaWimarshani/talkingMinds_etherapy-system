import React from 'react'
import '../../styles/quiz.css'
import {Link} from 'react-router-dom';
import { getAuth, onAuthStateChanged } from "firebase/auth";

import {db} from '../../firebase config';
import { collection, addDoc,where,serverTimestamp, onSnapshot,query, orderBy, doc, updateDoc, getDocs, collectionRef } from 'firebase/firestore';
import { useEffect, useState } from 'react'


function Quiz3() {

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
        relationshipstatus: val,
      });

      
    };

  
  return (
    <div>
      <div>
        <div>
          <p>
            <span className='count'> Question 3 of 5</span>
          </p>
        </div>
        <h2 className='q1'> What is your realtionship status?</h2>
        <div className='option-container'>
          <p className='option' onClick={(e) => updateClient("Single")}>Single</p>
          <p className='option' onClick={(e) => updateClient("Married")}>Married</p>
          <p className='option' onClick={(e) => updateClient("In a relationship")}>In a relationship</p>
          <p className='option' onClick={(e) => updateClient("Seperated")}>Seperated</p>
          <p className='option' onClick={(e) => updateClient("Divorced")}>Divorced</p>
          <p className='option' onClick={(e) => updateClient("Widwowed")}>Widwowed</p>

        </div>

        <div className='button-container'>
          <button className='pre'><Link to = '/Quiz2'>Previous</Link></button>
          
          <button className='next'><Link to = '/Quiz4'>Next</Link></button>
        </div>
      </div>
    </div>
  )
}

export default Quiz3