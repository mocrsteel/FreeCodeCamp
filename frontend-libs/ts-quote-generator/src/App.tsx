import React, { useState } from 'react'
import './App.css'

interface Quote {
  text: string,
  author: string,
}

const quotes: Quote[] = [
  {
    text: 'No place better than the home toilet.',
    author: 'Wise Me'
  },
  {
    text: 'Have you been on this one? I like a warm toilet.',
    author: 'Sammy Tange'
  },
  {
    text: 'Can we agree on this?',
    author: 'Protut'
  },
  {
    text: 'I\'m the bald guy',
    author: 'Seth Everman'
  }
]

const QuoteContent = (props: Quote) => {
  return (
    <div id="quote-content">
      <div id="text" className='d-flex flex-column align-items-end p-5'>
      <p>
        <i className="bi bi-quote"/>
        {props.text}
        <i className="bi bi-quote bi-quote-flip" />
      </p>
      <p id="quote-author" className="me-1">
        - {props.author} -</p>
      </div>
    </div>
  )
}

// We don't want the same quote each time we visit the page.
const randIdx = Math.floor(Math.random() * (quotes.length))
const initQuote: Quote = {
  text: quotes[randIdx].text,
  author: quotes[randIdx].author
}

const QuoteButtons = (props: any) => {
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
          <button id="new-quote" className="btn btn-bullet" onClick={props.onClick}>New Quote</button>
        </div>
    </div>
  )
}

const QuoteBox = () => {
  const [quote, updateQuote] = useState({
    text: initQuote.text,
    author: initQuote.author
  })
  const handleClick = () => {
    const randIdx = Math.floor(Math.random() * (quotes.length - 1))
    console.log('Clicked quote button.')
    updateQuote({
      text: quotes[randIdx].text,
      author: quotes[randIdx].author
    })
  }
  return (
    <div id="quote-box" className="my-auto w-80">
      <QuoteContent text={quote.text} author={quote.author}/>
      <QuoteButtons onClick={handleClick}/>
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
export { quotes }
