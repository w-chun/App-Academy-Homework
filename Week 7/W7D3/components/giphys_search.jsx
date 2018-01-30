import React from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component{
  constructor() {
    super();
    this.state = { searchTerm: 'corgi'};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let {giphys} = this.props;
    return (
      <div>
        <input value={this.state.searchTerm} onChange={ this.handleChange }></input>
        <input type="submit" onClick= {this.handleSubmit}></input>
        <GiphysIndex giphys={giphys} /> 
      </div>
    );
  }
}
