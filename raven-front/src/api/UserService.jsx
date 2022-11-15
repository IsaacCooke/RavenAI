import React, { useState, useEffect, setState } from 'react';
import axios from 'axios';
import { View, Text } from 'react-native';

const baseUrl = 'https://50fa-80-195-185-6.eu.ngrok.io/api/users/636f8e2b22155b5827204688';
const headers = {
    "Content-Type": "application/json",
}

function UserService(){
    const [user, setUser] = useState(null);

    useEffect(() => {
        axios.get(baseUrl).then((response) => {
            setUser(response.data);
        });
    }, []);

    if(!user) return <Text>No users</Text>

    return(
        <View>
            <Text>{user.id}</Text>
        </View>
    )
}

export default UserService;