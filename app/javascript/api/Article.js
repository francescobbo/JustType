import Api from './Api'

export default class Article {
  static fetch(id) {
    return Api.request('GET', `/admin/articles/${id}.json`)
  }

  static create(params, submit_type) {
    return Api.request('POST', '/admin/articles.json', {
      article: params,
      submit_type: submit_type
    })
  }

  static update(id, params, submit_type) {
    return Api.request('PATCH', `/admin/articles/${id}.json`, {
      article: params,
      submit_type: submit_type
    })
  }
}
