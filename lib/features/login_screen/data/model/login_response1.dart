/// status : 200
/// statusMessage : "Welcome to Todkar Sanjeevani...!"
/// data : {"userId":5,"areaId":0,"firstName":"Komal","lastName":"Patill","email":null,"mobileNumber":null,"languageId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOiI1IiwidW5pcXVlX25hbWUiOiJLb21hbCIsInJvbGUiOiIiLCJhY3RvcnQiOiIyIiwiZmFtaWx5X25hbWUiOiJQYXRpbGwiLCJnaXZlbl9uYW1lIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyZWQiOiI1LzYvMjAyNCAxMjoyMDoxMCBQTSIsImp0aSI6IjRjZDI0N2IxLTgxYTEtNDZjYi1iOGViLWQ2MmM5MGI3ZDA4NyIsIm5iZiI6MTcwOTc5NDIxMCwiZXhwIjoxNzE0OTk4MDEwLCJpYXQiOjE3MDk3OTQyMTAsImlzcyI6Imh0dHA6Ly9vZWMuY29tIiwiYXVkIjoiaHR0cDovL29lYy5jb20ifQ.UagDBW2uWuNwWzsUFEzSpj-uDOiX7VkPTc14N5hKu0M","validTill":"2024-05-06T12:20:10.8082701Z","roleId":2,"role":"User","profilePath":null,"refercode":null,"refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOiI1IiwidW5pcXVlX25hbWUiOiJLb21hbCIsInJvbGUiOiIiLCJhY3RvcnQiOiIyIiwiZmFtaWx5X25hbWUiOiJQYXRpbGwiLCJnaXZlbl9uYW1lIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyZWQiOiI1LzYvMjAyNCAxMjoyMDoxMCBQTSIsImp0aSI6ImU1M2Q2NDAwLWVkZTQtNGQ3Yy1iMGMwLWE0NjdkOTIxMDM5NSIsIm5iZiI6MTcwOTc5NDIxMCwiZXhwIjoxNzE0OTk4MDEwLCJpYXQiOjE3MDk3OTQyMTAsImlzcyI6Imh0dHA6Ly9vZWMuY29tIiwiYXVkIjoiaHR0cDovL29lYy5jb20ifQ.FN_-Xk0otyutDgSA4USLyXCng6a6kccap_39QzGkNvU%347","refresh_ValidTill":"2024-05-06T12:20:10.8376167Z"}

class LoginResponse1 {
  LoginResponse1({
      num? status, 
      String? statusMessage, 
      Data? data,}){
    _status = status;
    _statusMessage = statusMessage;
    _data = data;
}

