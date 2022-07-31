import Axios from 'axios';
import React, { useEffect, useState } from 'react'

function ChangePassword() {
    const USER_ID = localStorage.getItem("userID");

    const [currentPassword, setCurrentPassword] = useState("");
    const [newPassword, setNewPassword] = useState("");
    const [errMsg, setErrMsg] = useState("");

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
        }else{
          setErrMsg(response.data.message);
        }
      });
    };

  return (
    <div>
      <h1>Change Password</h1>
      <div className="LoginForm">
        <p>Current Password: {currentPassword}</p>
          <input type="password" placeholder='Password' onChange={
            (event)=>{ 
              setNewPassword(event.target.value);
            }
          }/>
          <button onClick={changePassword}>Change Password</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
      </div>
    </div>
  )
}

export default ChangePassword
