import Article from './api/Article'

export const fetchArticle = (id) => {
  return dispatch => {
    return Article.fetch(id).then(json => dispatch(receiveArticle(json)))
  }
}

export const saveDraft = () => {
  return (dispatch, getState) => {
    let state = getState()

    let request
    if (state.article.id)
      request = Article.update(state.article.id, state.article, 'draft')
    else
      request = Article.create(state.article, 'draft')

    return request.then(json => dispatch(receiveArticle(json)))
  }
}

export const publish = () => {
  return (dispatch, getState) => {
    let state = getState()

    let request
    if (state.article.id)
      request = Article.update(state.article.id, state.article, 'publish')
    else
      request = Article.create(state.article, 'publish')

    return request.then(json => dispatch(receiveArticle(json)))
  }
}

function receiveArticle(json) {
  return {
    type: 'RECEIVE_ARTICLE',
    payload: json
  }
}

export const setTitle = (title) => {
  return {
    type: 'SET_TITLE',
    payload: {
      title: title
    }
  }
}

export const setContent = (content) => {
  return {
    type: 'SET_CONTENT',
    payload: {
      content: content
    }
  }
}
