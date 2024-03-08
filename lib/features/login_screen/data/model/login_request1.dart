/// userName : "1515151515"
/// password : "Qa@123"
/// loginfrom : 1

class LoginRequest1 {
  LoginRequest1({
      String? userName, 
      String? password, 
      num? loginfrom,}){
    _userName = userName;
    _password = password;
    _loginfrom = loginfrom;
}

  LoginRequest1.fromJson(dynamic json) {
    _userName = json['userName'];
    _password = json['password'];
    _loginfrom = json['loginfrom'];
  }
  String? _userName;
  String? _password;
  num? _loginfrom;
LoginRequest1 copyWith({  String? userName,
  String? password,
  num? loginfrom,
}) => LoginRequest1(  userName: userName ?? _userName,
  password: password ?? _password,
  loginfrom: loginfrom ?? _loginfrom,
);
  String? get userName => _userName;
  String? get password => _password;
  num? get loginfrom => _loginfrom;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['password'] = _password;
    map['loginfrom'] = _loginfrom;
    return map;
  }

}