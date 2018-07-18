import React, { Component } from 'react'
import { ListItem } from 'react-native-elements'

import { myIp } from '../Extra/MyIp'
import { fetching } from '../Extra/Fetch'

export default class User extends Component {
    
  delete = (id) => {
    alert(id)
      // fetching({}, 'DELETE' , `${myIp}/api/v1/users/${id}`,  response => {
      //   console.log(response)
      //   console.log(response.data)
      //   console.log(response.status)
      // })
  }

  getProfile = id => {

  }

  render() {
    const { id, username, created_at, picture} = this.props.user;
      return (
        <ListItem
          roundAvatar
          key={id}
          avatar = {(picture.url != null) ? `http://10.172.175.104:4000${picture.url}` : null}
          title={username}
          subtitle={'Hello World'}
          onPress={() => this.delete(id)}/>
      )
  }
}