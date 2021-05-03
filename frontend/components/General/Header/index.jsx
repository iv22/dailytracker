import React from 'react';
import { Link } from "react-router-dom";
import { Ellipse, SquareModule, PersonBig, TwoPersons, CircleBig, Plus, Gear } from "components/General/Icons";

const Header = () => {
  return (
    <header className="header">
      <h1 className="header-name">Daily Tracker</h1>
      <div className="ellipse-icon" alt="ellipse">
        <Ellipse />
      </div>
      <nav>
        <ul className="header-links">
          <div className="squaremodule-icon" alt="square_module">
            <SquareModule />
          </div>
          <li className="nav-dashboard__link">
            <Link to="/">Dashboard</Link>
          </li>
          <div className="personbig-icon" alt="person_big">
            <PersonBig />
          </div>
          <li className="nav-employees__link">
            <Link to="/employees">Employees</Link>
            <div className="circlebig-icon" alt="circle_big">
              <CircleBig />
            </div>
            <div className="plus-icon" alt="plus">
              <Plus />
            </div>
          </li>
          <div className="twopersons-icon" alt="two_persons">
            <TwoPersons />
          </div>
          <li className="nav-teams__link">
            <Link to="/teams">Teams</Link>
            <div className="circlebig-icon" alt="circle_big">
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
