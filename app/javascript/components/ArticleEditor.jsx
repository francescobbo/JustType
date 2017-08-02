import React from 'react';
import { Provider } from 'react-redux'
import thunkMiddleware from 'redux-thunk'
import { createStore, combineReducers, applyMiddleware } from 'redux'

import ArticleEditorForm from './ArticleEditorForm';

import { fetchArticle } from '../actions'

import ArticleEditorReducer from '../reducers/ArticleEditorReducer'

export default class ArticleEditor extends React.Component {
  constructor(props) {
    super(props)

    this.store = createStore(combineReducers({
      article: ArticleEditorReducer
    }), applyMiddleware(thunkMiddleware))
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
