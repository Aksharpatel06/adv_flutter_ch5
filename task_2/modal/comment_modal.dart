class CommentModal{
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentModal({this.postId,this.id,this.name,this.email,this.body});

  factory CommentModal.fromJson(Map json)
  {
    return CommentModal(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body']
    );
  }
}