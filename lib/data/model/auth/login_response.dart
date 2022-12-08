
class LoginResponse {
  LoginResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.scope,
    this.user,
    this.accessToken,
    this.refreshToken,
    this.tokenType,
  });

  String? scope;
  User? user;
  String? accessToken;
  String? refreshToken;
  String? tokenType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    scope: json["scope"],
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "scope": scope,
    "user": user?.toJson(),
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "token_type": tokenType,
  };
}

class User {
  User({
    this.id,
    this.username,
    this.mobileNo,
    this.firstName,
    this.lastName,
    this.email,
    this.status,
    this.twoFactorEnabled,
    this.lastPasswordChange,
    this.deviceUuid,
    this.jti,
    this.permissions,
    this.roleName,
    this.shouldChangePassword,
    this.emailVerified,
    this.mobileVerified,
    this.companyId,
    this.profileType,
    this.eligibleLoanAmount,
    this.loanLimit,
    this.creditScore,
    this.declineLoanRequest,
    this.isRegulatoryIdProvided,
    this.isRegulatoryIdVerified,
    this.isPoliticallyExposed,
    this.hasSetTransactionPin,
    this.hasTakenTrustQuestion,
    this.hasTakenPersonalityQuestion,
    this.hasUploadedSignature,
    this.visibility,
  });

  String? id;
  String? username;
  String? mobileNo;
  String? firstName;
  String? lastName;
  String? email;
  bool? status;
  bool? twoFactorEnabled;
  String? lastPasswordChange;
  String? deviceUuid;
  String? jti;
  List<Permission>? permissions;
  String? roleName;
  int? shouldChangePassword;
  bool? emailVerified;
  bool? mobileVerified;
  String? companyId;
  String? profileType;
  int? eligibleLoanAmount;
  int? loanLimit;
  int? creditScore;
  bool? declineLoanRequest;
  bool? isRegulatoryIdProvided;
  bool? isRegulatoryIdVerified;
  bool? isPoliticallyExposed;
  bool? hasSetTransactionPin;
  bool? hasTakenTrustQuestion;
  bool? hasTakenPersonalityQuestion;
  bool? hasUploadedSignature;
  bool? visibility;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    mobileNo: json["mobileNo"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    status: json["status"],
    twoFactorEnabled: json["TwoFactorEnabled"],
    lastPasswordChange: json["last_password_change"],
    deviceUuid: json["deviceUuid"],
    jti: json["jti"],
    permissions: List<Permission>.from(json["permissions"].map((x) => Permission.fromJson(x))),
    roleName: json["roleName"],
    shouldChangePassword: json["shouldChangePassword"],
    emailVerified: json["emailVerified"],
    mobileVerified: json["mobileVerified"],
    companyId: json["companyId"],
    profileType: json["profileType"],
    eligibleLoanAmount: json["eligibleLoanAmount"],
    loanLimit: json["loanLimit"],
    creditScore: json["creditScore"],
    declineLoanRequest: json["declineLoanRequest"],
    isRegulatoryIdProvided: json["isRegulatoryIdProvided"],
    isRegulatoryIdVerified: json["isRegulatoryIdVerified"],
    isPoliticallyExposed: json["isPoliticallyExposed"],
    hasSetTransactionPin: json["hasSetTransactionPin"],
    hasTakenTrustQuestion: json["hasTakenTrustQuestion"],
    hasTakenPersonalityQuestion: json["hasTakenPersonalityQuestion"],
    hasUploadedSignature: json["hasUploadedSignature"],
    visibility: json["visibility"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "mobileNo": mobileNo,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "status": status,
    "TwoFactorEnabled": twoFactorEnabled,
    "last_password_change": lastPasswordChange,
    "deviceUuid": deviceUuid,
    "jti": jti,
    "permissions": List<dynamic>.from(permissions!.map((x) => x.toJson())),
    "roleName": roleName,
    "shouldChangePassword": shouldChangePassword,
    "emailVerified": emailVerified,
    "mobileVerified": mobileVerified,
    "companyId": companyId,
    "profileType": profileType,
    "eligibleLoanAmount": eligibleLoanAmount,
    "loanLimit": loanLimit,
    "creditScore": creditScore,
    "declineLoanRequest": declineLoanRequest,
    "isRegulatoryIdProvided": isRegulatoryIdProvided,
    "isRegulatoryIdVerified": isRegulatoryIdVerified,
    "isPoliticallyExposed": isPoliticallyExposed,
    "hasSetTransactionPin": hasSetTransactionPin,
    "hasTakenTrustQuestion": hasTakenTrustQuestion,
    "hasTakenPersonalityQuestion": hasTakenPersonalityQuestion,
    "hasUploadedSignature": hasUploadedSignature,
    "visibility": visibility,
  };
}

class Permission {
  Permission({
    this.id,
    this.name,
    this.active,
  });

  int? id;
  String? name;
  bool? active;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    id: json["id"],
    name: json["name"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
  };
}
