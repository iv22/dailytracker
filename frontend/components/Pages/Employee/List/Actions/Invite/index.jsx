import React, { useState, useEffect } from 'react';
import ModalButtons from 'components/General/Modal/ButtonsBox';
import axios from 'init/api';
import { useForm } from "react-hook-form";
import PropTypes from 'prop-types';

const EmployeeInvite = ({id, handleModalClose, updatedAt}) => {
  const [error, setError] = useState();

  // functions to build form returned by useForm() hook
  const { register, handleSubmit, setValue } = useForm({});

  function handleOnSubmit() {
    return inviteUser();
  }

  const handleOnClose = (e) => {
    if (e.target.id == "e-employee") {
      handleModalClose();
    }
  }

  const inviteUser = () => {
    const fetchData = async () => {
      setError();

      return axios.post(`invitation/${id}`)
      .then(() => {
        handleModalClose();
        updatedAt(Date.now);
      }).catch(error => {
        const data = error.response.data;
        setError(data["message"]);
      });
    }
    fetchData();
  }

  useEffect(() => {
    const fetchData = async () => {
      setError();
      try {
        const result = await axios(`employees/${id}`);
        if (result.data) {
          const fields = ["email", "first_name", "last_name"];
          fields.forEach(field => setValue(field, result.data[field]));
        } else {
          setError("Error getting Employee data");
        }
      } catch (error) {
        setError(error);
      }
    };
    fetchData();
  },[setValue]);

  return (
    <div id="e-employee" className="modal-layer smooth" onClick={handleOnClose} >
      <div className="modal-invite right">
        <form name="member" onSubmit={handleSubmit(handleOnSubmit)} >
          <p className="modal-title">Resend invite to Employee</p>
          {error && <div className="alert alert-danger" role="alert">{error}</div>}
          <div className="flex-outer">
            <div>
              <label htmlFor="e-employee-email" className="modal-caption">Email:</label>
              <input type="email" id="e-employee-email" name="email" ref={register}
                className="modal-input" readOnly={true} />
            </div>
            <div>
              <label htmlFor="e-employee-fname" className="modal-caption">First name:</label>
              <input type="text" id="e-employee-fname" name="first_name" ref={register}
                className="modal-input" readOnly={true} />
            </div>
            <div>
              <label htmlFor="e-employee-lname" className="modal-caption">Last name:</label>
              <input type="text" id="e-employee-lname" name="last_name" ref={register}
                className="modal-input" readOnly={true} />
            </div>
          </div>
          <ModalButtons handleModalClose={handleModalClose} />
        </form>
      </div>
    </div>
  )
}

EmployeeInvite.propTypes = {
  id: PropTypes.number,
  handleModalClose: PropTypes.func.isRequired,
  updatedAt: PropTypes.func.isRequired
};

export default EmployeeInvite;
