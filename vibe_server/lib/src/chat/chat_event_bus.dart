import 'dart:async';

import '../generated/protocol.dart';

/// In-process pub/sub for real-time chat updates (new/edited/deleted
/// messages, reactions, delivery/read receipts, typing). The server runs
/// as a single Render instance, so a broadcast stream is sufficient —
/// there's no need for a cross-instance message bus like Redis.
class ChatEventBus {
  ChatEventBus._();
  static final instance = ChatEventBus._();

  final _messages = StreamController<ChatMessageView>.broadcast();
  final _typing = StreamController<TypingStatus>.broadcast();

  Stream<ChatMessageView> get messageUpdates => _messages.stream;
  Stream<TypingStatus> get typingUpdates => _typing.stream;

  void publishMessage(final ChatMessageView view) => _messages.add(view);
  void publishTyping(final TypingStatus status) => _typing.add(status);
}
