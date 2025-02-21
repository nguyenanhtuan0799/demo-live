import React, {useState} from 'react';
import {SafeAreaView, Text, TouchableOpacity, View} from 'react-native';
import {LiveStreamUIKit} from '../modules/liveStreamModule/liveStreamModule';
import {SDK_APP_ID, user} from '../constant/constant';
import {useNavigation} from '@react-navigation/core';

type Props = {};

const HomeScreen = ({}: Props) => {
  const [userSelected, setUserSelected] = useState<'user1' | 'user2'>('user1');
  const {navigate} = useNavigation<any>();
  return (
    <SafeAreaView
      style={{
        flex: 1,
      }}>
      <View
        style={{
          flex: 1,
          justifyContent: 'center',
          alignItems: 'center',
          gap: 16,
        }}>
        <View
          style={{
            flexDirection: 'row',
            gap: 16,
          }}>
          <TouchableOpacity
            style={{
              padding: 16,
              backgroundColor: 'blue',
              borderRadius: 8,
            }}
            onPress={() => {
              setUserSelected('user1');
            }}>
            <Text
              style={{
                color: 'white',
                fontWeight: 'bold',
              }}>
              User1
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={{
              padding: 16,
              backgroundColor: 'blue',
              borderRadius: 8,
            }}
            onPress={() => {
              setUserSelected('user2');
            }}>
            <Text
              style={{
                color: 'white',
                fontWeight: 'bold',
              }}>
              User2
            </Text>
          </TouchableOpacity>
        </View>
        <Text
          style={{
            fontWeight: 'bold',
          }}>
          User Selected:{' '}
          <Text
            style={{
              color: 'red',
              fontSize: 20,
            }}>
            {user[userSelected]?.userId}
          </Text>
        </Text>
        <TouchableOpacity
          style={{
            padding: 16,
            backgroundColor: 'yellow',
            borderRadius: 8,
          }}
          onPress={() => {
            LiveStreamUIKit.initService(
              SDK_APP_ID,
              user[userSelected]?.userId,
              user[userSelected]?.userSig,
            );
          }}>
          <Text
            style={{
              fontWeight: 'bold',
            }}>
            Init service
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={{
            padding: 16,
            backgroundColor: 'yellow',
            borderRadius: 8,
          }}
          onPress={() => {
            LiveStreamUIKit.startLive('1');
          }}>
          <Text
            style={{
              fontWeight: 'bold',
            }}>
            Start Live Room ID 1
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={{
            padding: 16,
            backgroundColor: 'yellow',
            borderRadius: 8,
          }}
          onPress={() => {
            LiveStreamUIKit.joinLive('1');
          }}>
          <Text
            style={{
              fontWeight: 'bold',
            }}>
            Join Live Room ID 1
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={{
            padding: 16,
            backgroundColor: 'yellow',
            borderRadius: 8,
          }}
          onPress={() => {
            navigate('LiveStreamCustomize', {
              userId: user[userSelected]?.userId,
            });
          }}>
          <Text
            style={{
              fontWeight: 'bold',
            }}>
            Join Live with UI Customize Room ID 1
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

export default HomeScreen;
