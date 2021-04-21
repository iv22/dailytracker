import React from 'react';
import { SendIcon, EditIcon, LockIcon } from "components/General/Icons";
import PropTypes from 'prop-types';

const EmployeesListActions = ({handleInvite, handleEdit, handleLock}) => {
  return (
    <>
      <div className="e-action e-clickable-icon" title="Resend invitation" onClick={handleInvite}>
        <SendIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Edit" onClick={handleEdit}>
        <EditIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Lock" onClick={handleLock}>
        <LockIcon />
      </div>
    </>
  )
}

EmployeesListActions.propTypes = {
  handleInvite: PropTypes.func.isRequired,
  handleEdit: PropTypes.func.isRequired,
  handleLock: PropTypes.func.isRequired
};

export default EmployeesListActions;
