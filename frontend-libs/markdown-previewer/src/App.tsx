import React from 'react'
import './App.css'

const Editor = () => {
  return (
    <div>
      <p>Editor</p>
      <textarea id='editor'></textarea>
    </div>
  )
}

const App = () => {
  return (
    <div className="App">
      testing element
    </div>
  )
}

export default App
export { Editor }
