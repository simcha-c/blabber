import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { fetchBlab } from '../actions/blab_actions';

class BlabShow extends React.Component {
  componentDidMount() {
    this.props.fetchBlab(this.props.match.params.blabId);
  }

  componentDidUpdate(oldProps) {
    // can destructure if you want
    // const { params } = oldProps.match;
    if (oldProps.match.params.blabId !== this.props.match.params.blabId) {
      this.props.fetchBlab(this.props.match.params.blabId);
    }
  }

  render() {
    return (
      <div>
        <p>{this.props.blab.body}</p>
        <Link to="/">Return to Feed</Link>
      </div>
    );
  }

  // // lifecycle methods
  // componentDidMount(){}
  // // possibly rerenders
  // // if rerenders:
  // componentDidUpdate(oldProps){}
  // componentWillUnmount(){}
}

const mapStateToProps = (state, ownProps) => {
  const blabId = ownProps.match.params.blabId;
  const blab = state.blabs[blabId] || {};
  return {
    blab,
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchBlab: (id) => dispatch(fetchBlab(id)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(BlabShow);