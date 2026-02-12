import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import './App.css';

function Tech() {
  return (
    <div className="dashboard">
      <h1>🛠️ Thomas IT Tech Dashboard</h1>
      <p>Phoenix DC21 - Smith,J. #2001</p>
      <Link to="/dispatch">Dispatch Tower →</Link>
    </div>
  );
}

function Dispatch() {
  return (
    <div className="dashboard">
      <h1>📡 Dispatch Tower</h1>
      <p>Live swaps: #2001 CLAIMED ✓</p>
      <Link to="/tech">Tech Dashboard →</Link>
    </div>
  );
}

function Enterprise() {
  return (
    <div className="dashboard">
      <h1>🏢 Enterprise Dashboard</h1>
      <p>Cisco EOL Inventory</p>
      <Link to="/tech">Tech →</Link>
    </div>
  );
}

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<Tech />} />
          <Route path="/tech" element={<Tech />} />
          <Route path="/dispatch" element={<Dispatch />} />
          <Route path="/enterprise" element={<Enterprise />} />
          <Route path="/eol_swaps" element={<Enterprise />} />
          <Route path="/inventory" element={<Enterprise />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
