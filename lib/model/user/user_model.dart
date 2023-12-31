///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UserModelRefreshToken {
/*
{
  "tokenExpired": 720,
  "refreshToken": "token"
} 
*/

  int? tokenExpired;
  String? refreshToken;

  UserModelRefreshToken({
    this.tokenExpired,
    this.refreshToken,
  });
  UserModelRefreshToken.fromJson(Map<String, dynamic> json) {
    tokenExpired = json['tokenExpired']?.toInt();
    refreshToken = json['refreshToken']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tokenExpired'] = tokenExpired;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class UserModelUser {
/*
{
  "id": 433604937826373,
  "userID": "xxadmin",
  "userName": "xxadmin",
  "department": "",
  "email": null,
  "mobilePhone": null,
  "officePhone": null,
  "openId": null,
  "avatar": null,
  "logo": "data:image/png",
  "miniLogo": null
} 
*/

  int? id;
  String? userID;
  String? userName;
  String? department;
  String? email;
  String? mobilePhone;
  String? officePhone;
  String? openId;
  String? avatar;
  String? logo;
  String? miniLogo;

  UserModelUser({
    this.id,
    this.userID,
    this.userName,
    this.department,
    this.email,
    this.mobilePhone,
    this.officePhone,
    this.openId,
    this.avatar,
    this.logo,
    this.miniLogo,
  });
  UserModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userID = json['userID']?.toString();
    userName = json['userName']?.toString();
    department = json['department']?.toString();
    email = json['email']?.toString();
    mobilePhone = json['mobilePhone']?.toString();
    officePhone = json['officePhone']?.toString();
    openId = json['openId']?.toString();
    avatar = json['avatar']?.toString();
    logo = json['logo']?.toString();
    miniLogo = json['miniLogo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userID'] = userID;
    data['userName'] = userName;
    data['department'] = department;
    data['email'] = email;
    data['mobilePhone'] = mobilePhone;
    data['officePhone'] = officePhone;
    data['openId'] = openId;
    data['avatar'] = avatar;
    data['logo'] = logo;
    data['miniLogo'] = miniLogo;
    return data;
  }
}

class UserModel {
/*
{
  "user": {
    "id": 433604937826373,
    "userID": "xxadmin",
    "userName": "xxadmin",
    "department": "",
    "email": null,
    "mobilePhone": null,
    "officePhone": null,
    "openId": null,
    "avatar": null,
    "logo": "data:image/png",
    "miniLogo": null
  },
  "token": "token",
  "refreshToken": {
    "tokenExpired": 720,
    "refreshToken": "token"
  },
  "eqpid": "",
  "projectName": "",
  "projectType": "",
  "lang": null
} 
*/

  UserModelUser? user;
  String? token;
  UserModelRefreshToken? refreshToken;
  String? eqpid;
  String? projectName;
  String? projectType;
  String? lang;

  UserModel({
    this.user,
    this.token,
    this.refreshToken,
    this.eqpid,
    this.projectName,
    this.projectType,
    this.lang,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null) ? UserModelUser.fromJson(json['user']) : null;
    token = json['token']?.toString();
    refreshToken = (json['refreshToken'] != null) ? UserModelRefreshToken.fromJson(json['refreshToken']) : null;
    eqpid = json['eqpid']?.toString();
    projectName = json['projectName']?.toString();
    projectType = json['projectType']?.toString();
    lang = json['lang']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    if (refreshToken != null) {
      data['refreshToken'] = refreshToken!.toJson();
    }
    data['eqpid'] = eqpid;
    data['projectName'] = projectName;
    data['projectType'] = projectType;
    data['lang'] = lang;
    return data;
  }
}
