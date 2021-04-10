import React from 'react';
import { SendIcon, EditIcon, LockIcon } from "components/General/Icons";

const EmployeesListActions = ({handleEdit}) => {
  return (
    <React.Fragment>
      <div className="e-action e-clickable-icon" title="Resend invitation">
        <SendIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Edit" onClick={handleEdit}>
        <EditIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Lock">
        <LockIcon />
      </div>
    </React.Fragment>
  )
}
export default EmployeesListActions;