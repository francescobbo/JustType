export default (state = { title: '', meta_description: '', original_content: '' }, action) => {
  switch (action.type) {
  case 'SET_TITLE':
    return {
      ...state,
      title: action.payload.title
    }
  case 'SET_CONTENT':
    return {
      ...state,
      original_content: action.payload.content
    }
  case 'SET_META_DESCRIPTION':
    return {
      ...state,
      meta_description: action.payload.meta_description
    }
  case 'RECEIVE_ARTICLE':
    return action.payload
  default:
    return state
  }
}
