import React from 'react';

const ModalButtons = ({cancel}) => {
  return (
    <div id="modal-buttons">
      <button type="submit" className="right-button e-clickable submit-color" >SAVE</button>
      <button type="button" className="right-button e-clickable cancel-color" onClick={cancel}>CANCEL</button>
    </div>
  )
}

export default ModalButtons;