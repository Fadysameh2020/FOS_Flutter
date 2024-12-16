import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants.dart';
import 'api_constants.dart';
import 'dio_helper.dart';

class SocketService {
  late IO.Socket socket;

  void connect() async {
    IO.OptionBuilder options =
        IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
      {'Authorization': await getToken()},
    );
    socket = IO.io(
      ApiConstants.baseUrl,
      options.build(),
    );

    socket.onConnect((_) {
      if (kDebugMode) {
        print('connected to socket');
      }
      // newUserEmit();
    });
    socket.onDisconnect((_) {
      if (kDebugMode) {
        print('Socket Disconnected');
      }
    });
    socket.onError((error) {
      if (kDebugMode) {
        print('Socket Error: $error');
      }
    });
    socket.on('user-connected', (data) {
      print(data);
      print('on user connected');
    });
    socket.on('user-disconnected', (_) {
      print('Disconnected');
    });
  }

  void disconnect() async {
    socket.emit('disconnect');

    socket.disconnect();
    socket.dispose();

    if (kDebugMode) {
      print('user disconnected manually');
    }
  }

  bool isChatRoomOpened = false;
  String? currentChatId;

  void joinChat({required chatId}) {
    socket.emit(
      'join-chat',
      {
        "chatId": chatId,
      },
    );
    isChatRoomOpened = true;
    currentChatId = chatId;
    if (kDebugMode) {
      print('joined chat with $chatId');
    }
  }

  void leaveChat({required chatId}) {
    socket.emit(
      'leave-chat',
      {
        "chatId": chatId,
      },
    );
    isChatRoomOpened = false;
    currentChatId = null;
    if (kDebugMode) {
      print('left chat with $chatId');
    }
  }

  void sendMessage({
    chatId,
    partnerId,
    required message,
    required messageType,
    int? seconds,
    required Function(String tempId, Map<String, dynamic> response)
        onMessageSent,
  }) {
    socket.emit(
      'new-message',
      {
        if (chatId != null) 'chatId': chatId,
        if (chatId == null) 'otherUserId': partnerId,
        'content': message,
        'type': messageType,
      },
    );
    if (kDebugMode) {
      print('message -> $message sent to ${chatId ?? ""}${partnerId ?? ''}');
    }
  }

  void emitDeliveredMessages({required messageId}) {
    socket.emit(
      'message-delivered',
      {
        "messageId": messageId,
      },
    );

    if (kDebugMode) {
      print('delivered messaged emitted');
    }
  }

  void activateTyping({required chatId}) {
    socket.emit(
      'typing',
      {
        "chatId": chatId,
      },
    );

    if (kDebugMode) {
      print('I started typing with $chatId');
    }
  }

  void deactivateTyping({required chatId}) {
    socket.emit(
      'stop-typing',
      {
        "chatId": chatId,
      },
    );

    if (kDebugMode) {
      print('I stopped typing with $chatId');
    }
  }
}
