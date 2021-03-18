import React from 'react';
import PropTypes from 'prop-types';
import { ThreeDots, CircleSmall, Plus, Ball, Person, Rubbish } from "components/General/Icons";

const SeparateTeam = ({ activeTeam }) => {
  return (
    <div className="general">
      <nav className="general-nav">
        <h3 className="general-name">{activeTeam.name}</h3>
        <div className="s-threeDots-icon" alt="three_dots">
          <ThreeDots />
        </div>
      </nav>
      <main className="general-part">
        <table className="general-part1__table">
          <thead className="general-part1__table-head">
            <tr>
              <th className="general-part1__table-title">Team Lead</th>
              <td>
                <div className="s-circleSmall-icon" alt="circle_small">
                  <CircleSmall />
                </div>
                <div className="s-plus-icon" alt="plus">
                  <Plus />
                </div>
              </td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <div className="s-ball-icon" alt="ball">
                  <Ball />
                </div>
                <div className="s-person-icon" alt="person">
                  <Person />
                </div>
                <div className="s-rubbish-icon" alt="rubbish">
                  <Rubbish />
                </div>
              </td>
            </tr>
          </tbody>
        </table>
        <table className="general-part2__table">
          <thead className="general-part2__table-head">
            <tr>
              <th className="general-part2__table-title">Team Members</th>
              <td>
                <div className="s-circleSmall1-icon" alt="circle_small">
                  <CircleSmall />
                </div>
                <div className="s-plus1-icon" alt="plus">
                  <Plus />
                </div>
              </td>
            </tr>
          </thead>
          <tbody>
            {activeTeam.team_users.map((team_user) => (
              <tr key={team_user.id}>
                <td className="general-part2__table-name">
                  {team_user.user.first_name} {team_user.user.last_name}
                  <div className="s-ball2-icon" alt="ball">
                    <Ball />
                  </div>
                  <div className="s-person2-icon" alt="person">
                    <Person />
                  </div>
                  <div className="s-rubbish2-icon" alt="rubbish">
                    <Rubbish />
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </main>
    </div>
  )
}

SeparateTeam.propTypes = {
  activeTeam: PropTypes.object.isRequired
};

export default SeparateTeam;
