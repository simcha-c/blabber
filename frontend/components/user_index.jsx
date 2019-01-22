import React, { Component } from "react";
import { connect } from 'react-redux';
import { fetchUsers } from '../actions/user_actions';
import UserShow from './user_show';

class UserIndex extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedBlabber: null,
    }
  };

  componentDidMount() {
    this.props.fetchUsers();
  }

  selectBlabber(id) {
    return () => {
      this.setState({ selectedBlabber: id })
    }
  }

  render() {
    const users = this.props.users.map(user => {
      return (
        <li key={user.id} className="user-index-item" onClick={this.selectBlabber(user.id)}>
          <p>{user.username}</p>
        </li>
      );
    });

    const { selectedBlabber } = this.state;
    return (
      <main className="user-index">
        <div>
          <h3>Meet the blabbers!</h3>
          <ul className="user-list">
            {users}
          </ul>
        </div>
        {selectedBlabber ? 
          <UserShow 
            blabberId={selectedBlabber} 
            closeShow={() => this.setState({ selectedBlabber: null })}
          /> : null }
      </main>

    );
  }
}

const mapStateToProps = state => {
  const users = Object.values(state.users);
  return {
    users
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUsers: () => dispatch(fetchUsers())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserIndex);