class User {
  int _userId;
  String _name;
  String _email;
  String _adress;
  String _birthday;
  String _gender;
  String _favorite;

  User(this._userId, this._name, this._email, this._adress, this._birthday,
      this._gender, this._favorite);

  String get gender => _gender;

  String get birthday => _birthday;

  String get adress => _adress;

  String get email => _email;

  String get name => _name;

  int get userId => _userId;

  String get favorite => this._favorite;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['user_id'], json['name'], json['email'], json['adress'],
        json['birthday'], json['gender'], json['favorite_genres']);
  }
}
