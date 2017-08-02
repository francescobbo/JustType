import React from 'react';
import { Provider } from 'react-redux'
import thunkMiddleware from 'redux-thunk'
import { createStore, applyMiddleware } from 'redux'

import ArticleEditorForm from './ArticleEditorForm';

import { fetchArticle } from '../actions'

export default class ArticleEditor extends React.Component {
  constructor(props) {
    super(props)

    this.store = createStore((state = { article: { title: '', content: '' } }, action) => {
      switch (action.type) {
        case 'SET_TITLE':
          return {
            ...state,
            article: {
              ...state.article,
              title: action.payload.title
            }
          }
          break
        case 'SET_CONTENT':
          return {
            ...state,
            article: {
              ...state.article,
              content: action.payload.content
            }
          }
          break
        case 'RECEIVE_ARTICLE':
          return {
            ...state,
            article: {
              id: action.payload.id,
              title: action.payload.title,
              content: action.payload.original_content
            }
          }
        default:
          return state
      }
    }, applyMiddleware(thunkMiddleware))
  }

  componentDidMount() {
    if (this.props.id) {
      this.store.dispatch(fetchArticle(this.props.id))
    }
  }

  render() {
    return (
      <Provider store={this.store}>
        <ArticleEditorForm />
      </Provider>
    )
  }
}
