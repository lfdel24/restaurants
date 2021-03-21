class UserModel {
  String _id;
  String _name;
  String _email;
  String _pass;

  UserModel(this._id, this._name, this._email, this._pass);

  String get pass => _pass;

  set pass(String value) {
    _pass = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
