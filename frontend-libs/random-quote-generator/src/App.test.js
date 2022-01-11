import { render, screen } from '@testing-library/react'
import App from './App'

// test('renders learn react link', () => {
//   render(<App />)
//   const linkElement = screen.getByText(/learn react/i)
//   expect(linkElement).toBeInTheDocument()
// })

const setupTesting = () => {
    render(<App />)
    return {
      quoteBox: document.getElementById('quote-box'),
      text: document.getElementById('text'),
      author: document.getElementById('author') 
    }
}

test('id quote-box is present', () => {
  const testSetup = setupTesting()
  const elementExists = !!testSetup.quoteBox
  expect(elementExists).toBe(true)
})

test('id "text" is present in "quote-box"', () => {
  const testSetup = setupTesting()
  const elementExists = !!testSetup.text
  expect(elementExists).toBe(true)
})

test('id "text" is present in "quote-box"', () => {
  const testSetup = setupTesting()
  const elementExists = !!testSetup.author
  expect(elementExists).toBe(true)
});

/*
FREECODECAMP REQUIREMENTS

User Story #1: I can see a wrapper element with a corresponding id="quote-box".

User Story #2: Within #quote-box, I can see an element with a corresponding id="text".

User Story #3: Within #quote-box, I can see an element with a corresponding id="author".

User Story #4: Within #quote-box, I can see a clickable element with a corresponding id="new-quote".

User Story #5: Within #quote-box, I can see a clickable a element with a corresponding id="tweet-quote".

User Story #6: On first load, my quote machine displays a random quote in the element with id="text".

User Story #7: On first load, my quote machine displays the random quote's author in the element with id="author".

User Story #8: When the #new-quote button is clicked, my quote machine should fetch a new quote and display it in the #text element.

User Story #9: My quote machine should fetch the new quote's author when the #new-quote button is clicked and display it in the #author element.

User Story #10: I can tweet the current quote by clicking on the #tweet-quote a element. This a element should include the "twitter.com/intent/tweet" path in its href attribute to tweet the current quote.

User Story #11: The #quote-box wrapper element should be horizontally centered. Please run tests with browser's zoom level at 100% and page maximized.

*/
