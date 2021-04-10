import React, { useState, useEffect } from 'react';
import ModalButtons from 'components/General/Modal/ButtonsBox';
import axios from 'init/api';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup';
import * as Yup from 'yup';

const EmployeeAddEdit = ({id, handleModalClose, updatedAt}) => {
  const isEdit = Boolean(id);
  const [error, setError] = useState();

  // form validation rules
  const validationSchema = Yup.object().shape({
    email: Yup.string()
      .email('Email is invalid')
      .required('Email is required'),
    first_name: Yup.string()
      .required('First Name is required'),
    last_name: Yup.string()
      .required('Last Name is required'),
    role: Yup.string()
      .required('Role is required')
  });

  // functions to build form returned by useForm() hook
  const { register, handleSubmit, setValue, getValues, errors, formState } = useForm({
    resolver: yupResolver(validationSchema)
  });

  function handleOnSubmit(data) {
    return isEdit ? updateUser(id, data) : createUser(data);
  }

  const handleOnClose = (e) => {
    if (e.target.id == "e-employee") {
      handleModalClose();
    }
  }

  const createUser = (data) => {
    const fetchData = async () => {
      setError();
      try {
        const result = await axios.post(`employees`, {member: data});
        if (result.data) {
          handleModalClose();
          updatedAt(Date.now);
        } else {
          setError("Error adding Employee");
        }
      } catch (error) {
        setError("Error adding Employee");
      }
    }
    fetchData();
  }

  const updateUser = (id, data) => {
    const fetchData = async () => {
      setError();
      try {
        const result = await axios.put(`employees/${id}`, {member: data});
        if (result.data) {
          handleModalClose();
          updatedAt(Date.now);
        } else {
          setError("Error updating Employee");
        }
      } catch (error) {
        setError("Error updating Employee");
      }
    }
    fetchData();
  }

  useEffect(() => {
    if (isEdit) {
      const fetchData = async () => {
        setError();
        try {
          const result = await axios(`employees/${id}`);
          if (result.data) {
            const fields = ["email", "first_name", "last_name", "role", "phone"];
            fields.forEach(field => setValue(field, result.data[field]));
          } else {
            setError("Error getting Employee data");
          }
        } catch (error) {
          setError(error);
        }
      };
      fetchData();
    }
  }, []);

  return (
    <div id="e-employee" className="modal-layer smooth" onClick={handleOnClose} >
      <div className="modal-edit right">
        <form name="member" onSubmit={handleSubmit(handleOnSubmit)} >
          <p className="modal-title">{isEdit ? "Edit " : "Add "}Employee</p>
          {error && <div className="alert alert-danger" role="alert">{error}</div>}
          <div className="flex-outer">
            <div>
              <label htmlFor="e-employee-email" className="modal-caption">Email:</label>
              <input type="email" id="e-employee-email" name="email" ref={register} className="modal-input" readOnly={isEdit} />
              <div className="invalid-feedback">{errors.email?.message}</div>
            </div>
            <div>
              <label htmlFor="e-employee-fname" className="modal-caption">First name:</label>
              <input type="text" id="e-employee-fname" name="first_name" ref={register} className="modal-input" />
              <div className="invalid-feedback">{errors.first_name?.message}</div>
            </div>
            <div>
              <label htmlFor="e-employee-fname" className="modal-caption">Last name:</label>
              <input type="text" id="e-employee-lname" name="last_name" ref={register} className="modal-input" />
              <div className="invalid-feedback">{errors.last_name?.message}</div>
            </div>
            <div>
              <label htmlFor="e-employee-role" className="modal-caption">Role:</label>
              <select name="role" ref={register} className="modal-input">
                <option value=""></option>
                <option value="employee">employee</option>
                <option value="manager">manager</option>
              </select>
              <div className="invalid-feedback">{errors.role?.message}</div>
            </div>
            <div>
              <label htmlFor="e-employee-phone" className="modal-caption">Phone:</label>
              <input type="tel" id="e-employee-phone" name="phone" ref={register} className="modal-input" />
            </div>
          </div>
          <ModalButtons handleModalClose={handleModalClose} />
        </form>
      </div>
    </div>
  )
}

export default EmployeeAddEdit;
