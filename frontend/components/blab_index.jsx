import React, { Component } from 'react';
import { connect } from 'react-redux';
import BlabForm from './blab_form';
import { fetchBlabs } from '../actions/blab_actions';
import { Link } from 'react-router-dom';

// no constructor function, inherits the constructor function from React.Component
class BlabsIndex extends Component {
  componentDidMount() {
    this.props.fetchBlabs();
  }

  render() {
    const { blabs } = this.props;
    // const blabs = this.props.blabs - same as line 9
    const blabLis = blabs.map(blab => {
      const { id, body } = blab;
      // const id = blab.id
      // const body = blab.body
      return <li key={id}><Link to={`/blabs/${id}`}>{body}</Link></li> ;
    });
    
    return (
      <main className="blab-index">
        <h3>Blabber</h3>
        
        <ul className="blab-list">
          {blabLis}
        </ul>
        <BlabForm/>
      </main>
    );
  }
}

// Beginning of the "container file"
const mapStateToProps = (state) => {

  const blabs = Object.values(state.blabs); 
  // returns an array, but props looks for objects, so we put the array into an object
  // we still want the array however so that we can iterate over the array inside the render function
  return { blabs };
};
// MSP(mapStateToProps) takes in redux state from redux store, then we extract the values from the blabs slice of state
// and then we return an object with those blabs to the props of the blabs Index

const mapDispatchToProps = (dispatch) => {
  return {
    fetchBlabs: () => {

      return dispatch(fetchBlabs())
    }
  }
};

export default connect(mapStateToProps, mapDispatchToProps)(BlabsIndex);

// export default connect(mapStateToProps, null)(BlabsIndex); - same as above


// Selector - takes state and returns formatted information back that can be reused in many different files
// Props are information that we have inside of our React component that comes from the outside