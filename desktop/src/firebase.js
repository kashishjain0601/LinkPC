// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import {getAuth, GoogleAuthProvider,signInWithPopup} from 'firebase/auth'
import { useNavigate } from "react-router-dom";

const firebaseConfig = {
  apiKey: "AIzaSyDusaM2TBnEDy7XmjMe9gN5lPEANtLDFBI",
  authDomain: "remote-pc-79b73.firebaseapp.com",
  databaseURL: "https://remote-pc-79b73-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "remote-pc-79b73",
  storageBucket: "remote-pc-79b73.appspot.com",
  messagingSenderId: "595665569416",
  appId: "1:595665569416:web:d06a88b2362988b142813d",
  measurementId: "G-S4FKL7KZME"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const auth=getAuth(app)
export const provider=new GoogleAuthProvider()

// export const signInWithGoogle=()=>{
//     signInWithPopup(auth,provider).then((result)=>{
//         const navigate=useNavigate()
//         console.log(result);
//         const check=result.user.emailVerified;
//         localStorage.setItem("verification",check);
//         console.log(check);
//         navigate('/home')
//     }).catch((error)=>{
//         console.log(error);
//     }); 
// }