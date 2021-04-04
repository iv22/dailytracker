import React from 'react';

const EmployeesUpload = ({handleShow}) => {

  const handleFormClose = (e) => {
    if (e.target.id == "e-upload") {
      handleShow(false);
    }
  }

  return (
    <div id="e-upload" className="modal smooth" onClick={handleFormClose}>
      <div className="modal-upload smooth e-upload-form">
        <span className="close" onClick={() => handleShow(false)}>
          &times;
        </span>
        <div className="e-upload-dropzone"></div>
        <div className="e-upload-text">
          Drag &amp; drop files here
          <br />
          or
        </div>
        <button type="button" className="smooth-button e-clickable">Browse</button>
        <button type="button" className="right-button e-clickable submit-color">Submit</button>
      </div>
    </div>
  )
}

export default EmployeesUpload;