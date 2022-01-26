import * as React from 'react'
import { Fragment, useState } from 'react'
import './styles/App.scss'
import { marked } from 'marked'

export type mdProps = {
  value: string,
  handleChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void
}

export const Editor = ({ value, handleChange }: mdProps): JSX.Element => {
  return (
    <Fragment>
      <div className='Editor'>
        <h2>Editor</h2>
        <textarea id='editor' value={value} onChange={handleChange}></textarea>
      </div>
    </Fragment>
  )
}

export const Preview = ({ value }: { value: mdProps['value'] }): JSX.Element => {
  // function gives errors for now. Check console log and figure out what to to.
  return (
    <Fragment>
      <div className='Previewer'>
        <h2>Preview</h2>
        <div id='preview' dangerouslySetInnerHTML={{ __html: marked.parse(value).trim() }}>
        </div>
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
      <div className='App'>
        <h1 className='Title'>Markdown Editor</h1>
        <div className='Content'>
          <Editor
            value={textAreaValue}
            handleChange={handleTextAreaChange}
          />
          <Preview value={textAreaValue}/>
        </div>
      </div>
    </Fragment>
  )
}

export default App
