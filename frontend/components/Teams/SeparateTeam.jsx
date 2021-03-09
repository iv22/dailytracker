import React from 'react';

const SeparateTeam = ({activeTeam}) => {
  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>Team Members</th>
          </tr>
        </thead>
        <tbody>
          {activeTeam.team_users.map((team_user) => (
            <tr key={team_user.id}>
              <td className="team_user-name">
                {team_user.name}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
export default SeparateTeam
