import React from 'react';
import PropTypes from 'prop-types';

const ModalButtons = ({handleModalClose}) => {
  return (
    <div className="modal-buttons">
      <button type="submit" className="right-button e-clickable submit-color" >
        SAVE
      </button>
      <button type="button" className="right-button e-clickable cancel-color" onClick={handleModalClose}>
        CANCEL
      </button>
    </div>
  )
}

ModalButtons.propTypes = {
  handleModalClose: PropTypes.func.isRequired
};

export default ModalButtons;
