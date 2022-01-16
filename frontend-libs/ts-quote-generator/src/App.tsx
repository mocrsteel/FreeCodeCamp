import React from 'react'
import './App.css'

const QuoteContent = () => {
  return (
    <div id="quote-content">
      <div id="text" className='card-text p-5'>
      Testing element here.
      </div>
      <div id="author" ></div>
    </div>
  )
}

const QuoteButtons = () => {
  return (
    <div id="buttons" className="w-100 d-flex flex-row justify-content-between m-5">
        <div id="socials" className="">
          <button
            id="tweet-quote"
            className="btn btn-primary btn-circle btn-sm card-link" type="button">
            <i className='bi bi-twitter'/></button>
          </div>
        <div>
          <button id="new-quote" className="btn btn-sm card-link">New Quote</button>
        </div>
    </div>
  )
}

// left at arranging the buttons as I want them.

const QuoteBox = () => {
  return (
    <div id="quote-box" className="my-auto card">
      <QuoteContent />
      <QuoteButtons />
    </div>
  )
}

const App = () => {
  return (
  <div className="h-100 d-flex justify-content-center">
    <QuoteBox />
  </div>
  )
}

export default App
