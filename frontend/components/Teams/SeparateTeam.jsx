import React from 'react';
import threeDots from 'components/Images/three_dots.svg';
import circleSmall from 'components/Images/circle_small.svg';
import plus from 'components/Images/plus.svg';
import ball from 'components/Images/ball.svg';
import person from 'components/Images/person.svg';
import rubbish from 'components/Images/rubbish.svg';

const SeparateTeam = ({activeTeam}) => {
  return (
    <div>
      <nav className="team-nav">
        <h3 className="name-team">{activeTeam.name}</h3>
        <span>
          <img className="vector-14" src={threeDots} alt="three_dots" />
        </span>
      </nav>
      <table width="33%" cellSpacing="0" cellPadding="0">
        <thead>
          <tr>
            <th className="team_user-head">Team Members</th>
            <td><img className="vector-15" src={circleSmall} alt="circle_small" />
              <img className="vector-16" src={plus} alt="plus" />
            </td>
          </tr>
        </thead>
        <tbody>
          {activeTeam.team_users.map((team_user) => (
            <tr className="team_user-body" key={team_user.id}>
              <td className="team_user-name">
                {team_user.name}
                <img className="vector-17" src={ball} alt="ball" />
                <img className="vector-18" src={person} alt="person" />
                <img className="vector-19" src={rubbish} alt="rubbish" />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
export default SeparateTeam
