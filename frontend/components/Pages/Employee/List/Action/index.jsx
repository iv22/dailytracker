import React from 'react';
import { SendIcon, EditIcon, LockIcon } from "components/General/Icons";
import PropTypes from 'prop-types';

const EmployeesListActions = ({handleEdit}) => {
  return (
    <>
      <div className="e-action e-clickable-icon" title="Resend invitation">
        <SendIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Edit" onClick={handleEdit}>
        <EditIcon />
      </div>
      <div className="e-action e-clickable-icon" title="Lock">
        <LockIcon />
      </div>
    </>
  )
}

EmployeesListActions.propTypes = {
  handleEdit: PropTypes.func.isRequired
};

export default EmployeesListActions;
