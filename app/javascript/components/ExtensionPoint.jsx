import React from 'react'

export default class ExtensionPoint extends React.Component {
  static extensions = {}

  static registerExtension(slotName, component) {
    if (!this.extensions[slotName])
      this.extensions[slotName] = []

    this.extensions[slotName].push(component)
  }

  render() {
    return ExtensionPoint.extensions[this.props.name].map((e, i) => {
      return React.createElement(e, { key: i })
    })
  }
}

window.ExtensionPoint = ExtensionPoint
