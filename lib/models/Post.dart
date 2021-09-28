class Post {
    String body;
    int id;
    String title;
    int userId;

    Post({required this.body, required this.id, required this.title, required this.userId});

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            body: json['body'],
            id: json['id'],
            title: json['title'],
            userId: json['userId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body'] = this.body;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }

  // static fromJson(Map<String, dynamic> json) {
  //     return Post(
  //         body: json['body'],
  //         id: json['id'],
  //         title: json['title'],
  //         userId: json['userId'],
  //     );
  // }
}