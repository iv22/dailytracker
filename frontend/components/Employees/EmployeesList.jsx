import React, { useEffect, useState } from 'react';
import EmployeesListActions from 'components/Employees/EmployeesListActions';
import EmployeePopup from 'components/Employees/EmployeePopup';
import { PersonIcon, DimPlusIcon } from 'components/Icons';
import axios from '../../init/api';
import { ActiveIcon, InvitedIcon, LockedIcon } from 'components/Icons';

const EmployeesList = () => {
  const [employees, setEmployees] = useState([]);
  const [isEmployeeOpen, setIsEmployeeOpen] = useState(false);
  const [error, setError] = useState();
  const [id, setId] = useState();
  const [updatedAt, setUpdatedAt] = useState();

  useEffect(() => {
    const fetchData = async () => {
      setError();
      try {
        const result = await axios("employees");
        setEmployees(result.data);
      } catch (error) {
        setError(error);
      }
    };
    fetchData();
  }, [updatedAt]);

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
      {isEmployeeOpen && <EmployeePopup id={id} handleShow={setIsEmployeeOpen} updatedAt={setUpdatedAt} />}

      {error ? <div className="alert alert-danger" role="alert">{error}</div> :
        <table className="e-index-table">
          <thead className="e-index-head">
            <tr>
              <th className="e-icon-head"></th>
              <th className="e-name-head">Name</th>
              <th className="e-email-head">Email</th>
              <th className="e-phone-head">Phone</th>
              <th className="e-role-head">Role</th>
              <th className="e-status-head">Status</th>
              <th className="e-action-head">Action</th>
            </tr>
          </thead>
          <tbody className="e-index-body">
            <tr className="e-action-row">
              <td colSpan="3" className="e-icon">
                <div className="e-cicle e-add-person-cicle e-clickable"
                  onClick={() => handleAddEdit()}>
                  <img className="e-cicle e-add-person-icon" src={DimPlusIcon}/>
                  <span className="e-add-person-text">Add&nbsp;employee</span>
                </div>
              </td>
            </tr>
            {employees && employees.map((emp) => (
              <tr className="e-index-row" key={emp.id}>
                <td className="e-icon">
                  <div className="e-cicle e-person-cicle"></div>
                  <img className="e-person-icon" src={PersonIcon} />
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
