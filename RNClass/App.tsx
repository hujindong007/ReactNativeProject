/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';


import {
  SafeAreaView,
  StatusBar,
  View,
  StyleSheet,
  useColorScheme,
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';

import City from './weather/City';


function App(){
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.red : Colors.yellow,
  };

  return (

    // <SafeAreaView style={backgroundStyle}>
    //   <StatusBar
    //     barStyle={isDarkMode ? 'light-content' : 'dark-content'}
    //     backgroundColor={backgroundStyle.backgroundColor}/>
       <City></City>

    // </SafeAreaView>

    // <View style={styles.container}>
    // <City />
    // </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});



export default App;
