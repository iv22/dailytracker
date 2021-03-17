import React from 'react';
import { Link } from "react-router-dom";
import ellipse from 'components/Images/ellipse.svg';
import squareModule from 'components/Images/square_module.svg';
import personBig from 'components/Images/person_big.svg';
import circleBig from 'components/Images/circle_big.svg';
import plus from 'components/Images/plus.svg';
import twoPersons from 'components/Images/two_persons.svg';
import gear from 'components/Images/gear.svg';

const Header = () => {
  return (
    <header className="header">
      <img className="ellipse" src={ellipse} alt="ellipse" />
      <h1 className="name-project">Daily Tracker</h1>
      <nav className="main-nav">
        <ul className="main-links">
          <img className="vector-1" src={squareModule} alt="square_module" />
          <li className="nav-dashboard">
            <Link to="/">Dashboard</Link>
          </li>
          <img className="vector-2" src={personBig} alt="person_big" />
          <li className="nav-employees">
            <Link to="/employee">Employees</Link>
            <img className="background-1" src={circleBig} alt="circle_big" />
            <img className="vector-5" src={plus} alt="plus" />
          </li>
          <img className="vector-3" src={twoPersons} alt="two_persons" />
          <li className="nav-teams">
            <Link to="/teams">Teams</Link>
            <img className="background-2" src={circleBig} alt="circle_big" />
            <img className="vector-5" src={plus} alt="plus" />
          </li>
          <img className="vector-4" src={gear} alt="gear" />
          <li className="nav-settings">
            <Link to="/settings">Settings</Link>
          </li>
        </ul>
      </nav>
    </header>
  )
}
export default Header
