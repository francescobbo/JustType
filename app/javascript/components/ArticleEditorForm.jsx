import React from 'react'
import { connect } from 'react-redux'
import SimpleMDE from 'react-simplemde-editor'
import ExtensionPoint from './ExtensionPoint'

import { setTitle, setContent, setMetaDescription, saveDraft, publish } from '../actions'

class ArticleEditorForm extends React.Component {
  constructor() {
    super()
    this.state = { titlePlaceholder: this.randomPlaceholder() }
  }

  render() {
    return (
      <div>
        <label htmlFor="title">Title</label>
        <input className="article-editor--title"
               value={this.props.article.title}
               name="title"
               type="text"
               placeholder={this.state.titlePlaceholder}
               onChange={this.props.updateTitle} />
         <label htmlFor="metaDescription">Meta description</label>
         <textarea name="metaDescription"
                   type="text"
                   placeholder="Search Engines use it as preview in result pages. Best ones are under 160 characters and use Call to Actions. Search Engines will generate the preview if blank."
                   onChange={this.props.updateMetaDescription}>{this.props.article.meta_description}</textarea>
        <SimpleMDE value={this.props.article.original_content} onChange={this.props.updateContent} />
        <button onClick={this.props.onSaveDraft}>Save Draft</button>
        <button onClick={this.props.onPublish}>Publish</button>
        <ExtensionPoint name="ArticleEditorBottom" />
      </div>
    )
  }

  randomPlaceholder() {
    let templates = [
      '{n} Things the media hasn\'t told you about {subject}',
      '{n} Things lady gaga has in common with {subject}',
      'The most {attribute} article about {subject} you\'ll ever read',
      '{n} {attribute} uses of {subject}',
      'Why you should forget everything you learned about {subject}',
      'Why you should give up sex and devote your life to {subject}',
      'The connection between {subject} and sex',
      '{n} reasons {subject} is the end of the world as we know it',
      'Guns don\'t kill people -- {subject} kill people',
      '{n} {attribute} reasons {subject} will change the way you think about everything',
      'Why {subject} sucks',
      '{n} ways {subject} can help you live to 100',
      '{n} {attribute} facts about {subject}',
      'What the government doesn\'t want you to know about {subject}',
      'The rise of {subject} and how to make it stop',
      '{n} ways investing in {subject} can make you a millionaire',
      '{n} ways {subject} can suck the life out of you',
      '{n} reasons you can blame the recession on {subject}',
      '{n} {attribute} uses for {subject}',
      '{n} ways marketers are making you addicted to {subject}',
      'Why {subject} is destroying america',
      '{n} {attribute} things you never knew about {subject}',
      '{n} reasons to be addicted to {subject}',
      '{subject} die every minute you don\'t read this article',
    ]

    let subjects = ['Pizza', 'Guinea Pig', 'Cucumbers', 'Stars', 'iPhones', 'Trump']
    let attributes = ['Incredible', 'Absurd', 'Unbelievable', 'Fantastic']

    let template = templates[Math.floor(Math.random() * templates.length)]
    let subject = subjects[Math.floor(Math.random() * subjects.length)]
    let attribute = attributes[Math.floor(Math.random() * attributes.length)]
    return template.replace('{n}', Math.floor(Math.random() * 50) + 5)
                   .replace('{attribute}', attribute)
                   .replace('{subject}', subject)
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
      updateMetaDescription: (e) => {
        dispatch(setMetaDescription(e.target.value))
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
