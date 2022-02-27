import React from 'react'
import { render, screen } from '@testing-library/react'
import App from './App'

test('renders break length label', () => {
  render(<App />)
  const labelElement = screen.getByText(/Break Length/)
  expect(labelElement).toBeInTheDocument()
  expect(labelElement.id).toBe('break-label')
})

test('renders session length label', () => {
  render(<App />)
  const labelElement = screen.getByText(/Session Length/)
  expect(labelElement).toBeInTheDocument()
  expect(labelElement.id).toBe('session-label')
})

test('renders length increment and decrement buttons', () => {
  const buttons = ['break-increment', 'break-decrement', 'session-increment', 'session-decrement']
  render(<App />)
  const buttonElements = screen.getAllByRole('button')
  const sessionButtons = buttonElements
    .filter(button => buttons.includes(button.id))
    .map(button => button.id)
  expect(buttons.every(id => sessionButtons.includes(id))).toBeTruthy()
})

test('renders set times for breaks and sessions lengths', () => {
  const timeIds = ['break-length', 'session-length']
  render(<App />)
  const h2Elements = screen.getAllByRole('heading', { level: 2 })
  const timeElements = h2Elements
    .filter(element => timeIds.includes(element.id))
    .map(element => element.id)
  expect(timeIds.every(id => timeElements.includes(id))).toBeTruthy()
})
