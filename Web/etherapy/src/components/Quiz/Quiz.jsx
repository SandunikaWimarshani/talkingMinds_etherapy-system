import React from 'react'
import '../../styles/quiz.css'
import {Link} from 'react-router-dom';
import { getAuth, onAuthStateChanged } from "firebase/auth";

import {db} from '../../firebase config';
import { collection, addDoc,where,serverTimestamp, onSnapshot,query, orderBy, doc, updateDoc, getDocs, collectionRef } from 'firebase/firestore';
import { useEffect, useState } from 'react'

function Quiz() {
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
        typeOfTherapy: val,
      });

      
    };

  

  
  return (
    <div>
      <div>
        <div>
          <p>
            <span className='count'> Question 1 of 5</span>
          </p>
        </div>
        <h2 className='q1'> What type of therapy are you looking for?</h2>
        <div className='option-container'>
          <p className='option' onClick={(e) => updateClient("Individual")}>Individual</p>
          <p className='option' onClick={(e) => updateClient("Couple")}>Couple</p>
          <p className='option' onClick={(e) => updateClient("Group")}>Group</p>

        </div>

        <div className='button-container'>
          
          
          <button className='next'><Link to = '/Quiz2'>Next</Link></button>
        </div>
      </div>
    </div>
  )
}

export default Quiz