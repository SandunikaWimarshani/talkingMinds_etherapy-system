import {useState, useEffect} from 'react'
import { onAuthStateChange } from 'firebase/auth'
import { auth } from '../firebase config'

function useAuth() {

    const [currentUser, setCurrentUser] = useState({})

    useEffect (() => {
        onAuthStateChange(auth, (user) =>{
            if(user){
                setCurrentUser(user)
            }
            else{
                setCurrentUser(null)
            }
        })
    })
  return {
    currentUser,
  }
}

export default useAuth