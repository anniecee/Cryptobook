import Axios from 'axios';
import React, {useState} from 'react';
import './Transactions.css';

function Transactions() {

    const [transactions, setTransactions] = useState([]);

    let requests = {
        crypto: false,
        price: false,
        type: false,
        time: false
    };

    const [options, setOptions] = useState({});


 
    const getTransactions = () => {
        Axios.get("http://localhost:3001/transactions",
        {params: options}
        ).then((response)=>{
            setTransactions(response.data);
            setOptions(options);
        })
        }

  return (
    <div>
        <div className="Ticks">
            <div className="Tick">
                Crypto:<input type="checkbox" onChange={()=>{
                    requests = options;
                    requests.crypto = !options.crypto;
                    setOptions(requests);
                }}/>
            </div>
            <div className="Tick">
                Price:<input type="checkbox" onChange={()=>{
                    requests = options;
                    requests.price = !options.price;
                    setOptions(requests);
                }}/>
            </div>
            <div className="Tick">
                Type:<input type="checkbox" onChange={()=>{
                    requests = options;
                    requests.type = !options.type;
                    setOptions(requests);
                }}/>
            </div>
            <div className="Tick">
                Time:<input type="checkbox" onChange={()=>{
                    requests = options;
                    requests.time = !options.time;
                    setOptions(requests);
                }}/>
            </div>
            <button className="Btn" onClick={()=>{
                getTransactions()
            }}>Search</button>
        </div>
    
        <div>
        <div className="Transactions">
                    <div className="TableHeader">
                        {options.crypto ? (
                            <div className="Header">
                                Crypto
                            </div>
                        ) : (
                            <></>
                        )}
                        
                            
                
                        {options.price ? (
                        <div className="Header">
                            Price
                        </div>
                        ) : (
                            <></>
                        )}
                        
                        {options.type ? (
                            <div className="Header">
                            Type
                        </div>
                        ) : (
                            <></>
                        )}
                        
                        {options.time ? (
                            <div className="Header">
                            Time
                        </div>
                        ) : (
                            <></>
                        )}
                        
                        
                    </div>
            </div>
        {transactions.map((value)=>{
            return (
            <div className="TableContent">
                {options.crypto ? (
                    <div className="TableContent">
                    {value.crypto}
                </div>
                ) : (
                    <></>
                )}

                {options.price ? (
                    <div className="TableContent">
                    {value.price}
                </div>
                ) : (
                    <></>
                )}

                {options.type ? (
                <div className="TableContent">
                    {value.type}
                </div>
                ) : (
                    <></>
                )}

                {options.time ? (
                <div className="TableContent">
                    {value.time}
                </div>
                ) : (
                    <></>
                )}
                
            
            </div>
            )
        })}
        
        
        


    </div>

    </div>
    
  )
}

export default Transactions