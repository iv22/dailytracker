import React from 'react';
import { UploadDropzoneIcon } from "components/General/Icons";
import PropTypes from 'prop-types';

const EmployeesUpload = ({handleShow}) => {

  const handleFormClose = (e) => {
    if (e.target.id == "e-upload") {
      handleShow(false);
    }
  }

  return (
    <div id="e-upload" className="modal-layer smooth" onClick={handleFormClose}>
      <div className="modal-upload smooth e-upload-form">
        <span className="close" onClick={() => handleShow(false)}>
          &times;
        </span>
        <UploadDropzoneIcon className="e-upload-dropzone" />
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

EmployeesUpload.propTypes = {
  handleShow: PropTypes.func.isRequired
};

export default EmployeesUpload;
