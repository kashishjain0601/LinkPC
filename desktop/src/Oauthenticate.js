import React, { useEffect, useState } from 'react'
import { auth,provider } from './firebase'
import { signInWithPopup } from 'firebase/auth';
import { useNavigate } from 'react-router-dom'
import SignInButton from './SignInButton';
import { Button } from '@mui/material/';
import applogo from './assets/app_logo.png';
import LoginIcon from '@mui/icons-material/Login';
import Typography from '@mui/material/Typography';



function Oauthenticate() {
  const [value,setValue]=useState('')
  const handleClick=()=>{
  
    signInWithPopup(auth,provider).then((res)=>{
        setValue(res.user.email)
        localStorage.setItem("email",res.user.email)
    })
  }
  useEffect(()=>{
    setValue(localStorage.getItem('email'))
  })
  return (
    <div>
      {value?<SignInButton/>:
        <div>
        <div>
        <img  src={applogo} width="250" height="250" style={{marginTop:'5em'}}/>
        </div>
        <div>
        <Typography variant="h3" sx={{mb:'2em'}} color="white" component="h3">
            Link PC
        </Typography>;
        </div>
        <Button variant="contained" startIcon={<LoginIcon/>} onClick={handleClick}>Sign In With Google</Button>
        </div>
      }
    </div>
  )
}

export default Oauthenticate