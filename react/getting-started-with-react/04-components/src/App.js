import React from 'react'
import ReactDOM from 'react-dom'
import JSXComponent from './01-JSXComponent'
import NonJSXComponent from './02-NonJSXComponent'
import ClassComponent from './03-ClassComponent'
import SimpleComponent from './04-SimpleComponent'
import NestedComponent from './05-NestedComponent'

class App extends React.Component {
  render() {
    return (
      <nav>
        <a href="#JSXComponent">01-JSXComponent</a>
        <a href="#NonJSXComponent">02-NonJSXComponent</a>
        <a href="#ClassComponent">03-ClassComponent</a>
        <a href="#SimpleComponent">04-SimpleComponent</a>
        <a href="#NestedComponent">05-NestedComponent</a>
        <hr />
      </nav>
    )
  }
}

let components = {
  JSXComponent: JSXComponent,
  NonJSXComponent: NonJSXComponent,
  ClassComponent: ClassComponent,
  SimpleComponent: SimpleComponent,
  NestedComponent: NestedComponent,
}

function renderApp() {
  let hash = window.location.hash
  let name = hash === '' ? '' : hash.substring(1)
  let Component = components[name]

  if (typeof Component === 'undefined') {
    Component = () => <h1>Undefined Component</h1>
  }

  ReactDOM.render(<div><App /><Component /></div>,
                  document.getElementById('root'))
}

window.onhashchange = renderApp

export default App
