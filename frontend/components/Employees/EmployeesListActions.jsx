import React, {useState} from 'react';
import { SendIcon, EditIcon, LockIcon } from 'components/Icons';

const EmployeesListActions = ({handleEdit}) => {
  const [isHover, setIsHover] = useState({});
  const icons = {
    send: SendIcon,
    edit: EditIcon,
    lock: LockIcon
  };

  const setHover = (component, value) => {
    setIsHover(prevState => ({...prevState, [component]: value}));
  }

  const getIconComponent = (name) => {
    const Icon = icons[name];
    return <Icon stroke={isHover[name] ? "red" : "none"}
      onMouseEnter={() => setHover(name, true)}
      onMouseLeave={() => setHover(name, false)} />
  }

  return (
    <React.Fragment>
      <div className="e-action e-clickable-icon" title="Resend invitation">
        {getIconComponent('send')}
      </div>
      <div className="e-action e-clickable-icon" title="Edit" onClick={handleEdit}>
        {getIconComponent('edit')}
      </div>
      <div className="e-action e-clickable-icon" title="Lock">
        {getIconComponent('lock')}
      </div>
    </React.Fragment>
  )
}
export default EmployeesListActions;