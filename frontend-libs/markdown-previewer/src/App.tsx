import React from 'react'
import './App.css'

const Editor = () => {
  return (
    <div>
      <h1>Markdown Editor</h1>
      <textarea id='editor'></textarea>
    </div>
  )
}

const Preview = () => {
  return (
    <div id='preview'></div>
  )
}

const App = () => {
  return (
    <div className="App">
      <Editor />
      <Preview />
    </div>
  )
}

export default App
export { Editor, Preview }
