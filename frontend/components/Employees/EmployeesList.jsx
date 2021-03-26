import React, { useEffect, useState } from 'react';
import EmployeesListActions from 'components/Employees/EmployeesListActions';
import EmployeePopup from 'components/Employees/EmployeePopup';
import { PersonIcon, DimPlusIcon } from 'components/Icons';

const EmployeesList = () => {
  const [employees, setEmployees] = useState([]);
  const [isEmployeeOpen, setIsEmployeeOpen] = useState(false);

  useEffect(() => {
    fetch('/api/v1/employees')
      .then((response) => response.json())
      .then((employees) => setEmployees(employees));
  }, []);

  return (
    <React.Fragment>
      {isEmployeeOpen && <EmployeePopup handleShow={setIsEmployeeOpen}/>}

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
          <tr className="e-action-row">
            <td colSpan="3" className="e-icon">
              <div className="e-cicle e-add-person-cicle e-clickable"
                onClick={() => setIsEmployeeOpen(true)}>
                <img id="e-add-person-icon" className="e-cicle" src={DimPlusIcon}/>
                <span id="e-add-person-text">Add employee</span>
              </div>
            </td>
          </tr>
          {employees.map((emp) => (
            <tr className="e-index-row" key={emp.id}>
              <td className="e-icon">
                <div className="e-cicle e-person-cicle"></div>
                <img id="e-person-icon" src={PersonIcon} />
              </td>
              <td>{emp.first_name + ' ' + emp.last_name}</td>
              <td>{emp.email}</td>
              <td>{emp.phone}</td>
              <td>{emp.role}</td>
              <td></td>
              <td className="e-data-cell">
                <EmployeesListActions />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </React.Fragment>
  )
}
export default EmployeesList;
