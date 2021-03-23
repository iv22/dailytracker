import React, { useEffect } from 'react';

const EmployeesUpload = () => {

  useEffect(() => {
    document.addEventListener('mousedown', hideUploadForm);
  }, []);

  const hideUploadForm = (e) => {
    let modal = document.getElementById("e-upload");
    if (e.target == modal) {
      modal.style.display = "none";
    }
  }

  const onCloseForm = (e) => {
    let modal = document.getElementById("e-upload");
    modal.style.display = "none";
  }

  return (
    <div id="e-upload" className="modal smooth">
      <div id="e-upload-form" className="modal-upload smooth">
        <span className="close" onClick={onCloseForm}>
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