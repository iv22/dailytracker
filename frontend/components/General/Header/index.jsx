import React from 'react';
import { Link } from "react-router-dom";
import { Ellipse, SquareModule, PersonBig, TwoPersons, CircleBig, Plus, Gear } from "components/General/Icons";

const Header = () => {
  return (
    <header className="header">
      <div className="ellipse-icon" alt="ellipse">
        <Ellipse />
      </div>
      <h1 className="header-name">Daily Tracker</h1>
      <nav>
        <ul className="header-links">
          <div className="squareModule-icon" alt="square_module">
            <SquareModule />
          </div>
          <li className="nav-dashboard__link">
            <Link to="/">Dashboard</Link>
          </li>
          <div className="personBig-icon" alt="person_big">
            <PersonBig />
          </div>
          <li className="nav-employees__link">
            <Link to="/employees">Employees</Link>
            <div className="circleBig-icon" alt="circle_big">
              <CircleBig />
            </div>
            <div className="plus-icon" alt="plus">
              <Plus />
            </div>
          </li>
          <div className="twoPersons-icon" alt="two_persons">
            <TwoPersons />
          </div>
          <li className="nav-teams__link">
            <Link to="/teams">Teams</Link>
            <div className="circleBig-icon" alt="circle_big">
              <CircleBig />
            </div>
            <div className="plus-icon" alt="plus">
              <Plus />
            </div>
          </li>
          <div className="gear-icon" alt="gear">
            <Gear />
          </div>
          <li className="nav-settings__link">
            <Link to="/settings">Settings</Link>
          </li>
        </ul>
      </nav>
    </header>
  )
}
export default Header
