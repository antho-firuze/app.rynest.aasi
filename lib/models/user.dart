class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.fullName,
    this.userRole,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? fullName;
  String? userRole;

  User.initial()
      : id = 0,
        name = '',
        username = '',
        email = '',
        fullName = '',
        userRole = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    fullName = json['fullname'];
    userRole = json['userrole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['fullname'] = fullName;
    data['userrole'] = userRole;
    return data;
  }
}
