import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createBlab } from '../actions/blab_actions';

class BlabForm extends Component {
  constructor(props) {
    super(props);
    this.defaultState = { body: '' };
    this.state = this.defaultState;
    // this is React state, internal to component
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  
  handleSubmit(e) {
    e.preventDefault();
    this.props.createBlab(this.state).then(()=>{
    });
    this.setState(this.defaultState);
  }

  handleChange(field) {

    return (e) => {
      this.setState({ [field]: e.target.value });
    };
  }

  render() {
    return (
      <form className="blab-form" onSubmit={this.handleSubmit}>
        <label>Blab Away!</label>
        <label>Body:
          <input onChange={this.handleChange('body')}
            id="body"
            type="text"
            value={this.state.body} />
        </label>
        <button>Create Blab!</button>
      </form>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  // const createBlab = (blab) => {
  //   blab.id = Math.floor(Math.random() * 1000);
  //   dispatch(receiveBlab(blab));
  // }
  return {
    createBlab: (blab) => dispatch(createBlab(blab))
  };
};

export default connect(null, mapDispatchToProps)(BlabForm);
// need to put null here because MDP has to be the second argument