import React, { useEffect, useState } from 'react';
import "./employee.pcss";

const EmployeeApp = () => {
  const [employees, setEmployees] = useState([]);

  useEffect(() => {
    fetch('/api/v1/employees')
      .then((response) => response.json())
      .then((employees) => setEmployees(employees));
  }, []);

  return (
    <section className="section">
      <nav className="nav">
        <h3 className="all-names">All Employees</h3>
      </nav>

      <div id="e_parent">
        <div id="e_color_layer"></div>
        <span id="e_title">All employees</span>
        <button id="e_upload_button" type="button">Upload</button>
        <div id="e_htop_line"></div>
        <div id="e_hbottom_line"></div>

        <table id="e_index_table">
          <thead id="e_index_head">
            <tr>
              <th id="e_icon_head"></th>
              <th id="e_name_head">Name</th>
              <th id="e_email_head">Email</th>
              <th id="e_phone_head">Phone</th>
              <th id="e_role_head">Role</th>
              <th id="e_status_head">Status</th>
              <th id="e_action_head">Action</th>
            </tr>
          </thead>
          <tbody id="e_index_body">
            {employees.map((emp) => (
              <tr className="e_index_row">
                <td className="e_icon">
                  <div id="e_cicle"></div>
                  <div id="e_person"></div>
                </td>
                <td>{emp.first_name + ' ' + emp.last_name}</td>
                <td>{emp.email}</td>
                <td>{emp.phone}</td>
                <td>{emp.role}</td>
                <td></td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  )
}
export default EmployeeApp
