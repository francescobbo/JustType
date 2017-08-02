import React from 'react';
import SimpleMDE from 'react-simplemde-editor';

export default class ArticleEditor extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      title: '',
      content: ''
    }

    if (this.props.id) {
      fetch('/admin/articles/' + this.props.id, {
        credentials: 'same-origin',
        headers: new Headers({
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        })
      }).then(response => response.json()).then((response) => {
        this.titleInput.value = response.title
        this.contentInput.value = response.original_content

        this.setState(content: response.original_content)
      })
    }
  }

  changeTitle = (event) => {
    this.setState({ title: event.target.value })
  }

  changeContent = (value) => {
    this.setState({ content: value })
  }

  saveDraft = () => {
    fetch('/admin/articles', {
      method: 'POST',
      credentials: 'same-origin',
      headers: new Headers({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }),
      body: JSON.stringify({
        article: this.requestBody(),
        submit_type: 'draft'
      })
    })
  }

  publish = () => {
    fetch('/admin/articles', {
      method: 'POST',
      credentials: 'same-origin',
      headers: new Headers({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }),
      body: JSON.stringify({
        article: this.requestBody(),
        submit_type: 'publish'
      })
    })
  }

  requestBody() {
    return {
      title: this.state.title,
      original_content: this.state.content
    }
  }

  render() {
    return (
      <div>
        <input ref={(input) => { this.titleInput = input }} type="text" placeholder="Title" onChange={this.changeTitle} />
        <SimpleMDE ref={(input) => { this.contentInput = input }} onChange={this.changeContent} />
        <button onClick={this.saveDraft}>Save Draft</button>
        <button onClick={this.publish}>Publish</button>
      </div>
    )
  }
}
