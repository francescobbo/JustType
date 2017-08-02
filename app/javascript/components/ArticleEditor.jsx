import React from 'react';

export default class ArticleEditor extends React.Component {
  render() {
    return (
      <form>
        <input type="text" name="title" placeholder="Title" />
        <SimpleMDE />
        <button type="submit" name="submit_type" value="draft">Save Draft</button>
        <button type="submit" name="submit_type" value="publish">Publish</button>
      </form>
    )
  }
}
