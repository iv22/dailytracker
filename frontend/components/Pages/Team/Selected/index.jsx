import React from 'react';
import ThreeDots from 'images/three_dots.svg';
import CircleSmall from 'images/circle_small.svg';
import Plus from 'images/plus.svg';
import Ball from 'images/ball.svg';
import Person from 'images/person.svg';
import Rubbish from 'images/rubbish.svg';

const SeparateTeam = ({activeTeam}) => {
  return (
    <div>
      <nav className="team-nav">
        <h3 className="name-team">{activeTeam.name}</h3>
        <span>
          <div className="vector-14" alt="three_dots">
            <ThreeDots />
          </div>
        </span>
      </nav>
      <table width="33%" cellSpacing="0" cellPadding="0">
        <thead>
          <tr>
            <th className="team_user-head">Team Members</th>
            <td>
              <div className="vector-15" alt="circle_small">
                <CircleSmall />
              </div>
              <div className="vector-16" alt="plus">
                <Plus />
              </div>
            </td>
          </tr>
        </thead>
        <tbody>
          {activeTeam.team_users.map((team_user) => (
            <tr className="team_user-body" key={team_user.id}>
              <td className="team_user-name">
                {team_user.name}
                <div className="vector-17" alt="ball">
                  <Ball />
                </div>
                <div className="vector-18" alt="person">
                  <Person />
                </div>
                <div className="vector-19" alt="rubbish">
                  <Rubbish />
                </div>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
export default SeparateTeam
