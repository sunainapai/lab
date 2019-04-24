import React from 'react'

class HeadingClassComponent extends React.Component {
  render() {
    const heading = 'Heading Class'
    return <h1>{heading + ' Component'}</h1>
  }
}

function HeadingSimpleComponent() {
  const heading = 'Heading Simple'
  return <h1>{`${heading} Component`}</h1>
}

class PropsHeadingClassComponent extends React.Component {
  render() {
    return <h1>{this.props.heading}</h1>
  }
}

function PropsHeadingSimpleComponent(props) {
  return <h1>{props.heading}</h1>
}

class PropsListComponent extends React.Component {
  render() {
    const rows = this.props.colorList.map((row, index) => {
      return (
        <li key={index}>{row}</li>
      ) 
    })

    return <ol>{rows}</ol>
  }

  // If we omit the "key" attribute in <li>, then we get this:
  //
  // Warning: Each child in a list should have a unique "key" prop.
}

class PropsHeadingListComponent extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.heading}</h1>
        <PropsListComponent colorList={this.props.colorList} /> 
      </div>
    )
  }
}

class PropsDisplayComponent extends React.Component {
  render() {
    const colors = [
      'red',
      'green',
      'blue'
    ]
    return (
      <div>
        <PropsHeadingListComponent heading={'List of Colors'}
                                   colorList={colors}/>
      </div>
    )
  }
}

function PropsComponent() {
  const heading = 'Props Heading Class Component'
  return (
    <div>
      <HeadingClassComponent />
      <HeadingSimpleComponent />
      <PropsHeadingClassComponent heading="Props Heading Class Component" />
      <PropsHeadingClassComponent heading={'Props Heading Class Component'} />
      <PropsHeadingClassComponent heading={heading} />
      <PropsHeadingSimpleComponent heading={'Props Heading Simple Component'} />
      <PropsDisplayComponent />
    </div>
  )
}

export default PropsComponent
