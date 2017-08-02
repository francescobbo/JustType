import React from 'react';

export default class PostEditor extends React.Component {
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
