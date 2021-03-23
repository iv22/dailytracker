import React from 'react';
import EmployeesList from 'components/Employees/EmployeesList';
import EmployeesUpload from 'components/Employees/EmployeesUpload';
import Employee from 'components/Employees/Employee';
import "./global.pcss";
import "./employee.pcss";

const EmployeeApp = () => {

  const showModal = (e) => {
    let id;
    switch (e.currentTarget.id) {
      case "e-upload-button":
        id = "e-upload"
        break;
      case "e-add-employee-button":
        id = "e-employee"
        break;
    }
    let modal = document.getElementById(id);
    modal.style.display = "block";
  }

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All Employees</h3>
      </nav>

      <div id="e-parent">
        <div id="e-color-layer" className="smooth"></div>
        <span id="e-title">All employees</span>
        <button id="e-upload-button" type="button" className="smooth-button e-clickable submit-color"
          onClick={showModal}>
          <div className="btn-icon"></div>
          Upload
        </button>

        <EmployeesList />
        <EmployeesUpload />
        <Employee />

        <div id="e-htop-line"></div>
        <div id="e-hbottom-line"></div>

        <div id="e-add-employee-button" className="e-cicle e-add-person-cicle e-clickable" onClick={showModal}>
          <div id="e-add-person-icon" className="e-cicle"></div>
          <span id="e-add-person-text">Add employee</span>
        </div>
      </div>
    </section>
  )
}
export default EmployeeApp;
