import React from 'react';
import ModalButtons from 'components/ModalButtons';

const EmployeePopup = (props) => {

  const handleFormClose = (e) => {
    if (e.target.id == "e-employee") {
      props.handleShow(false);
    }
  }

  const handleSaveClick = () => {
    console.log('SAVE')
  }

  return (
    <div id="e-employee" className="modal smooth" onClick={handleFormClose} >
      <div className="modal-edit right">
        <form name="member">
          <p className="modal-title">Employee</p>
          <div className="flex-outer">
            <div>
              <label htmlFor="e-employee-email" className="modal-caption">Email:</label>
              <input type="email" id="e-employee-email" name="email" className="modal-input"></input>
            </div>
            <div>
              <label htmlFor="e-employee-fname" className="modal-caption">First name:</label>
              <input type="text" id="e-employee-fname" name="fname" className="modal-input"></input>
            </div>
            <div>
              <label htmlFor="e-employee-fname" className="modal-caption">Last name:</label>
              <input type="text" id="e-employee-lname" name="lname" className="modal-input"></input>
            </div>
            <div>
              <label htmlFor="e-employee-role" className="modal-caption">Role:</label>
              <input type="text" id="e-employee-role" name="role" className="modal-input"></input>
            </div>
            <div>
              <label htmlFor="e-employee-phone" className="modal-caption">Phone:</label>
              <input type="tel" id="e-employee-phone" name="phone" className="modal-input"></input>
            </div>
          </div>
          <ModalButtons save={handleSaveClick} cancel={() => props.handleShow(false)} />
        </form>
      </div>
    </div>
  )
}

export default EmployeePopup;
