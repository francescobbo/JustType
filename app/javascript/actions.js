export const saveDraft = () => {
  return (dispatch, getState) => {
    let state = getState()
    let requestBody = {
      title: state.article.title,
      original_content: state.article.content
    }

    let endpoint = state.article.id ? `/admin/articles/${state.article.id}.json` : '/admin/articles.json'
    let method = state.article.id ? 'PATCH' : 'POST'

    return fetch(endpoint, {
      method: method,
      credentials: 'same-origin',
      headers: new Headers({
        'Content-Type': 'application/json'
      }),
      body: JSON.stringify({
        article: requestBody,
        submit_type: 'draft'
      })
    })
    .then(response => response.json())
    .then(json => dispatch(receiveArticle(json)))
  }
}

export const publish = () => {
  return (dispatch, getState) => {
    let state = getState()
    let requestBody = {
      title: state.article.title,
      original_content: state.article.content
    }

    let endpoint = state.article.id ? `/admin/articles/${state.article.id}.json` : '/admin/articles.json'
    let method = state.article.id ? 'PATCH' : 'POST'

    return fetch(endpoint, {
      method: method,
      credentials: 'same-origin',
      headers: new Headers({
        'Content-Type': 'application/json'
      }),
      body: JSON.stringify({
        article: requestBody,
        submit_type: 'publish'
      })
    })
    .then(response => response.json())
    .then(json => dispatch(receiveArticle(json)))
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

function receiveArticle(json) {
  console.log("RECEIVING");
  return {
    type: 'RECEIVE_ARTICLE',
    payload: json
  }
}

export const fetchArticle = (id) => {
  return dispatch => {
    return fetch(`/admin/articles/${id}.json`, { credentials: 'same-origin' })
      .then(response => response.json())
      .then(json => dispatch(receiveArticle(json)))
  }
}
