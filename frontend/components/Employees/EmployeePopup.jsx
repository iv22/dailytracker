import React, { useState, useEffect } from 'react';
import ModalButtons from 'components/ModalButtons';
import axios from '../../init/api';
import { useForm } from "react-hook-form";
import { yupResolver } from '@hookform/resolvers/yup';
import * as Yup from 'yup';

const EmployeePopup = (props) => {
  const id = props.id;
  const isEdit = Boolean(id);
  const [user, setUser] = useState({});
  const [isError, setIsError] = useState(false);

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
      props.handleShow(false);
    }
  }

  const createUser = (data) => {
    console.log('createUser');
    console.log(data);
  }

  const updateUser = (id, data) => {
    console.log('updateUser: ' + id);
  }

  useEffect(() => {
    if (isEdit) {
      const fetchData = async () => {
        try {
          const result = await axios("employees/" + id);
          if (result.data != null) {
            const fields = ["email", "first_name", "last_name", "role", "phone"];
            fields.forEach(field => setValue(field, result.data[field]));
            setUser(result.data);
          } else {
            setIsError(true);
          }
        } catch (error) {
          setIsError(true);
        }
      };
      fetchData();
    }
  }, []);

  return (
    <div id="e-employee" className="modal smooth" onClick={handleOnClose} >
      <div className="modal-edit right">
        <form name="member" onSubmit={handleSubmit(handleOnSubmit)} >
          <p className="modal-title">{isEdit ? "Edit " : "Add "}Employee</p>
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
          <ModalButtons cancel={() => props.handleShow(false)} />
        </form>
      </div>
    </div>
  )
}

export default EmployeePopup;
