import React, { useEffect, useState } from 'react'
import "./Navbar.css"

function Navbar() {

  const [loggedIn, setLoggedIn] = useState(false);

  useEffect(() => {
    setLoggedIn(localStorage.getItem("loggedIn"));
  }, [localStorage.getItem("loggedIn")]);

  return (
    <div className='Navbar'>
        <a href="/">Home</a>
        {loggedIn ? (
          <>
            <a href="/profile">Profile</a>
            <a href="/createPost">Create Post</a>
            <a href="/searchPost">Search Post</a>
            <a href="/transactions">Transactions</a>
            <a href="/signOut">Sign Out</a>
          </>
        ) : (
          <>
            <a href="/login">Login</a>
            <a href="/register">Register</a>
          </>
        )}

    </div>
  )
}

export default Navbar