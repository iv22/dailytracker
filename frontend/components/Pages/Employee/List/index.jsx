import React, { useEffect, useState } from 'react';
import EmployeesListActions from './Actions';
import EmployeeAddEdit from './Actions/AddEdit';
import EmployeeInvite from './Actions/Invite';
import EmployeeLock from './Actions/Lock';
import axios from 'init/api';
import "./style";
import { PersonIcon, DimPlusIcon, ActiveIcon, InvitedIcon, LockedIcon } from "components/General/Icons";

const EmployeesList = () => {
  const [employees, setEmployees] = useState([]);
  const [isActionOpen, setIsActionOpen] = useState(false);
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

  const handleAction = (id, action) => {
    setId(id);
    setIsActionOpen(action)
  };

  const getStatusIcon = (status) => {
    switch (status) {
      case "active":
        return <ActiveIcon title="active" />
      case "locked":
        return <LockedIcon title="locked" />
      case "invited":
        return <InvitedIcon title="invited" />
    }
  }

  const getActionComponent = () => {
    switch(isActionOpen) {
      case "invite":
        return <EmployeeInvite id={id} handleModalClose={() => setIsActionOpen(false)} updatedAt={setUpdatedAt} />;
      case "edit":
        return <EmployeeAddEdit id={id} handleModalClose={() => setIsActionOpen(false)} updatedAt={setUpdatedAt} />;
      case "lock":
        return <EmployeeLock id={id} handleModalClose={() => setIsActionOpen(false)} updatedAt={setUpdatedAt} />;
      default:
        return null
    }
  }

  return (
    <>
      { getActionComponent() }

      {error ? <div className="alert alert-danger" role="alert">{error}</div> :
        <>
          <table className="e-index-table">
            <thead className="e-index-head">
              <tr>
                <th className="e-icon-col"></th>
                <th className="e-name-col">Name</th>
                <th className="e-email-col">Email</th>
                <th className="e-phone-col">Phone</th>
                <th className="e-role-col">Role</th>
                <th className="e-status-col">Status</th>
                <th className="e-action-col">Action</th>
              </tr>
            </thead>
            <tbody className="e-index-body">
              {employees && employees.map((emp) => (
                <tr className="e-index-row" key={emp.id}>
                  <td className="e-icon e-icon-col">
                    <div className="e-circle e-person-circle"></div>
                    <PersonIcon className="e-person-icon" />
                  </td>
                  <td className="e-name-col">{emp.first_name + ' ' + emp.last_name}</td>
                  <td className="e-email-col">{emp.email}</td>
                  <td className="e-phone-col">{emp.phone}</td>
                  <td className="e-role-col">{emp.role}</td>
                  <td className="text-center e-status-col">{getStatusIcon(emp.status)}</td>
                  <td className="e-data-cell e-action-col">
                    <EmployeesListActions
                      handleInvite={() => handleAction(emp.id, "invite")}
                      handleEdit={() => handleAction(emp.id, "edit")}
                      handleLock={() => handleAction(emp.id, "lock")} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          <div className="e-action-row">
            <div className="e-circle e-add-person-circle e-clickable"
              onClick={() => handleAction(null, "edit")}>
              <DimPlusIcon className="e-circle e-add-person-icon" />
              <span className="e-add-person-text">Add&nbsp;employee</span>
            </div>
          </div>
        </>
      }
    </>
  )
}
export default EmployeesList;
