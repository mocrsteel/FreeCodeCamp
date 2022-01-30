import * as React from 'react'
import { Fragment, useState } from 'react'
import './styles/App.scss'
import { marked } from 'marked'

export type mdProps = {
  value: string,
  handleChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void
}

export type defaultEditorContent = string

export const Editor = ({ value, handleChange }: mdProps): JSX.Element => {
  return (
    <Fragment>
      <div className='Editor'>
        <h2 className='PanelTitle'>Editor</h2>
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
        <h2 className='PanelTitle'>Preview</h2>
        <div id='preview' dangerouslySetInnerHTML={{ __html: marked.parse(value).trim() }}>
        </div>
      </div>
    </Fragment>
  )
}

const App = () => {
  const defaultEditorContent = '# Main Title\n# Sub Title 1\n## Sub Title 2' +
    '\n\nLook at [Duck Duck Go](https://duckduckgo.com)' +
    '\nSome options for a `code` block:\n* Python\n* JavaScript\n* SASS' +
    '\n\n```\nfor (let i = 0; i < 25; i++) {\n\tconsole.log(hello world!)\n}\n```'
  const [textAreaValue, updateTextAreaValue] = useState(defaultEditorContent)
  const handleTextAreaChange = (e: React.ChangeEvent<HTMLTextAreaElement>): void => {
    updateTextAreaValue(e.currentTarget.value)
  }
  return (
    <Fragment>
      <div className='App'>
        <div className='Title'>
          <h1>Markdown Editor</h1>
        </div>
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
