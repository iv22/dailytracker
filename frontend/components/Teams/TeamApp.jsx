import React, { useEffect, useState } from 'react';
import SeparateTeam from 'components/Teams/SeparateTeam';

const TeamApp = () => {
  const [teams, setTeams] = useState([]);
  const [activeTeam, setActiveTeam] = useState(null);

  useEffect(() => {
    fetch('/api/v1/teams')
      .then((response) => response.json())
      .then((teams) => setTeams(teams));
  }, []);

  return (
    <div>
      <h3>All teams</h3>
      <table>
        <thead>
          <tr>
            <th>Team name</th>
          </tr>
        </thead>
        <tbody>
          {teams.map((team) => (
            <tr key={team.id}>
              <td className="team-name" onClick={() => setActiveTeam(team)}>
                {team.name}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      {activeTeam ? (
        <ul>
          <li>
            {<SeparateTeam activeTeam={activeTeam} />}
          </li>
        </ul>
      ) : null}
    </div>
  )
}
export default TeamApp
