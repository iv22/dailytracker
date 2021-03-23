import React, { useEffect } from 'react';
import ModalButtons from 'components/ModalButtons';

const Employee = () => {

  useEffect(() => {
    document.addEventListener('mousedown', hideEmployeeForm);
  }, []);

  const hideEmployeeForm = (e) => {
    let modal = document.getElementById("e-employee");
    if (e.target == modal) {
      modal.style.display = "none";
    }
  }

  const saveClickHandler = () => {
    console.log('SAVE')
  }

  const cancelClickHandler = () => {
    document.getElementById("e-employee").style.display = "none";
  }

  return (
    <div id="e-employee" className="modal smooth">
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
          <ModalButtons save={saveClickHandler} cancel={cancelClickHandler} />
        </form>
      </div>
    </div>
  )
}

export default Employee;