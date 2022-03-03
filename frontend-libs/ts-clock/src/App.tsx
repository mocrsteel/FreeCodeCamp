import React from 'react'
import './App.sass'

function App () {
  const [sessionLength, updateSessionLength] = React.useState(5)
  const [breakLength, updateBreakLength] = React.useState(25)
  // const [isRunning, updateIsRunning] = React.useState(true)

  const clickHandler = (e: React.MouseEvent) => {
    console.log(e.currentTarget.id)
    switch (e.currentTarget.id) {
      case 'break-increment':
        updateBreakLength(breakLength + 1)
        break
      case 'break-decrement':
        updateBreakLength(breakLength - 1)
        break
      case 'session-increment':
        updateSessionLength(sessionLength + 1)
        break
      case 'session-decrement':
        updateSessionLength(sessionLength - 1)
        break
      default:
        console.warn(`Unidentified case ${e.currentTarget.id}`)
        break
    }
  }
  return (
    <div className="App">
      <h1 id='break-label'>Break Length</h1>
      <div id="break-length">{breakLength}</div>
      <button id='break-increment' onClick={clickHandler}> + </button>
      <button id='break-decrement' onClick={clickHandler}> - </button>
      <h1 id="session-label">Session Length</h1>
      <div id="session-length">{sessionLength}</div>
      <button id='session-increment' onClick={clickHandler}> + </button>
      <button id='session-decrement' onClick={clickHandler}> - </button>
    </div>
  )
}

export default App
