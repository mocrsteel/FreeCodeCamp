import React from 'react'
import './App.sass'

function App () {
  const [sessionLength, updateSessionLength] = React.useState([5, 0])
  const [breakLength, updateBreakLength] = React.useState([25, 0])
  
  return (
    <div className="App">
      <h1 id='break-label'>Break Length</h1>
      <h2 id="break-length">{breakLength}</h2>
      <button id='break-increment'></button>
      <button id='break-decrement'></button>
      <h1 id="session-label">Session Length</h1>
      <h2 id="session-length">{sessionLength}</h2>
      <button id='session-increment'></button>
      <button id='session-decrement'></button>
    </div>
  )
}

export default App
