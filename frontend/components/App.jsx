import React from 'react';
import { Link } from "react-router-dom";
import Main from 'components/Main';
import { BrowserRouter as Router } from "react-router-dom";

const App = () => {
  return (
    <Router>
      <div className="main-nav">
        <h1 className="name-project">Daily Tracker</h1>
        <nav className="main-nav">
          <ul className="main-links">
            <li className="nav-links">
              <Link to="/">Dashboard</Link>
            </li>
            <li>
              <Link to="/employee">Employees</Link>
            </li>
            <li>
              <Link to="/teams">Teams</Link>
            </li>
            <li>
              <Link to="/settings">Settings</Link>
            </li>
          </ul>
        </nav>
      </div>
      <Main />
    </Router>
  );
}
export default App
