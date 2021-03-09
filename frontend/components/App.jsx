import React from 'react';
import { Link } from "react-router-dom";
import Main from 'components/Main';
import { BrowserRouter as Router } from "react-router-dom";

const App = () => {
  return (
    <Router>
      <main className="main-container">
        <header className="header">
          <img className="ellipse" src={require('components/Images/ellipse.png')} alt="ellipse" />
          <h1 className="name-project">Daily Tracker</h1>
          <nav className="main-nav">
            <ul className="main-links">
              <img className="vector-1" src={require('components/Images/square_module.png')} alt="square_module" />
              <li className="nav-dashboard">
                <Link to="/">Dashboard</Link>
              </li>
              <img className="vector-2" src={require('components/Images/person_big.png')} alt="person_big" />
              <li className="nav-employees">
                <Link to="/employee">Employees</Link>
                <img className="background-1" src={require('components/Images/circle_big.png')} alt="circle_big" />
                <img className="vector-5" src={require('components/Images/plus.png')} alt="plus" />
              </li>
              <img className="vector-3" src={require('components/Images/two_persons.png')} alt="two_persons" />
              <li className="nav-teams">
                <Link to="/teams">Teams</Link>
                <img className="background-2" src={require('components/Images/circle_big.png')} alt="circle_big" />
                <img className="vector-5" src={require('components/Images/plus.png')} alt="plus" />
              </li>
              <img className="vector-4" src={require('components/Images/gear.png')} alt="gear" />
              <li className="nav-settings">
                <Link to="/settings">Settings</Link>
              </li>
            </ul>
          </nav>
        </header>
        <Main />
      </main>
    </Router>
  );
}
export default App
