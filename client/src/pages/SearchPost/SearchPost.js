import React, { useState, useEffect } from 'react'
import "./SearchPost.css"
import Axios from 'axios';
import {useNavigate} from 'react-router-dom';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";

// Maybe have a separate page on nav bar for search 
// (post max like count/ post by username/ post by name/ post by Crypto)
function SearchPost() {
    const [like, setLike] = useState(0);
    const [name, setName] = useState("");
    const [crypto, setCrypto] = useState("");
    const [posts, setPosts] = useState([]);

    let navigate = useNavigate();
    
    // Check login state
    useEffect(() => {
      if(!localStorage.getItem("loggedIn")){
        localStorage.setItem("loggedIn", false);
      }
    }, []);

    // Search by Like
    const searchByLike = () => {
      Axios.get("http://localhost:3001/searchpost/byLike",
          {params: {like: like}}
      ).then((response)=>{
        // Display posts as requested
        setPosts(response.data);
        console.log(response.data);
      });
    };

    // Search by Real Name of User
    const searchByName = () => {
      Axios.get("http://localhost:3001/searchpost/byName",
          {params: {name: name}}
      ).then((response)=>{
        // Display posts as requested
        setPosts(response.data);
        console.log(response.data);
      });
    };

    // Search by Crypto
    const searchByCrypto = () => {
      Axios.get("http://localhost:3001/searchpost/byCrypto",
          {params: {crypto: crypto}}
      ).then((response)=>{
        // Display posts as requested
        setPosts(response.data);
        console.log(response.data);
      });
    };

    // Find most liked post
    const maxLike = () => {
      Axios.get("http://localhost:3001/searchpost/maxLikePost"
      ).then((response)=>{
        // Display posts as requested
        setPosts(response.data);
        console.log(response.data);
      });
    }

    // Like function 
    // Update according to Home.js in client
    // (Need to change multiple likes)
    const likePost = (postID, key)=>{
   
      Axios.post("http://localhost:3001/upload/like",
      {
        loginIDLike: localStorage.getItem("loginID"),
        postID: postID,
  
      }).then((response)=>{
        window.location.reload(); // reload page
      });
    }
  

    // Add delete function
    // Update according to Home.js in client
    const deletePost = (postID, key)=>{
      console.log(postID);   
      Axios.delete("http://localhost:3001/upload/delete/",
      {data: {
        postID: postID
      }}).then((response)=>{
        window.location.reload(); // reload page
      });
    }

  // Implement buy and sell action
  // TBU - (Create transaction in transaction table)
  const buyAction = (postID, key)=>{
  }

  const sellAction = (postID, key)=>{
  }

  // Return front end
  return (
    <div className="SearchPost">
      <h1>Search for posts:</h1>
        <div className="RegisterForm">
          {/* Search by like */}
          <input type="number" placeholder='With at least X likes' 
          onChange={(event)=>{
            setLike(event.target.value)
          }}/>
          <button onClick={searchByLike}>Search by like!</button>

          {/* Search by name */}
          <input type="text" placeholder='By Real Name of user' 
          onChange={(event)=>{
            setName(event.target.value)
          }}/>
          <button onClick={searchByName}>Search by name!</button>

          {/* Search by crypto */}
          <input type="text" placeholder='By Crypto being traded' 
          onChange={(event)=>{
            setCrypto(event.target.value)
          }}/>
          <button onClick={searchByCrypto}>Search by Crypto!</button>
        </div>

        {/* Min/max post input */}
        <div className="SearchPost">
          <h1>Show post with most like counts: </h1>
          <button onClick={maxLike}>Show</button>
        </div>
        
        <div className="SearchPost">
          <h1>SEARCH RESULTS: </h1>
        </div>
        {/* Display post */}
        {posts.map((val, key)=>{
        return(
          <div className='Post'> 

            {/* Content */}
            <div className='Content'>
              {/* Title */}
              {val.type == "normal" ? (
                    <div className="Title">
                      Text Post by @{val.userID_post}
                    </div>
                ) : (
                    <div className="Title">
                      {val.type} {val.buyCrypto}{val.sellCrypto} at ${val.buyPrice}{val.sellPrice} / by @{val.userID_post}
                    </div>
                )}
              {/* Text */}
              <div className='Text'>{val.text}</div>
            </div>

            {/* Interaction */}
            <div className='Interactions'>
              {/* Like */}
              <ThumbUpAltIcon id="likeButton"
              onClick={()=>{likePost(val.postID, key);}}/>
              {val.likeCount}
              {/* Buy/Sell button */}
              {val.type == "buy" ? (
                    <div className='sellButton'>
                      <button onClick={()=>{sellAction(val.postID);}}>Sell!</button>
                    </div>
                  ) : (
                    val.type == "sell" ? (
                      <div className='buyButton'>
                        <button onClick={()=>{buyAction(val.postID);}}>Buy!</button>
                      </div>
                    ) : (
                      <></>
                  ))}
              {/* Delete button */}
              <div className='DeleteButton'>
                <button onClick={()=>{deletePost(val.postID);}}>Delete</button>
              </div>
            </div>

          </div>
          )
        })}
        {/* End - Display post */}
        {/* End - Display post */}

    </div>
    
  )
}

export default SearchPost