import React from 'react';

const ModalButtons = (props) => {
  return (
    <div id="modal-buttons">
      <button type="button" className="right-button e-clickable submit-color" onClick={props.save}>SAVE</button>
      <button type="button" className="right-button e-clickable cancel-color" onClick={props.cancel}>CANCEL</button>
    </div>
  )
}

export default ModalButtons;