import React from 'react';
import { SendIcon, SendRedIcon, EditIcon, EditRedIcon, LockIcon, LockRedIcon } from 'components/Icons';

const EmployeesListActions = (props) => {
  return (
    <React.Fragment>
      <img className="e-action e-clickable-icon" src={SendIcon} title="Resend invitation"
        onMouseOver={(e) => {e.target.src = SendRedIcon}}
        onMouseOut={(e) => {e.target.src = SendIcon}} />
      <img className="e-action e-clickable-icon" src={EditIcon} title="Edit"
        onMouseOver={(e) => {e.target.src = EditRedIcon}}
        onMouseOut={(e) => {e.target.src = EditIcon}}
        onClick={props.handleEdit} />
      <img className="e-action e-clickable-icon" src={LockIcon} title="Lock"
        onMouseOver={(e) => {e.target.src = LockRedIcon}}
        onMouseOut={(e) => {e.target.src = LockIcon}} />
    </React.Fragment>
  )
}
export default EmployeesListActions;