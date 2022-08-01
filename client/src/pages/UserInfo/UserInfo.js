import Axios from 'axios';
import React, { useEffect, useState } from 'react'
import './userInfo.css';

function UserInfo() {
  const USER_ID = localStorage.getItem("userID");

  const [user, setUser] = useState({});
  const [errMsg, setErrMsg] = useState("");

  useEffect(() => {
    Axios.get(`http://localhost:3001/user/${USER_ID}`).then((response) => {
      if(response.data){
        setUser(user => ({...user, ...response.data}));
        console.log(user);
      } else {
        setErrMsg(response.data.message);
      }
    });
  }, []);

  return (
    <div className='UserInfoDisplay'>
      <h1>My Profile</h1>
      {/* Display error message if exists */}
      <img height="250" width="300" src="https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"></img>
      {errMsg && <h2 style={{color: 'red'}}>{errMsg}</h2>}
       <p>My Name: {user.name || "Empty"}</p>
       <p>My Username: {user.userName_user || "Empty"}</p>
       <p>My UserID: {user.userID}</p>
       <p>My LoginID: {user.loginID}</p>
       <p>My Email: {user.email || "Empty"}</p>
       <p>My Follower Count: {user.followerCount}</p>
       <p>My Following Count: {user.followingCount}</p>
       <p>My Password: {user.password}</p>
    </div>
  )
}

export default UserInfo