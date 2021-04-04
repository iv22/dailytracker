import React, { useState } from "react";
import EmployeesList from "components/Employees/EmployeesList";
import EmployeesUpload from "components/Employees/EmployeesUpload";
import "./employee.scss";

const EmployeeApp = () => {
  const [isUploadOpen, setIsUploadOpen] = useState(false);

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All Employees</h3>
      </nav>

      <div className="e-parent">
        <div className="smooth e-color-layer"></div>
        <span className="e-title">All&nbsp;employees</span>
        <button type="button" className="smooth-button e-clickable submit-color e-upload-button"
          onClick={() => setIsUploadOpen(true)}>
          <div className="btn-icon"></div>
          Upload
        </button>

        {isUploadOpen && <EmployeesUpload handleShow={setIsUploadOpen}/>}
        <EmployeesList />

        <div className="e-htop-line"></div>
        <div className="e-hbottom-line"></div>
      </div>
    </section>
  )
}
export default EmployeeApp;
