import React, {useEffect, useRef, useState} from 'react';
import {
  Dimensions,
  findNodeHandle,
  Image,
  Modal,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import {
  DisplayGiftView,
  GiftView,
  InputMessageView,
  ItemGift,
  MessageView,
  RNLiveStreamView,
} from '../modules/liveStreamModule/liveStreamModule';
import {useNavigation, useRoute} from '@react-navigation/core';
import Feather from 'react-native-vector-icons/Feather';
type Props = {};

const LiveStreamCustomize = ({}: Props) => {
  const liveStreamRef = useRef(null);
  const [modalVisible, setModalVisible] = useState(false);
  const {goBack} = useNavigation();
  const route = useRoute();
  console.log(route);
  // useEffect(()=>)

  const handleGoBack = () => {
    goBack();
    liveStreamRef.current?.leaveLiveStream();
  };

  return (
    <>
      <View style={{flex: 1}}>
        <View
          style={{
            paddingTop: 60,
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            backgroundColor: 'rgba(255, 255, 255,0.4)',
            zIndex: 99,
            flexDirection: 'row',
            justifyContent: 'space-between',
            paddingHorizontal: 16,
            paddingBottom: 12,
            opacity: 0.5,
          }}>
          <View
            style={{
              flexDirection: 'row',
              alignItems: 'center',
            }}>
            <Image
              src="https://create.microsoft.com/_next/image?url=https%3A%2F%2Fcdn.create.microsoft.com%2Fimages%2Fimage-creator-T03_cat.webp&w=1920&q=90"
              style={{
                width: 48,
                height: 48,
                borderRadius: 99,
              }}
            />
            <Text
              style={{
                fontWeight: 'bold',
                fontSize: 18,
                marginLeft: 12,
              }}>
              Yoshino
            </Text>
          </View>
          <TouchableOpacity onPress={handleGoBack}>
            <View
              style={{
                padding: 8,
                backgroundColor: 'rgba(0,0,0,0.4)',
                borderRadius: 99,
              }}>
              <Feather name="x" size={24} />
            </View>
          </TouchableOpacity>
        </View>
        <RNLiveStreamView
          ref={liveStreamRef}
          style={{
            width: Dimensions.get('window').width,
            height: Dimensions.get('window').height,
          }}
          roomId="1"
        />
        <View
          style={{
            position: 'absolute',
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            zIndex: 12,
            justifyContent: 'center',
            alignItems: 'center',
          }}>
          <DisplayGiftView
            style={{
              width: Dimensions.get('window').width,
              height: Dimensions.get('window').height,
            }}
          />
        </View>
        <View
          style={{
            position: 'absolute',
            bottom: 0,
            left: 0,
            right: 0,
            zIndex: 99,
            paddingHorizontal: 16,
            paddingBottom: 60,
            gap: 16,
            padding: 16,
          }}>
          <MessageView
            style={{
              width: Dimensions.get('window').width * 0.7,
              height: Dimensions.get('window').height * 0.3,
            }}
            userId={route?.params?.userId}
          />

          <View
            style={{
              justifyContent: 'space-between',
              flexDirection: 'row',
              alignItems: 'center',
            }}>
            <InputMessageView
              style={{
                width: Dimensions.get('window').width * 0.7,
                height: 48,
              }}
            />
            <TouchableOpacity
              onPress={() => {
                setModalVisible(true);
              }}>
              <View
                style={{
                  padding: 8,
                  backgroundColor: 'rgba(0,0,0,0.4)',
                  borderRadius: 99,
                }}>
                <Feather name="gift" size={28} color={'white'} />
              </View>
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setModalVisible(true);
              }}>
              <View
                style={{
                  padding: 8,
                  backgroundColor: 'rgba(0,0,0,0.4)',
                  borderRadius: 99,
                }}>
                <Feather name="share-2" size={28} color={'white'} />
              </View>
            </TouchableOpacity>
          </View>
        </View>
      </View>
      <Modal
        animationType="slide"
        transparent={true}
        visible={modalVisible}
        onRequestClose={() => {
          setModalVisible(!modalVisible);
        }}>
        <View style={styles.centeredView}>
          <View style={styles.modalView}>
            <View
              style={{
                flexDirection: 'row',
                justifyContent: 'space-between',
                width: Dimensions.get('window').width,
                padding: 16,
                alignItems: 'center',
              }}>
              <View
                style={{
                  padding: 4,
                }}
              />
              <Text
                style={{
                  fontWeight: 'bold',
                  fontSize: 18,
                }}>
                Quà Tặng
              </Text>
              <TouchableOpacity
                style={{
                  padding: 4,
                }}
                onPress={() => {
                  setModalVisible(false);
                }}>
                <Feather name="x" size={24} />
              </TouchableOpacity>
            </View>
            <GiftView
              style={{
                width: Dimensions.get('window').width,
                height: Dimensions.get('window').height * 0.32,
              }}
            />
          </View>
        </View>
      </Modal>
    </>
  );
};
const styles = StyleSheet.create({
  centeredView: {
    flex: 1,
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
  modalView: {
    backgroundColor: 'rgba(255, 255, 255,0.7)',
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
    overflow: 'hidden',
  },
});

export default LiveStreamCustomize;
