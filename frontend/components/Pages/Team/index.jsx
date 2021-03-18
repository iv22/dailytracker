import React, { useEffect, useState } from 'react';
import SeparateTeam from './Selected';
import './style';
import { Ball, Person, Rubbish, DullCircle, DimPlus } from "components/General/Icons";

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
          <div className="ball-icon" alt="ball">
            <Ball />
          </div>
          <div className="person-icon" alt="person">
            <Person />
          </div>
        </span>
      </nav>
      <article className="article-content">
        <aside className="aside">
          <table className="aside-content">
            <thead>
              <tr>
                <th className="aside-title">Team name</th>
              </tr>
            </thead>
            <tbody>
              {teams.map((team) => (
                <tr key={team.id}>
                  <td className="aside-name" onClick={() => setActiveTeam(team)}>
                    {team.name}
                    <div className="t-ball-icon" alt="ball">
                      <Ball />
                    </div>
                    <div className="t-person-icon" alt="person">
                      <Person />
                    </div>
                    <div className="t-rubbish-icon" alt="rubbish">
                      <Rubbish />
                    </div>
                  </td>
                </tr>
              ))}
              <tr>
                <td>
                  <div className="t-dullCircle-icon" alt="dull_circle">
                    <DullCircle />
                  </div>
                  <div className="t-dimPlus-icon" alt="dim_plus">
                    <DimPlus />
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </aside>
        <footer className="footer">
          {activeTeam ? (
            <ul className="footer-content">
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
