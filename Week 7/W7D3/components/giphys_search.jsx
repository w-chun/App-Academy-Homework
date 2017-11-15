import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component{
  constructor() {
    super();
    this.state = { searchTerm: 'corgi'};
  }

  handleChange(event) {
    this.setState({ searchTerm: event.currentTarget.value });
  }

  handleSubmit() {

  }

  render() {
    return (
      <div>
        <input onChange={ this.handleChange }></input>
        <input type="submit" onClick= {this.handleSubmit }>

        </input>
      </div>
    );
  }
}
