import React from 'react';
import { connect } from 'react-redux';
import { fetchUser } from '../actions/user_actions';

class UserShow extends React.Component {
  // This method is only hit once
  componentDidMount() {
    const { blabberId, fetchBlabber } = this.props;
    fetchBlabber(blabberId);
  }

  // This method is called whenever a component updates (usually: change in props, change in state, parent re-render)
  // DOES NOT happen after the very first render
  componentDidUpdate(prevProps) {
    
    // const { blabberId, fetchBlabber } = this.props;
    const blabberId = this.props.blabberId;
    const fetchBlabber = this.props.fetchBlabber;

    if (blabberId != prevProps.blabberId) {
      fetchBlabber(blabberId);
    }
  }

  render() {
    const { blabber = {}, closeShow, blabCount, location } = this.props;

    return (
      <aside>
      <h3>{blabber.username}</h3>
      <h5>{location.name}</h5>
      <p><strong>Blab count:</strong>{blabCount}</p>
      <button onClick={closeShow}>Close</button>
      </aside>
    );
  }
}

const msp = (state, ownProps) => {
  const blabber = state.users[ownProps.blabberId];
  const blabCount = Object.values(state.blabs).filter(blab => blab.author_id == ownProps.blabberId).length
  const location = state.locations[blabber.location_id] || {};

  return {
    blabber,
    blabCount,
    location
  };
};

const mdp = dispatch => {
  return {
    fetchBlabber: id => dispatch(fetchUser(id)),
  };
};

export default connect(msp, mdp)(UserShow);
