import React, { useEffect, useState } from 'react';
import EmployeesListActions from 'components/Employees/EmployeesListActions';
import EmployeePopup from 'components/Employees/EmployeePopup';
import { PersonIcon, DimPlusIcon } from 'components/Icons';
import axios from '../../init/api';
import { ActiveIcon, InvitedIcon, LockedIcon } from 'components/Icons';

const EmployeesList = () => {
  const [employees, setEmployees] = useState([]);
  const [isEmployeeOpen, setIsEmployeeOpen] = useState(false);
  const [isError, setIsError] = useState(false);
  const [id, setId] = useState();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const result = await axios("employees");
        result.data ? setEmployees(result.data) : setIsError(true);
      } catch (error) {
        setIsError(true);
      }
    };
    fetchData();
  }, []);

  const handleAddEdit = (id) => {
    setId(id);
    setIsEmployeeOpen(true);
  };

  const getStatusIcon = (status) => {
    let source = {};
    switch (status) {
      case "active":
        source["icon"] = ActiveIcon;
        source["title"] = "active";
        break;
      case "locked":
        source["icon"] = LockedIcon;
        source["title"] = "locked";
        break;
      case "Invited":
        source["icon"] = InvitedIcon;
        source["title"] = "invited";
    }
    return <img src={source["icon"]} title={source["title"]} />
  }

  return (
    <React.Fragment>
      {isEmployeeOpen && <EmployeePopup id={id} handleShow={setIsEmployeeOpen} />}

      {isError ? console.log("Error raised when loading data!") :
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
                  onClick={() => handleAddEdit()}>
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
                <td className="text-center">{getStatusIcon(emp.status)}</td>
                <td className="e-data-cell">
                  <EmployeesListActions handleEdit={() => handleAddEdit(emp.id)} />
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      }
    </React.Fragment>
  )
}
export default EmployeesList;
