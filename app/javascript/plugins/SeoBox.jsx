import React from 'react'
import { connect } from 'react-redux'
import ExtensionPoint from '../components/ExtensionPoint'

class SeoBox extends React.Component {
  render() {
    return <div>I am an SEO Box: {this.props.article.original_content}</div>
  }
}

let SeoBoxConnected = connect(
  (state) => {
    return { article: state.article }
  }
)(SeoBox)

ExtensionPoint.registerExtension('ArticleEditorBottom', SeoBoxConnected)
