import React from 'react';
import ReactDOM from 'react-dom';

class PostEditor extends React.Component {
  render() {
    return (
      <form>
        <input type="text" name="title" placeholder="Title" />
        <textarea name="original_content"></textarea>
        <button type="submit" name="submit_type" value="draft">Save Draft</button>
        <button type="submit" name="submit_type" value="publish">Publish</button>
      </form>
    )
  }
}

let postEditor = document.querySelectorAll('.react-entry[data-react="PostEditor"]')[0]
if (postEditor)
  ReactDOM.render(<PostEditor />, postEditor);
