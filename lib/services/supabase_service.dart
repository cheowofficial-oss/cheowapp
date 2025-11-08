import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // Используем клиент, инициализируется в main.dart через Supabase.initialize(...)
  static SupabaseClient get client => Supabase.instance.client;

  // Auth: отправить OTP на email (Supabase email OTP)
  Future<dynamic> signInWithEmail(String email) async {
    final res = await client.auth.signInWithOtp(email: email);
    return res;
  }

  // Получить текущего пользователя
  User? currentUser() {
    return client.auth.currentUser;
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  // Создать чат
  Future<PostgrestResponse> createChat(String title, String type, String ownerId) {
    return client.from('chats').insert({
      'title': title,
      'type': type,
      'owner_id': ownerId,
    }).execute();
  }

  // Отправить текстовое сообщение
  Future<PostgrestResponse> sendMessage(String chatId, String senderId, String body) {
    return client.from('messages').insert({
      'chat_id': chatId,
      'sender_id': senderId,
      'body': body,
      'type': 'text'
    }).execute();
  }

  // Подписаться на новые сообщения в чате (realtime)
  RealtimeSubscription subscribeMessages(String chatId, void Function(Map<String,dynamic>) onMsg) {
    final sub = client
      .from('messages:chat_id=eq.$chatId')
      .on(SupabaseEventTypes.insert, (payload) {
        final newRow = payload['new'] as Map<String,dynamic>;
        onMsg(newRow);
      }).subscribe();
    return sub;
  }

  // Отписка от подписки
  Future<void> unsubscribe(RealtimeSubscription sub) async {
    await client.removeSubscription(sub);
  }
}
