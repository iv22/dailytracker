import React, { useEffect, useState } from 'react';
import SeparateTeam from './Selected';
import Ball from 'images/ball.svg';
import Person from 'images/person.svg';
import Rubbish from 'images/rubbish.svg';
import DullCircle from 'images/dull_circle.svg';
import DimPlus from 'images/dim_plus.svg';
import './style.css';

const Team = () => {
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
          <div className="vector-7" alt="ball">
            <Ball />
          </div>
          <div className="vector-8" alt="person">
            <Person />
          </div>
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
                    <div className="vector-9" alt="ball">
                      <Ball />
                    </div>
                    <div className="vector-10" alt="person">
                      <Person />
                    </div>
                    <div className="vector-13" alt="rubbish">
                      <Rubbish />
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          <div className="vector-11" alt="dull_circle">
            <DullCircle />
          </div>
          <div className="vector-12" alt="dim_plus">
            <DimPlus />
          </div>
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
export default Team
