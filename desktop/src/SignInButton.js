import React,{useState} from 'react'
import { Auth } from 'firebase/auth'
import { Button, Card,CardContent, FormLabel, TextField } from '@mui/material'
import LogoutIcon from '@mui/icons-material/Logout'

    function SignInButton() {
        const [user_name,setUser_name]=useState('')
        const [pswd,setPswd]=useState('')
        const [IPv4,setIPv4]=useState('')
        const [device_name,setDevice_name]=useState('')

    const handleName=(e)=>{
        setUser_name(e.target.value);
    }
    const handlePassword=(e)=>{
        setPswd(e.target.value);
    }
    const handleIPv4=(e)=>{
        setIPv4(e.target.value);
    }
    const handleDevicename=(e)=>{
        setDevice_name(e.target.value);
    }


    const sendData=async(e)=>{
        e.preventDefault();
        const res=await fetch("https://remote-pc-79b73-default-rtdb.asia-southeast1.firebasedatabase.app/users.json",{
            method:"POST",
            headers:{
                "Content-Type":"application/json",
            },
            body:JSON.stringify({
                IPv4,
                device_name,
                pswd,
                user_name
            })
        })

        if(res){
            setUser_name('')
            setPswd('')
            setIPv4('')
            setDevice_name('')
            alert("data stored")
        }
    }

    const logout=()=>{
        localStorage.clear()
        window.sessionStorage.clear()
        caches.keys().then((names) => {
            names.forEach((name) => {
              caches.delete(name);
            });
          });
        alert('Complete Cache Cleared')
        window.location.reload()
    }
    return (
        <div>
            <Card className='connection' sx={{ mx: '30%',mt:'10%' }}>
                <CardContent>
            <form>
                <div>
                    <FormLabel>Add Device</FormLabel>
                </div>
                <div>
                <TextField id="outlined-basic" label="Username" sx={{ mb:'1em', mt:'1em' }}  variant="outlined" onChange={handleName} />
                </div>
                <div>
                <TextField id="outlined-basic" label="Password" sx={{ mb:'1em' }} variant="outlined" onChange={handlePassword} />
                </div>
                <div>
                <TextField id="outlined-basic" label="Local Ipv4" sx={{ mb:'1em' }} variant="outlined" onChange={handleIPv4} />
                </div>
                <div>
                <TextField id="outlined-basic" label="Device Name" sx={{ mb:'1em' }} variant="outlined" onChange={handleDevicename} />
                </div>
                <div>
                <Button variant="contained" onClick={sendData}>Connect</Button>
                </div>
            </form>
            </CardContent>
            </Card>
            <Button variant="contained" sx={{mt:'1em'}} startIcon={<LogoutIcon/>} onClick={logout}>Logout</Button>
        </div>
      )
}

export default SignInButton

