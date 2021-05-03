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
        <span className="ball-icon" alt="ball">
          <Ball />
        </span>
        <span className="person-icon" alt="person">
          <Person />
        </span>
      </nav>
      <article className="article-content">
        <aside className="aside">
          <h2 className="aside-title">Team name</h2>
          {teams.map((team) => (
            <ul key={team.id} className="aside-name" onClick={() => setActiveTeam(team)}>
              <li>
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
              </li>
            </ul>
          ))}
          <div className="t-dullcircle-icon" alt="dull_circle">
            <DullCircle />
          </div>
          <div className="t-dimplus-icon" alt="dim_plus">
            <DimPlus />
          </div>
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
