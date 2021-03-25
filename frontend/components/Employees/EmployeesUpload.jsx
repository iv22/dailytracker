import React from 'react';

const EmployeesUpload = (props) => {

  const handleFormClose = (e) => {
    if (e.target.id == "e-upload") {
      props.handleShow(false);
    }
  }

  return (
    <div id="e-upload" className="modal smooth" onClick={handleFormClose}>
      <div id="e-upload-form" className="modal-upload smooth">
        <span className="close" onClick={() => props.handleShow(false)}>
          &times;
        </span>
        <div className="e-upload-dropzone"></div>
        <div id="e-upload-text">
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