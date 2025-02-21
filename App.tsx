/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import HomeScreen from './src/container/HomeScreen';
import LiveStreamCustomize from './src/container/LiveStreamCustomize';
function App(): React.JSX.Element {
  const Stack = createNativeStackNavigator();

  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="HomeScreen" component={HomeScreen} />
        <Stack.Screen
          options={{
            headerShown: false,
          }}
          name="LiveStreamCustomize"
          component={LiveStreamCustomize}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
