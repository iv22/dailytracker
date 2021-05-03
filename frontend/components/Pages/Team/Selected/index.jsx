import React from 'react';
import PropTypes from 'prop-types';
import { ThreeDots, CircleSmall, Plus, Ball, Person, Rubbish } from "components/General/Icons";

const SeparateTeam = ({ activeTeam }) => {
  return (
    <div className="general">
      <nav className="general-nav">
        <h3 className="general-name">{activeTeam.name}</h3>
        <div className="s-threedots-icon" alt="three_dots">
          <ThreeDots />
        </div>
      </nav>
      <main className="general-part">
        <aside className="general-part1">
          <h2 className="general-part1__title">Team Lead</h2>
          <span className="s-circlesmall-icon" alt="circle_small">
            <CircleSmall />
          </span>
          <span className="s-plus-icon" alt="plus">
            <Plus />
          </span>
          <span className="s-ball-icon" alt="ball">
            <Ball />
          </span>
          <span className="s-person-icon" alt="person">
            <Person />
          </span>
          <span className="s-rubbish-icon" alt="rubbish">
            <Rubbish />
          </span>
        </aside>
        <aside className="general-part2">
          <h2 className="general-part2__title">Team Members</h2>
          <span className="s-circlesmall1-icon" alt="circle_small">
            <CircleSmall />
          </span>
          <span className="s-plus1-icon" alt="plus">
            <Plus />
          </span>
          <div className="general-part2_content">
            {activeTeam.team_users.map((team_user) => (
              <ul key={team_user.id} className="general-part2__name">
                <li>
                  {team_user.user.first_name} {team_user.user.last_name}
                  <span className="s-ball2-icon" alt="ball">
                    <Ball />
                  </span>
                  <span className="s-person2-icon" alt="person">
                    <Person />
                  </span>
                  <span className="s-rubbish2-icon" alt="rubbish">
                    <Rubbish />
                  </span>
                </li>
              </ul>
            ))}
          </div>
        </aside>
      </main>
    </div>
  )
}

SeparateTeam.propTypes = {
  activeTeam: PropTypes.shape({
    name: PropTypes.string.isRequire
  })
};

export default SeparateTeam;
