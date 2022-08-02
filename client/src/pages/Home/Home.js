import React, {useEffect, useState} from 'react'
import "./Home.css"
import  Axios  from 'axios';
import ThumbUpAltIcon from "@material-ui/icons/ThumbUpAlt";

function Home() {

  const [posts, setPosts] = useState([]);

  // Check login state
  useEffect(() => {
    if(!localStorage.getItem("loggedIn")){
      localStorage.setItem("loggedIn", false);
    }
  }, []);

  // Get all post data to display
  useEffect(()=>{
    Axios.get("http://localhost:3001/upload").then((response)=>{
      setPosts(response.data);
      console.log(response.data);
    });
  }, []);

  // Like function 
  // TBU
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
    <div className="Home">
       {/* Display post */}
       {posts.map((val, key)=>{
        return(
          <div className='Post'> 

            {/* Content */}
            <div className='Content'>
              {/* Title */}
              {val.type == "normal" ? (
                    <div className="Title">
                      Text Post / by @{val.userName_user}
                    </div>
                ) : (
                    <div className="Title">
                      {val.type} {val.buyCrypto}{val.sellCrypto} at ${val.buyPrice}{val.sellPrice} / by @{val.userName_user}
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
    </div>
  )
} 

export default Home 