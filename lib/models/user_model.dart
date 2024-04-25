class UserModel {
  int? id;
  String? email;
  String? fristName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.fristName, this.lastName, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    avatar = json['avatar'];
  }
}
