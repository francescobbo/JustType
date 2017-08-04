import React from 'react'
import ReactDOM from 'react-dom'
import ArticleEditor from '../components/ArticleEditor'
import SeoBox from '../plugins/SeoBox'

let articleEditor = document.querySelectorAll('.react-entry[data-react="ArticleEditor"]')[0]
if (articleEditor) {
  let params = articleEditor.dataset.params != undefined ? JSON.parse(articleEditor.dataset.params) : {}
  ReactDOM.render(<ArticleEditor {...params} />, articleEditor)
}
