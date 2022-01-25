import * as React from 'react'
import { Fragment, useState } from 'react'
import './App.css'
import { marked } from 'marked'

export type mdProps = {
  value: string,
  handleChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void
}

export const Editor = ({ value, handleChange }: mdProps): JSX.Element => {
  return (
    <Fragment>
        <h2>Editor</h2>
        <textarea id='editor' value={value} onChange={handleChange}></textarea>
    </Fragment>
  )
}

export const Preview = ({ value }: { value: mdProps['value'] }): JSX.Element => {
  // function gives errors for now. Check console log and figure out what to to.
  const convertToHTML = (htmlString: string) => {
    const template = document.createElement('template')
    htmlString = marked.parse(htmlString).trim()
    template.innerHTML = htmlString
    return template.content.childNodes
  }
  console.log(convertToHTML(value))
  return (
    <Fragment>
    <h2>Preview</h2>
    <div id='preview'>
      {value}
    </div>
    </Fragment>
  )
}

const App = () => {
  const [textAreaValue, updateTextAreaValue] = useState('')
  const handleTextAreaChange = (e: React.ChangeEvent<HTMLTextAreaElement>): void => {
    updateTextAreaValue(e.currentTarget.value)
  }
  return (
    <Fragment>
      <h1>Markdown Editor</h1>
      <Editor
        value={textAreaValue}
        handleChange={handleTextAreaChange}
      />
      <Preview value={textAreaValue}/>
    </Fragment>
  )
}

export default App
