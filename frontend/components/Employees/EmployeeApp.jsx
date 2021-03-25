import React, { useEffect, useState } from 'react';
import EmployeesList from 'components/Employees/EmployeesList';
import EmployeesUpload from 'components/Employees/EmployeesUpload';
import EmployeePopup from 'components/Employees/EmployeePopup';
import "./global.pcss";
import "./employee.pcss";

const EmployeeApp = () => {
  const [isEmployeeModalOpen, setIsEmployeeModalOpen] = useState(false);
  const [isUploadModalOpen, setIsUploadModalOpen] = useState(false);

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All Employees</h3>
      </nav>

      <div id="e-parent">
        <div id="e-color-layer" className="smooth"></div>
        <span id="e-title">All employees</span>
        <button id="e-upload-button" type="button" className="smooth-button e-clickable submit-color"
          onClick={() => setIsUploadModalOpen(true)}>
          <div className="btn-icon"></div>
          Upload
        </button>

        <EmployeesList />
        {isUploadModalOpen && <EmployeesUpload handleShow={setIsUploadModalOpen}/>}
        {isEmployeeModalOpen && <EmployeePopup handleShow={setIsEmployeeModalOpen}/>}

        <div id="e-htop-line"></div>
        <div id="e-hbottom-line"></div>

        <div id="e-add-employee-button" className="e-cicle e-add-person-cicle e-clickable"
          onClick={() => setIsEmployeeModalOpen(true)}>
          <div id="e-add-person-icon" className="e-cicle"></div>
          <span id="e-add-person-text">Add employee</span>
        </div>
      </div>
    </section>
  )
}
export default EmployeeApp;
