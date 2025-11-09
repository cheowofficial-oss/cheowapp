class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String? body;
  final String type;
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    this.body,
    this.type = "text",
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json['id'] as String,
        chatId: json['chat_id'] as String,
        senderId: json['sender_id'] as String,
        body: json['body'] as String?,
        type: json['type'] as String? ?? 'text',
        createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chat_id': chatId,
        'sender_id': senderId,
        'body': body,
        'type': type,
        'created_at': createdAt.toIso8601String(),
      };
}
