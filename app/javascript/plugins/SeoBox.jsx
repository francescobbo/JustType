import React from 'react'
import { connect } from 'react-redux'
import ExtensionPoint from '../components/ExtensionPoint'

class SeoBox extends React.Component {
  render() {
    let issues = []

    if (!this.props.article.meta_description || this.props.article.meta_description.trim() == '') {
      issues.push("No meta description specified");
    } else if (this.props.article.meta_description.trim().length < 120) {
      issues.push("The meta description is under 120 chars");
    } else if (this.props.article.meta_description.trim().length > 160) {
      issues.push("The meta description is over 160 chars and may be truncated");
    }

    if (!this.props.article.title || this.props.article.title.trim() == '') {
      issues.push("No title specified");
    } else if (this.props.article.title.trim().length < 30) {
      issues.push("The title is too short");
    } else if (this.props.article.title.trim().length > 75) {
      issues.push("The title is too long");
    }

    return (
      <ul>
        {issues.map((item, i) => { return <li key={i}>{item}</li> })}
      </ul>
    )
  }
}

let SeoBoxConnected = connect(
  (state) => {
    return { article: state.article }
  }
)(SeoBox)

ExtensionPoint.registerExtension('ArticleEditorBottom', SeoBoxConnected)
