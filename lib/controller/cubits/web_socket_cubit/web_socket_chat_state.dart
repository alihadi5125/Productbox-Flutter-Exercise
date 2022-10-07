part of 'web_socket_chat_cubit.dart';

@immutable
abstract class WebSocketChatState {}

class WebSocketChatInitial extends WebSocketChatState {}

class WebSocketChatLoading extends WebSocketChatState {}

class WebSocketChatLoaded extends WebSocketChatState {}
