import React from 'react';
import Routes from 'components/Routes';
import { BrowserRouter as Router } from "react-router-dom";
import Header from 'components/General/Header';

const App = () => {
  return (
    <Router>
      <main className="main">
        <Header />
        <Routes />
      </main>
    </Router>
  );
}
export default App
