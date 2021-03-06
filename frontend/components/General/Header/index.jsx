import React from 'react';
import { Link } from "react-router-dom";
import Ellipse from 'images/ellipse.svg';
import SquareModule from 'images/square_module.svg';
import PersonBig from 'images/person_big.svg';
import CircleBig from 'images/circle_big.svg';
import Plus from 'images/plus.svg';
import TwoPersons from 'images/two_persons.svg';
import Gear from 'images/gear.svg';

const Header = () => {
  return (
    <header className="header">
      <div className="ellipse" alt="ellipse">
        <Ellipse />
      </div>
      <h1 className="name-project">Daily Tracker</h1>
      <nav className="main-nav">
        <ul className="main-links">
          <div className="vector-1" alt="square_module">
            <SquareModule />
          </div>
          <li className="nav-dashboard">
            <Link to="/">Dashboard</Link>
          </li>
          <div className="vector-2" alt="person_big">
            <PersonBig />
          </div>
          <li className="nav-employees">
            <Link to="/employees">Employees</Link>
            <div className="background-1" alt="circle_big">
              <CircleBig />
            </div>
            <div className="vector-5" alt="plus">
              <Plus />
            </div>
          </li>
          <div className="vector-3" alt="two_persons">
            <TwoPersons />
          </div>
          <li className="nav-teams">
            <Link to="/teams">Teams</Link>
            <div className="background-2" alt="circle_big">
              <CircleBig />
            </div>
            <div className="vector-5" alt="plus">
              <Plus />
            </div>
          </li>
          <div className="vector-4" alt="gear">
            <Gear />
          </div>
          <li className="nav-settings">
            <Link to="/settings">Settings</Link>
          </li>
        </ul>
      </nav>
    </header>
  )
}
export default Header
