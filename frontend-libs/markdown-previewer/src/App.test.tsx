import * as React from 'react'
import { render } from '@testing-library/react'
import App, { Editor, Preview } from './App'
import { unmountComponentAtNode } from 'react-dom'

// mockProps
const mockContent = '# Random markdown value\nTesting some MD stuff.\nMeaningless List\n\t* Item 1'

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

afterAll(() => {
  console.log(container)
})

// Tests
test('renders textarea with id editor in <Editor />', () => {
  const { container } = render(<Editor value={mockContent} handleChange={() => null}/>)
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
  const { getByText } = render(<Editor value={mockContent} handleChange={() => null}/>)
  const element = getByText('Editor')
  expect(element).toBeInTheDocument()
  expect(element?.tagName).toBe('H2')
})

test('renders element with id preview in <Preview />', () => {
  const { container } = render(<Preview value={mockContent}/>)
  const element = container.querySelector('#preview')
  expect(element).toBeTruthy()
})

// After this test we know <Preview /> is rendered in <App />
test('renders div element with id preview in <App />', () => {
  const { container } = render(<App />)
  const element = container.querySelector('#preview')
  expect(element).toBeTruthy()
  expect(element?.tagName).toBe('DIV')
})

test('GH flavoured markdown renders as HTML', () => {
  const { container, debug } = render(<Preview value={mockContent} />)
  debug(container)
  // mock from here on. Just checking how the new function works out.
  expect(container).toBeTruthy()
})
