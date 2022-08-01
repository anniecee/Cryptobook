import Axios from 'axios';
import React, { useEffect, useState } from 'react'
import './changePassword.css';
import 'react-toastify/dist/ReactToastify.css';
import { ToastContainer, toast } from 'react-toastify';

 function ChangePassword() {
    const USER_ID = localStorage.getItem("userID");

    const [currentPassword, setCurrentPassword] = useState("");
    const [newPassword, setNewPassword] = useState("");
    const [errMsg, setErrMsg] = useState("");
    const [password, setPassword] = useState("");
    useEffect(() => {
      Axios.get(`http://localhost:3001/user/${USER_ID}`).then((response) => {
        if(response.data){
          setCurrentPassword(response.data.password);
        } else {
          setErrMsg(response.data.message);
        }
      });
    }, []);

    const changePassword = () => {
      Axios.post(`http://localhost:3001/user/${USER_ID}/change-password`, {
        newPassword
      }).then((response) => {
        if(response.data){
          setCurrentPassword(response.data.newPassword);
          setNewPassword("");
          notify();
        }else{
          setErrMsg(response.data.message);
        }
      });
    };

    const notify = () => toast(`Your password has changed`, {
      position: "bottom-center",
      autoClose: 3000,
    });

  return (
    <div className="passwordContainer">
      <h1>Change Password</h1>
      <div>
        <img src="https://s3-us-west-2.amazonaws.com/shipsy-public-assets/shipsy/SHIPSY_LOGO_BIRD_BLUE.png"></img>
      </div>
      <div className="passwordForm">
        <p>Current Password: {currentPassword} </p>
          <label>New Password: </label>
          <input class="passwordInput" type="password" placeholder='New Password' onChange={
            (event)=>{ 
              setNewPassword(event.target.value);
            }
          }/>
      </div>
      <button id="changePasswordButton" onClick={changePassword}>Change Password</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
                    <ToastContainer />

    </div>
  )
}

export default ChangePassword
