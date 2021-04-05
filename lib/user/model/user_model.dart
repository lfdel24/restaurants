class UserModel {
  late int _id = 0;
  late String _name = "";
  late String _email = "";
  late String _pass = "";

  UserModel(
      {int id = 0, String name = "", String email = "", String pass = ""}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._pass = pass;
  }

  bool isEmpty() {
    return _id == 0;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String mail) => _email = mail;
  String get pass => _pass;
  set pass(String pass) => _pass = pass;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['mail'];
    _pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['mail'] = this._email;
    data['pass'] = this._pass;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{_id: $_id, _name: $_name, _mail: $_email, _pass: $_pass}';
  }
}
