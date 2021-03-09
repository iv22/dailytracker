import React from 'react';

const SeparateTeam = ({activeTeam}) => {
  return (
    <div>
      <nav className="team-nav">
        <h3 className="name-team">{activeTeam.name}</h3>
        <span>
          <img className="vector-14" src={require('components/Images/three_dots.png')} alt="three_dots" />
        </span>
      </nav>
      <table width="33%" cellSpacing="0" cellPadding="0">
        <thead>
          <tr>
            <th className="team_user-head">Team Members</th>
            <td><img className="vector-15" src={require('components/Images/circle_small.png')} alt="circle_small" />
              <img className="vector-16" src={require('components/Images/plus.png')} alt="plus" />
            </td>
          </tr>
        </thead>
        <tbody>
          {activeTeam.team_users.map((team_user) => (
            <tr className="team_user-body" key={team_user.id}>
              <td className="team_user-name">
                {team_user.name}
                <img className="vector-17" src={require('components/Images/ball.png')} alt="ball" />
                <img className="vector-18" src={require('components/Images/person.png')} alt="person" />
                <img className="vector-19" src={require('components/Images/rubbish.png')} alt="rubbish" />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
export default SeparateTeam
