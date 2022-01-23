import React from 'react'
import { render } from '@testing-library/react'
import App, { Editor, Preview } from './App'
import { unmountComponentAtNode } from 'react-dom'

// Setup
let container: HTMLDivElement | null = null
beforeEach(() => {
  container = document.createElement('div')
  document.body.appendChild(container)
})

afterEach(() => {
  if (container) unmountComponentAtNode(container)
  container?.remove()
  container = null
})

// Tests
test('renders textarea with id editor in <Editor />', () => {
  const { container } = render(<Editor />)
  const element = container.querySelector('#editor')
  // debug(element)
  // console.log(element.id)
  expect(element).toBeTruthy()
  expect(element?.tagName).toBe('TEXTAREA')
})

// after this test we know <Editor /> is rendered within <App />
test('renders textarea with id editor in <App />', () => {
  const { container } = render(<App />)
  const element = container.querySelector('#editor')
  expect(element).toBeTruthy()
  expect(element?.tagName).toBe('TEXTAREA')
})

test('Editor has h1 title Markdown Editor', () => {
  const { getByText } = render(<Editor />)
  const element = getByText('Markdown Editor')
  expect(element).toBeInTheDocument()
  expect(element?.tagName).toBe('H1')
})

test('renders element with id preview in <Preview />', () => {
  const { container } = render(<Preview />)
  const element = container.querySelector('#preview')
  expect(element).toBeTruthy()
})

// After this test we know <Preview /> is rendered in <App />
test('renders div element with id preview in <App />', () => {
  const { container, debug } = render(<App />)
  const element = container.querySelector('#preview')
  console.log(element?.tagName)
  expect(element).toBeTruthy()
  expect(element?.tagName).toBe('DIV')
})
