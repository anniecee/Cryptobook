import Axios from 'axios';
import React, { useEffect, useState } from 'react'
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './changeUsername.css';

 function ChangeUsername() {
    const USER_ID = localStorage.getItem("userID");

    const [currentUsername, setCurrentUsername] = useState("");
    const [newUsername, setNewUsername] = useState("");
    const [errMsg, setErrMsg] = useState("");
    
    useEffect(() => {
      Axios.get(`http://localhost:3001/user/${USER_ID}`).then((response) => {
        if(response.data){
          setCurrentUsername(response.data['userName_user']);
        } else {
          setErrMsg(response.data.message);
        }
      });
    }, []);

    const changeUsername = () => {
      Axios.post(`http://localhost:3001/user/${USER_ID}/change-username`, {
        newUsername
      }).then((response) => {
        if(response.data){
          setCurrentUsername(response.data.newUsername);
          notify(response.data.newUsername);
          setNewUsername("");
        }else{
          setErrMsg(response.data.message);
        }
      });
    };

  const notify = (username) => toast(`Your username has changed to ${username}`, {
    position: "bottom-center",
    autoClose: 3000,
  }
    );

  return (
    <div className="usernameContainer">
      <h1>Change Username</h1>
      <div>
        <img src="https://s3-us-west-2.amazonaws.com/shipsy-public-assets/shipsy/SHIPSY_LOGO_BIRD_BLUE.png"></img>
      </div>
      <div className="usernameForm">
        <p>Current Username: {currentUsername}</p>
          <label>New Username: </label>
          <input class="usernameInput" type="name" placeholder='Confirm Username' onChange={
            (event)=>{ 
              setNewUsername(event.target.value);
            }
          }/>
      </div>
      <button id="changeUsernameButton" onClick={changeUsername}>Change Username</button>
          <h1 style={{color: 'red'}}>{errMsg}</h1>
          <ToastContainer />
    </div>
  )
}

export default ChangeUsername
