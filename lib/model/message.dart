class Message {
  final int? id;
  final String username;
  final String message;
  final DateTime timestamp;

  Message(
      {this.id,
      required this.username,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      username: map['username'],
      message: map['message'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