  LoginResponse1.fromJson(dynamic json) {
    _status = json['status'];
    _statusMessage = json['statusMessage'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _statusMessage;
  Data? _data;
LoginResponse1 copyWith({  num? status,
  String? statusMessage,
  Data? data,
}) => LoginResponse1(  status: status ?? _status,
  statusMessage: statusMessage ?? _statusMessage,
  data: data ?? _data,
);
  num? get status => _status;
  String? get statusMessage => _statusMessage;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['statusMessage'] = _statusMessage;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// userId : 5
/// areaId : 0
/// firstName : "Komal"
/// lastName : "Patill"
/// email : null
/// mobileNumber : null
/// languageId : 1
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOiI1IiwidW5pcXVlX25hbWUiOiJLb21hbCIsInJvbGUiOiIiLCJhY3RvcnQiOiIyIiwiZmFtaWx5X25hbWUiOiJQYXRpbGwiLCJnaXZlbl9uYW1lIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyZWQiOiI1LzYvMjAyNCAxMjoyMDoxMCBQTSIsImp0aSI6IjRjZDI0N2IxLTgxYTEtNDZjYi1iOGViLWQ2MmM5MGI3ZDA4NyIsIm5iZiI6MTcwOTc5NDIxMCwiZXhwIjoxNzE0OTk4MDEwLCJpYXQiOjE3MDk3OTQyMTAsImlzcyI6Imh0dHA6Ly9vZWMuY29tIiwiYXVkIjoiaHR0cDovL29lYy5jb20ifQ.UagDBW2uWuNwWzsUFEzSpj-uDOiX7VkPTc14N5hKu0M"
/// validTill : "2024-05-06T12:20:10.8082701Z"
/// roleId : 2
/// role : "User"
/// profilePath : null
/// refercode : null
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOiI1IiwidW5pcXVlX25hbWUiOiJLb21hbCIsInJvbGUiOiIiLCJhY3RvcnQiOiIyIiwiZmFtaWx5X25hbWUiOiJQYXRpbGwiLCJnaXZlbl9uYW1lIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyZWQiOiI1LzYvMjAyNCAxMjoyMDoxMCBQTSIsImp0aSI6ImU1M2Q2NDAwLWVkZTQtNGQ3Yy1iMGMwLWE0NjdkOTIxMDM5NSIsIm5iZiI6MTcwOTc5NDIxMCwiZXhwIjoxNzE0OTk4MDEwLCJpYXQiOjE3MDk3OTQyMTAsImlzcyI6Imh0dHA6Ly9vZWMuY29tIiwiYXVkIjoiaHR0cDovL29lYy5jb20ifQ.FN_-Xk0otyutDgSA4USLyXCng6a6kccap_39QzGkNvU%347"
/// refresh_ValidTill : "2024-05-06T12:20:10.8376167Z"

class Data {
  Data({
      num? userId, 
      num? areaId, 
      String? firstName, 
      String? lastName, 
      dynamic email, 
      dynamic mobileNumber, 
      num? languageId, 
      String? token, 
      String? validTill, 
      num? roleId, 
      String? role, 
      dynamic profilePath, 
      dynamic refercode, 
      String? refreshToken, 
      String? refreshValidTill,}){
    _userId = userId;
    _areaId = areaId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobileNumber = mobileNumber;
    _languageId = languageId;
    _token = token;
    _validTill = validTill;
    _roleId = roleId;
    _role = role;
    _profilePath = profilePath;
    _refercode = refercode;
    _refreshToken = refreshToken;
    _refreshValidTill = refreshValidTill;
}

  Data.fromJson(dynamic json) {
    _userId = json['userId'];
    _areaId = json['areaId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _languageId = json['languageId'];
    _token = json['token'];
    _validTill = json['validTill'];
    _roleId = json['roleId'];
    _role = json['role'];
    _profilePath = json['profilePath'];
    _refercode = json['refercode'];
    _refreshToken = json['refreshToken'];
    _refreshValidTill = json['refresh_ValidTill'];
  }
  num? _userId;
  num? _areaId;
  String? _firstName;
  String? _lastName;
  dynamic _email;
  dynamic _mobileNumber;
  num? _languageId;
  String? _token;
  String? _validTill;
  num? _roleId;
  String? _role;
  dynamic _profilePath;
  dynamic _refercode;
  String? _refreshToken;
  String? _refreshValidTill;
Data copyWith({  num? userId,
  num? areaId,
  String? firstName,
  String? lastName,
  dynamic email,
  dynamic mobileNumber,
  num? languageId,
  String? token,
  String? validTill,
  num? roleId,
  String? role,
  dynamic profilePath,
  dynamic refercode,
  String? refreshToken,
  String? refreshValidTill,
}) => Data(  userId: userId ?? _userId,
  areaId: areaId ?? _areaId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobileNumber: mobileNumber ?? _mobileNumber,
  languageId: languageId ?? _languageId,
  token: token ?? _token,
  validTill: validTill ?? _validTill,
  roleId: roleId ?? _roleId,
  role: role ?? _role,
  profilePath: profilePath ?? _profilePath,
  refercode: refercode ?? _refercode,
  refreshToken: refreshToken ?? _refreshToken,
  refreshValidTill: refreshValidTill ?? _refreshValidTill,
);
  num? get userId => _userId;
  num? get areaId => _areaId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get email => _email;
  dynamic get mobileNumber => _mobileNumber;
  num? get languageId => _languageId;
  String? get token => _token;
  String? get validTill => _validTill;
  num? get roleId => _roleId;
  String? get role => _role;
  dynamic get profilePath => _profilePath;
  dynamic get refercode => _refercode;
  String? get refreshToken => _refreshToken;
  String? get refreshValidTill => _refreshValidTill;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['areaId'] = _areaId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['languageId'] = _languageId;
    map['token'] = _token;
    map['validTill'] = _validTill;
    map['roleId'] = _roleId;
    map['role'] = _role;
    map['profilePath'] = _profilePath;
    map['refercode'] = _refercode;
    map['refreshToken'] = _refreshToken;
    map['refresh_ValidTill'] = _refreshValidTill;
    return map;
  }

}