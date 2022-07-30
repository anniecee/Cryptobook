import Axios from 'axios';
import React, { useEffect, useState } from 'react'

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
    <div>
      <h1>User Info</h1>
      {/* Display error message if exists */}
      {errMsg && <h2 style={{color: 'red'}}>{errMsg}</h2>}
       <p>Name: {user.name || "Empty"}</p>
       <p>Username: {user.userName_user || "Empty"}</p>
       <p>UserID: {user.userID}</p>
       <p>LoginID: {user.loginID}</p>
       <p>Email: {user.email || "Empty"}</p>
       <p>Follower Count: {user.followerCount || 0}</p>
       <p>Following Count: {user.followingCount || 0}</p>
       <p>Password: {user.password}</p>
    </div>
  )
}

export default UserInfo