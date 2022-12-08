
class UpdatePersonalInformationResponse {
  UpdatePersonalInformationResponse({
    this.data,
    this.code,
    this.message,
  });

  Data? data;
  int? code;
  String? message;

  factory UpdatePersonalInformationResponse.fromJson(Map<String, dynamic> json) => UpdatePersonalInformationResponse(
    data: Data.fromJson(json["data"]),
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "message": message,
  };
}

class Data {
  Data({
    this.picture,
    this.phoneNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.state,
    this.lga,
    this.email,
    this.isEmailVerified,
    this.isRegulatoryIdProvided,
    this.isRegulatoryIdVerified,
    this.isPoliticallyExposed,
    this.hasSetTransactionPin,
    this.employmentStatus,
    this.educationalQualification,
    this.maritalStatus,
    this.socialMediaHandles,
  });

  String? picture;
  String? phoneNumber;
  String? firstName;
  String? middleName;
  String? lastName;
  String? gender;
  String? state;
  String? lga;
  String? email;
  bool? isEmailVerified;
  bool? isRegulatoryIdProvided;
  bool? isRegulatoryIdVerified;
  bool? isPoliticallyExposed;
  bool? hasSetTransactionPin;
  String? employmentStatus;
  String? educationalQualification;
  String? maritalStatus;
  List<SocialMediaHandle>? socialMediaHandles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    picture: json["picture"],
    phoneNumber: json["phoneNumber"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    gender: json["gender"],
    state: json["state"],
    lga: json["lga"],
    email: json["email"],
    isEmailVerified: json["isEmailVerified"],
    isRegulatoryIdProvided: json["isRegulatoryIdProvided"],
    isRegulatoryIdVerified: json["isRegulatoryIdVerified"],
    isPoliticallyExposed: json["isPoliticallyExposed"],
    hasSetTransactionPin: json["hasSetTransactionPin"],
    employmentStatus: json["employmentStatus"],
    educationalQualification: json["educationalQualification"],
    maritalStatus: json["maritalStatus"],
    socialMediaHandles: List<SocialMediaHandle>.from(json["socialMediaHandles"].map((x) => SocialMediaHandle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "picture": picture,
    "phoneNumber": phoneNumber,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "gender": gender,
    "state": state,
    "lga": lga,
    "email": email,
    "isEmailVerified": isEmailVerified,
    "isRegulatoryIdProvided": isRegulatoryIdProvided,
    "isRegulatoryIdVerified": isRegulatoryIdVerified,
    "isPoliticallyExposed": isPoliticallyExposed,
    "hasSetTransactionPin": hasSetTransactionPin,
    "employmentStatus": employmentStatus,
    "educationalQualification": educationalQualification,
    "maritalStatus": maritalStatus,
    "socialMediaHandles": List<dynamic>.from(socialMediaHandles!.map((x) => x.toJson())),
  };
}

class SocialMediaHandle {
  SocialMediaHandle({
    this.name,
    this.handle,
  });

  String? name;
  String? handle;

  factory SocialMediaHandle.fromJson(Map<String, dynamic> json) => SocialMediaHandle(
    name: json["name"],
    handle: json["handle"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "handle": handle,
  };
}
