import React from 'react';
import ReactDOM from 'react-dom';
import SimpleMDE from 'react-simplemde-editor';

import PostEditor from '../components/PostEditor';

let postEditor = document.querySelectorAll('.react-entry[data-react="PostEditor"]')[0]
if (postEditor)
  ReactDOM.render(<PostEditor />, postEditor);
