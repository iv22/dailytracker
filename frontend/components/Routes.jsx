import React from 'react';
import { Switch, Route } from "react-router-dom";
import TeamApp from 'components/Teams/TeamApp';
import DashboardApp from 'components/Dashboard/DashboardApp';
import EmployeeApp from 'components/Employees/EmployeeApp';
import SettingsApp from 'components/Settings/SettingsApp';
import 'components/Style.css';
import 'components/Teams/styles.css';

export default () => {
  return (
    <Switch>
      <Route exact path="/" >
        <DashboardApp />
      </Route>
      <Route exact path="/employees">
        <EmployeeApp />
      </Route>
      <Route exact path="/teams">
        <TeamApp />
      </Route>
      <Route exact path="/settings">
        <SettingsApp />
      </Route>
    </Switch>
  );
}
