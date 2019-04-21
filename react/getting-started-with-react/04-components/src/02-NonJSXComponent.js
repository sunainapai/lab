import React from 'react'

class NonJSXComponent extends React.Component {
  render() {
    return React.createElement(
      'div', {className: 'foo'}, React.createElement(
        'h1', null, 'Non JSX Component'))
  }
}

export default NonJSXComponent
