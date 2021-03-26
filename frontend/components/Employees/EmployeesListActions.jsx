import React from 'react';
import { SendIcon, SendRedIcon, EditIcon, EditRedIcon, LockIcon, LockRedIcon } from 'components/Icons';

const EmployeesListActions = () => {
  return (
    <React.Fragment>
      <img className="e-action e-clickable-icon" src={SendIcon}
        onMouseOver={(e) => {e.target.src = SendRedIcon}}
        onMouseOut={(e) => {e.target.src = SendIcon}} />
      <img className="e-action e-clickable-icon" src={EditIcon}
        onMouseOver={(e) => {e.target.src = EditRedIcon}}
        onMouseOut={(e) => {e.target.src = EditIcon}} />
      <img className="e-action e-clickable-icon" src={LockIcon}
        onMouseOver={(e) => {e.target.src = LockRedIcon}}
        onMouseOut={(e) => {e.target.src = LockIcon}} />
    </React.Fragment>
  )
}
export default EmployeesListActions;