import React from 'react'
import { render } from '@testing-library/react'
import { Editor } from './App'

test('renders learn react link', () => {
  const { container, debug, unmount } = render(<Editor />)
  const element = container.querySelector('textarea')
  // debug(element)
  // console.log(element.id)
  if (element !== null) {
    expect(element.id).toBe('editor')
  }
  unmount()
})
