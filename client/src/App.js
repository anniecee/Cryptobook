import './App.css';
import {BrowserRouter, Routes, Route} from 'react-router-dom';
import Home from "./pages/Home/Home";
import Navbar from './components/Navbar';
import Login from "./pages/Login/Login";
import Register from "./pages/Register/Register";
import CreatePost from "./pages/CreatePost/CreatePost";
import SearchPost from "./pages/SearchPost/SearchPost";
import SignOut from "./pages/SignOut/SignOut";
import Transactions from './pages/Transactions/Transactions';
import Settings from './pages/Settings/Settings';
import ChangePassword from './pages/ChangePassword/ChangePassword';
import UserInfo from './pages/UserInfo/UserInfo';
import PersonalProfile from './pages/PersonalProfile/PersonalProfile';
import ChangeUsername from './pages/ChangeUsername/ChangeUsername';


function App() {
  return (
    <>
      <Navbar />
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<Home />}>
          </Route>
          <Route path='/register' element={<Register />}>
          </Route>
          <Route path='/login' element={<Login />}>
          </Route>
          <Route path='/CreatePost' element={<CreatePost />}>
          </Route>
          <Route path='/SearchPost' element={<SearchPost />}>
          </Route>
          <Route path='/signOut' element={<SignOut />}>
          </Route>
          <Route path='/Transactions' element={<Transactions />}>
          </Route>
          <Route path='/settings' element={<Settings />}>
          </Route>
          <Route path='/changeUsername' element={<ChangeUsername />}>
          </Route>
          <Route path='/changePassword' element={<ChangePassword />}>
          </Route>
          <Route path='/userInfo' element={<UserInfo />}>
          </Route>
          <Route path='/personalProfile' element={<PersonalProfile />}>
          </Route>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
