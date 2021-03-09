import React from 'react';
import { Switch, Route } from "react-router-dom";
import TeamApp from 'components/Teams/TeamApp';
import DashboardApp from 'components/Dashboard/DashboardApp';
import EmployeeApp from 'components/Employee/EmployeeApp';
import SettingsApp from 'components/Settings/SettingsApp';

export default () => {
  return (
    <Switch>
      <Route exact path="/" >
        <DashboardApp />
      </Route>
      <Route exact path="/employee">
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
