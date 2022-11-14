import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { View, Text } from 'react-native';

const baseUrl = 'https://localhost:5001/api/users';
const headers = {
    "Content-Type": "application/json",
}

function UserService(){
    const [user, setUser] = useState(null);
    useEffect(() => {
        axios.get(baseUrl, {headers}).then((response) => {
            setUser(response.data);
            console.log(response.data);
        }).catch(function(error){
            console.log(error);
            console.log(error.response.data);
        });
    }, []);

    if(!user) return(
        <Text>There are no users</Text>
    );

    function UserList(user){
        for(var i in user){
            return(
                <Text>{user.id}</Text>
            )
        }
    }

    return(
        <View>
            <Text>{UserList(user)}</Text>
        </View>
    )
}

export default UserService;