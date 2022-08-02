import React, { useState, useEffect } from 'react'
import "./FindSeller.css"
import Axios from 'axios';

function FindSeller() {

    const [userID, setUserID] = useState();
    const [display, setDisplay] = useState(false);

    // Check login state
    useEffect(() => {
      if(!localStorage.getItem("loggedIn")){
        localStorage.setItem("loggedIn", false);
      }
    }, []);

    // Find seller who published all sellpost
    const findSellerID = () => {
      Axios.get("http://localhost:3001/findSeller/find"
      ).then((response)=>{
        // Display posts as requested
        setUserID(response.data[0].userID_post);
        setDisplay(true);
        console.log(response.data[0].userID_post);
        console.log(userID);
        console.log(display);
      });
    }

  // Return front end
  return (
    <div className="FindSeller">
      <h1>Find UserID of seller who published all sell posts:</h1>
          {/* Find Seller User ID */}
        <div className="FindSellerButton">
          <button onClick={findSellerID}>Find!</button>
        </div>

        {/* Display table */}
        {display === true ? (
          <div className="ResultTitle">
            <h1>RESULTS:</h1>
            <div className="Result">
                <div>
                  Seems like user with ID @{userID} is an active seller on CryptoBook!
                </div>
            </div>
          </div>
        ):(<></>)}

    </div>
    
  )
}

export default FindSeller