import React from 'react';
import ReactDOM from 'react-dom';
import SimpleMDE from 'react-simplemde-editor';

import ArticleEditor from '../components/ArticleEditor';

let articleEditor = document.querySelectorAll('.react-entry[data-react="ArticleEditor"]')[0]
if (articleEditor)
  ReactDOM.render(<ArticleEditor />, articleEditor);
