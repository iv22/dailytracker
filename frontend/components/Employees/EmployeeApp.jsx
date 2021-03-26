import React, { useState } from "react";
import EmployeesList from "components/Employees/EmployeesList";
import EmployeesUpload from "components/Employees/EmployeesUpload";
import "./global.pcss";
import "./employee.pcss";

const EmployeeApp = () => {
  const [isUploadOpen, setIsUploadOpen] = useState(false);

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All Employees</h3>
      </nav>

      <div id="e-parent">
        <div id="e-color-layer" className="smooth"></div>
        <span id="e-title">All employees</span>
        <button id="e-upload-button" type="button" className="smooth-button e-clickable submit-color"
          onClick={() => setIsUploadOpen(true)}>
          <div className="btn-icon"></div>
          Upload
        </button>

        {isUploadOpen && <EmployeesUpload handleShow={setIsUploadOpen}/>}
        <EmployeesList />

        <div id="e-htop-line"></div>
        <div id="e-hbottom-line"></div>
      </div>
    </section>
  )
}
export default EmployeeApp;
