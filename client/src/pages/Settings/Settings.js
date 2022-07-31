import React from 'react'

function Settings() {
  return (
    <div>
      <h1>My Settings</h1>
      <ul>
        <li>
          <a href="/userInfo">My User Info</a>
        </li>
        
        <li>
          <a href="/personalProfile">My Personal Profile</a>
        </li>
        
        <li>
          <a href="/changeUsername">Change My Username</a>
        </li>

        <li>
          <a href="/changePassword">Change My Password </a>
       </li>
      </ul>
    </div>
  )
}

export default Settings