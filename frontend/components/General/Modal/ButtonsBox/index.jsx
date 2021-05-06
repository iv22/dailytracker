import React from 'react';
import PropTypes from 'prop-types';

const ModalButtons = ({handleModalClose, okCaption, cancelCaption}) => {
  return (
    <div className="modal-buttons">
      <button type="submit" className="right-button e-clickable submit-color" >
        {okCaption}
      </button>
      <button type="button" className="right-button e-clickable cancel-color" onClick={handleModalClose}>
        {cancelCaption}
      </button>
    </div>
  )
}

ModalButtons.propTypes = {
  handleModalClose: PropTypes.func.isRequired,
  okCaption: PropTypes.string,
  cancelCaption: PropTypes.string
};

ModalButtons.defaultProps = {
  okCaption: "OK",
  cancelCaption: "CANCEL"
};

export default ModalButtons;
