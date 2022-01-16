import React, { useState } from 'react'
import './App.css'

const QuoteContent = () => {
  return (
    <div id="quote-content">
      <div id="text" className='card-text p-5'>
      <p>
        <i className="bi bi-quote"/>
        Testing element here
        <i className="bi bi-quote bi-quote-flip" />
      </p>
      </div>
      <div id="author" ></div>
    </div>
  )
}

const QuoteButtons = () => {
  return (
    <div id="buttons" className="d-flex flex-row justify-content-between my-3 mx-4">
        <div id="socials">
          <button
            className="btn btn-circle me-1">
            <a
              id="tweet-quote"
              href="https://twitter.com/intent/tweet"
              target="_blank"
              rel="noreferrer">
                <i className='bi bi-twitter'/>
              </a></button>
          <button className='btn btn-circle me-1'>
            <a
              id="facebook-quote"
              href="https://www.facebook.com/"
              target="_blank" rel="noreferrer">
                <i className='bi bi-facebook' />
              </a>
          </button>
          <button className="btn btn-circle">
            <a
              id="whatsapp-quote"
              href="https://web.whatsapp.com/"
              target="_blank" rel="noreferrer">
                <i className="bi bi-whatsapp" />
              </a>
          </button>
          </div>
        <div>
          <button id="new-quote" className="btn btn-bullet">New Quote</button>
        </div>
    </div>
  )
}

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
  <div className="container-fluid h-100 d-flex justify-content-center">
    <QuoteBox />
  </div>
  )
}

export default App
