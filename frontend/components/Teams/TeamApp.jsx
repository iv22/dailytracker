import React, { useEffect, useState } from 'react';
import SeparateTeam from 'components/Teams/SeparateTeam';
import ball from 'components/Images/ball.svg';
import person from 'components/Images/person.svg';
import rubbish from 'components/Images/rubbish.svg';
import dullCircle from 'components/Images/dull_circle.svg';
import dimPlus from 'components/Images/dim_plus.svg';

const TeamApp = () => {
  const [teams, setTeams] = useState([]);
  const [activeTeam, setActiveTeam] = useState(null);

  useEffect(() => {
    fetch('/api/v1/teams')
      .then((response) => response.json())
      .then((teams) => setTeams(teams));
  }, []);

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All teams</h3>
        <span>
          <img className="vector-7" src={ball} alt="ball" />
          <img className="vector-8" src={person} alt="person" />
        </span>
      </nav>
      <article className="article-teams">
        <aside className="teams-name">
          <table className="team-table">
            <thead>
              <tr>
                <th className="team-head">Team name</th>
              </tr>
            </thead>
            <tbody>
              {teams.map((team) => (
                <tr className="team-body" key={team.id}>
                  <td className="team-name" onClick={() => setActiveTeam(team)}>
                    {team.name}
                    <img className="vector-9" src={ball} alt="ball" />
                    <img className="vector-10" src={person} alt="person" />
                    <img className="vector-13" src={rubbish} alt="rubbish" />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          <img className="vector-11" src={dullCircle} alt="dull_circle" />
          <img className="vector-12" src={dimPlus} alt="dim_plus" />
        </aside>
        <footer className="team-members">
          {activeTeam ? (
            <ul className="separate-team">
              <li>
                {<SeparateTeam activeTeam={activeTeam} />}
              </li>
            </ul>
          ) : null}
        </footer>
      </article>
    </section>
  )
}
export default TeamApp
