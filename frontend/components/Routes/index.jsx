import React from 'react';
import { Switch, Route } from "react-router-dom";
import Team from 'components/Pages/Team';
import Dashboard from 'components/Pages/Dashboard';
import Employee from 'components/Pages/Employee';
import Setting from 'components/Pages/Setting';
import './style';

const Routes = () => {
  return (
    <Switch>
      <Route exact path="/" >
        <Dashboard />
      </Route>
      <Route exact path="/employees">
        <Employee />
      </Route>
      <Route exact path="/teams">
        <Team />
      </Route>
      <Route exact path="/settings">
        <Setting />
      </Route>
    </Switch>
  );
}

export default Routes;
