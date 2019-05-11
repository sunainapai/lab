import React from 'react'

class ListComponent extends React.Component {
  render() {
    const rows = this.props.colorList.map((row, index) => {
      return (
        <li key={index}>
          {row}
          <button onClick={() => this.props.removeColor(index)}>Delete</button>
        </li>
      ) 
    })

    return <ol>{rows}</ol>
  }
}

class StateDisplayComponent extends React.Component {
  state = {
    colors: ['red', 'green', 'blue'],
  }

  removeColor = index => {
    console.log('removeColor() started; state:', this.state)

    // The setState() call is asynchronous. The callback passed to it is
    // called when it completes.
    this.setState({
      colors: this.state.colors.filter((color, i) => {
        return i !== index
      })
    }, () => {console.log('setState() done; state:', this.state)})

    console.log('removeColor() done; state:', this.state)
  }

  render() {
    return (
        <div>
          <ListComponent heading="List of Colors"
                         colorList={this.state.colors}
                         removeColor={this.removeColor} />
        </div>
    )
  }
}

class StateComponent extends React.Component {
   render() {
     return (
       <div>
         <StateDisplayComponent />
       </div>
     )
   }
}

export default StateComponent
