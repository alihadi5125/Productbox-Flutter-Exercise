import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/controller/web_socket_controller.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

part 'web_socket_chat_state.dart';

class WebSocketChatCubit extends Cubit<WebSocketChatState> {
  WebSocketChatCubit() : super(WebSocketChatInitial());
  var channel = IOWebSocketChannel.connect(Uri.parse(
      "wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self"));

  Future<void> enableStream() async {

    print("WidgetsBinding");
    Future.delayed(Duration.zero, () {
      channel.stream.listen((message) async {
        print('emit state');
        emit(WebSocketChatLoading());
        await Future.delayed(const Duration(seconds: 2), () {
          WebSocket.messages.add(MessageData(
            //on message recieve, add data to model
            message: message.toString(),
            userid: "Server",
            isMe: false,
          ));
          emit(WebSocketChatLoaded());
          // setState(() {});
        });
      }) ;
    });
  }

  Future<void> sendMessage({required String customMessage}) async {
    WebSocket.messages.add(MessageData(
      message: customMessage.toString(),
      userid: "Me",
      isMe: true,
    ));

    /// uncomment for sending message to socket server
    //WebSocket.channel.sink.add(customMessage);
  }

  void dispose() {
    print('cubit dispose');
    channel.stream.asBroadcastStream();
    channel.sink.close();


  }
}

class StreamController {
  var channel = IOWebSocketChannel.connect(Uri.parse(
      "wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self"));

  var webSocketStream;

  Future<void> activteStream() async {
    webSocketStream = channel.stream.asBroadcastStream();
  }
}
