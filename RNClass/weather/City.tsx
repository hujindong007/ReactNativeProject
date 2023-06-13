/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  Text,
  StyleSheet,
  ImageBackground,
  StatusBar,
  View,
} from 'react-native';



// function City(): JSX.Element {
  const City = () => {
   console.log("走了没");
  // const { container, imageLayout, cityName, countryName, titles } = styles;

  return (

    <SafeAreaView style={styles.container}>
      <ImageBackground
        // source={require('../../../assets/cloudbackground.jpg')}
        source={require('../assets/cloudbackground.jpg')}
        style={styles.imageLayout}>
        <Text style={[styles.cityName, styles.titles]}>Lima</Text>
        <Text style={[styles.countryName, styles.titles]}>Peru</Text>
        <View>
          <Text style={styles.titles}>Population</Text>
          <Text style={styles.titles}>
            Sunrise time: {} | Sunset: {}
          </Text>
        </View>
      </ImageBackground>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    // backgroundColor:'red',
    flex: 1,
    marginTop: StatusBar.currentHeight || 0,
  },
  imageLayout: {
    flex: 1,
  },
  titles: {
    justifyContent: 'center',
    alignSelf: 'center',
  },
  cityName: {
    fontSize: 40,
    fontWeight: 'bold',
  },
  countryName: {
    fontSize: 20,
  },
  
});



export default City;
