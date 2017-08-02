import React from 'react'
import { connect } from 'react-redux'
import SimpleMDE from 'react-simplemde-editor'

import { setTitle, setContent, saveDraft, publish } from '../actions'

class ArticleEditorForm extends React.Component {
  render() {
    return (
      <div>
        <input value={this.props.article.title} type="text" placeholder="Title" onChange={this.props.updateTitle} />
        <SimpleMDE value={this.props.article.content} onChange={this.props.updateContent} />
        <button onClick={this.props.onSaveDraft}>Save Draft</button>
        <button onClick={this.props.onPublish}>Publish</button>
      </div>
    )
  }
}

export default connect(
  (state) => {
    return { article: state.article }
  },
  (dispatch) => {
    return {
      updateTitle: (e) => {
        dispatch(setTitle(e.target.value))
      },
      updateContent: (value) => {
        dispatch(setContent(value))
      },
      onSaveDraft: () => {
        dispatch(saveDraft())
      },
      onPublish: () => {
        dispatch(publish())
      }
    }
  }
)(ArticleEditorForm)
