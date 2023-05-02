// import  { useEffect, useState} from 'react'
// import {db} from '../firebase config'
// import { collection, getDocs } from 'firebase/firestore'

// function useGetData(collectionName) {

//     const [data, setData] = useState([])
//     const collectionRef = collection(db, collectionName)

//     useEffect(() => {
//         const getData = async() => {
//             const data = await getDocs(collectionRef)
//             setData(data.docs.map(doc => ({...doc.data(), id: doc.email})))
//         }
//         getData()
//     }, [])
//   return {data};
// }

// export default useGetData