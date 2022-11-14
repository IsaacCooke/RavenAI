import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

import UserService from './src/api/UserService';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Open up App.tsx to start working on your app!</Text>
      <StatusBar style="auto" />
      <UserService />
      <TestModule />
    </View>
  );
}

function TestModule(){
  return(
    <Text>This is a test</Text>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
