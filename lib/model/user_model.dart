class UserModel {
  late int _id = 0;
  late String _name = "";
  late String _mail = "";
  late String _pass = "";

  UserModel(
      {int id = 0, String name = "", String mail = "", String pass = ""}) {
    this._id = id;
    this._name = name;
    this._mail = mail;
    this._pass = pass;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get mail => _mail;
  set mail(String mail) => _mail = mail;
  String get pass => _pass;
  set pass(String pass) => _pass = pass;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _mail = json['mail'];
    _pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['mail'] = this._mail;
    data['pass'] = this._pass;
    return data;
  }
}
