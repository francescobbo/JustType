export default class Api {
  static request(method, endpoint, data) {
    let body = data ? JSON.stringify(data) : undefined
    let headers = data ? new Headers({ 'Content-Type': 'application/json' }) : undefined

    return fetch(endpoint, {
      method: method,
      credentials: 'same-origin',
      headers: headers,
      body: body
    }).then(response => response.json())
  }
}
