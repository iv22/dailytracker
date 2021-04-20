import React, { useState, useEffect } from "react";
import { UploadDropzoneIcon } from "components/General/Icons";
import PropTypes from "prop-types";
import {useDropzone} from "react-dropzone";
import axios from "init/api";

const EmployeesUpload = ({handleShow}) => {
  const [files, setFiles] = useState([]);
  const [result, setResult] = useState({status: 100, message: ""});

  const {acceptedFiles, getRootProps, getInputProps} = useDropzone({
    accept: "text/csv",
    maxFiles: 1
  });

  useEffect(() => {
    let newFiles = acceptedFiles.map(file => (
      <li key={file.path}>
        {file.path} - {file.size} bytes
      </li>
    ));
    setFiles(newFiles);
  },[acceptedFiles, result]);

  const removeFile = () => {
    acceptedFiles.length = 0
    acceptedFiles.splice(0, acceptedFiles.length)
  }

  const handleFormClose = (e) => {
    if (e.target.id == "e-upload") {
      handleShow(false);
    }
  }

  const handleSubmit = () => {
    const fetchData = async () => {
      acceptedFiles.map(file => {
        const formData = new FormData()
        formData.append('employees', file);

        return axios.post('employees/upload', formData, {
          headers: { "Content-Type": "multipart/form-data" }
        }).then(response => {
          const data = response.data;
          const status = response.status;
          setResult({status: status, message: data["message"]});
          removeFile();
        }).catch(error => {
          const data = error.response.data;
          const status = error.response.status;
          setResult({status: status, message: data["message"]});
        });
      });
    }

    fetchData();
  }

  return (
    <div id="e-upload" className="modal-layer smooth" onClick={handleFormClose}>
      <div className="modal-upload smooth" >
        <span className="close" onClick={() => handleShow(false)}>
          &times;
        </span>
        { result["status"] != 100 &&
          <div className={`e-upload-result alert ${result["status"] == 202 ? "alert-success" : "alert-danger"}`}
            role="alert">
            {result["message"]}
          </div>
        }
        <div className="e-upload-body">
          <UploadDropzoneIcon className="e-upload-icon" />
          <div {...getRootProps({className: "e-upload-zone" })} >
            <input {...getInputProps()} />
            <div className="e-upload-text">
              Drag &amp; Drop files here
              <br />
              or click to Browse
            </div>
          </div>
          <aside className="e-upload-info">
              <h6>You attached the file:</h6>
              <ul>{files}</ul>
          </aside>
          { files.length > 0 &&
            <button type="button" className="right-button e-clickable submit-color" onClick={handleSubmit}>
              Submit
            </button>
          }
        </div>
      </div>
    </div>
  )
}

EmployeesUpload.propTypes = {
  handleShow: PropTypes.func.isRequired
};

export default EmployeesUpload;
