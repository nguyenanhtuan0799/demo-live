import React, {forwardRef, useImperativeHandle, useRef} from 'react';
import {
  findNodeHandle,
  NativeModules,
  Platform,
  requireNativeComponent,
  UIManager,
} from 'react-native';

const {LiveStreamModule} = NativeModules;
const LiveStreamNativeView = requireNativeComponent('LiveStreamView');
const InputMessageView = requireNativeComponent('InputMessageView');
const MessageView = requireNativeComponent('MessageView');
const DisplayGiftView = requireNativeComponent('DisplayGiftView');
const GiftView = requireNativeComponent('GiftView');
const ItemGift = requireNativeComponent('ItemGift');

type LiveStreamUIKitType = {
  print: (name: string) => void;
  initService: (appId: number, userId: string, userSig: string) => void;
  startLive: (roomId: string) => void;
  joinLive: (roomId: string) => void;
};

const LiveStreamUIKit: LiveStreamUIKitType = {
  print: name => {
    if (Platform.OS === 'ios') {
      LiveStreamModule.sayHello(name);
    } else {
      console.warn('Android: Soon');
    }
  },
  initService: (appId, userId, userSig) => {
    if (Platform.OS === 'ios') {
      LiveStreamModule.loginService(appId, userId, userSig);
    } else {
      console.warn('Android: Soon');
    }
  },
  startLive: roomId => {
    if (Platform.OS === 'ios') {
      LiveStreamModule.startLive(roomId);
    } else {
      console.warn('Android: Soon');
    }
  },
  joinLive: roomId => {
    if (Platform.OS === 'ios') {
      LiveStreamModule.joinLive(roomId);
    } else {
      console.warn('Android: Soon');
    }
  },
};

const RNLiveStreamView = forwardRef((props, ref) => {
  const nativeRef = useRef(null);

  useImperativeHandle(ref, () => ({
    leaveLiveStream: () => {
      const reactTag = findNodeHandle(nativeRef.current);
      if (reactTag) {
        UIManager.dispatchViewManagerCommand(
          reactTag,
          UIManager.getViewManagerConfig('LiveStreamView')?.Commands?.leaveRoom,
          [],
        );
      }
    },
  }));
  return <LiveStreamNativeView ref={nativeRef} style={{flex: 1}} {...props} />;
});

export {
  LiveStreamUIKit,
  RNLiveStreamView,
  InputMessageView,
  MessageView,
  DisplayGiftView,
  GiftView,
  ItemGift,
};
