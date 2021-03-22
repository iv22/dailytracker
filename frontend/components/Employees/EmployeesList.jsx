import React, { useEffect, useState } from 'react';

const EmployeesList = () => {
  const [employees, setEmployees] = useState([]);

  useEffect(() => {
    fetch('/api/v1/employees')
      .then((response) => response.json())
      .then((employees) => setEmployees(employees));
  }, []);

  return (
    <table id="e-index-table">
      <thead id="e-index-head">
        <tr>
          <th id="e-icon-head"></th>
          <th id="e-name-head">Name</th>
          <th id="e-email-head">Email</th>
          <th id="e-phone-head">Phone</th>
          <th id="e-role-head">Role</th>
          <th id="e-status-head">Status</th>
          <th id="e-action-head">Action</th>
        </tr>
      </thead>
      <tbody id="e-index-body">
        {employees.map((emp) => (
          <tr className="e-index-row" key={emp.id}>
            <td className="e-icon">
              <div className="e-cicle e-person-cicle"></div>
              <div id="e-person-icon"></div>
            </td>
            <td>{emp.first_name + ' ' + emp.last_name}</td>
            <td>{emp.email}</td>
            <td>{emp.phone}</td>
            <td>{emp.role}</td>
            <td></td>
            <td className="e-data-cell">
              <span className="e-invite e-action e-clickable" title="Resend invitation"></span>
              <span className="e-edit e-action e-clickable" title="Edit"></span>
              <span className="e-lock e-action e-clickable" title="Lock"></span>
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
export default EmployeesList;
