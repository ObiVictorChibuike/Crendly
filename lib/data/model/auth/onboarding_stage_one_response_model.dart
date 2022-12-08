
class OnBoardingStageOneResponseModel {
  OnBoardingStageOneResponseModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory OnBoardingStageOneResponseModel.fromJson(Map<String, dynamic> json) => OnBoardingStageOneResponseModel(
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
    this.userId,
    this.accessToken,
    this.isBvnVerified,
    this.eligibleLoanAmount,
    this.loanLimit,
    this.declineLoanRequest,
    this.hasNotCompletedOnboarding,
    this.bvnData,
  });

  String? userId;
  String? accessToken;
  bool? isBvnVerified;
  int? eligibleLoanAmount;
  int? loanLimit;
  bool? declineLoanRequest;
  bool? hasNotCompletedOnboarding;
  BvnData? bvnData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    accessToken: json["accessToken"],
    isBvnVerified: json["isBvnVerified"],
    eligibleLoanAmount: json["eligibleLoanAmount"],
    loanLimit: json["loanLimit"],
    declineLoanRequest: json["declineLoanRequest"],
    hasNotCompletedOnboarding: json["hasNotCompletedOnboarding"],
    bvnData: BvnData.fromJson(json["bvnData"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "accessToken": accessToken,
    "isBvnVerified": isBvnVerified,
    "eligibleLoanAmount": eligibleLoanAmount,
    "loanLimit": loanLimit,
    "declineLoanRequest": declineLoanRequest,
    "hasNotCompletedOnboarding": hasNotCompletedOnboarding,
    "bvnData": bvnData?.toJson(),
  };
}

class BvnData {
  BvnData({
    this.parentId,
    this.status,
    this.dataValidation,
    this.selfieValidation,
    this.firstName,
    this.middleName,
    this.lastName,
    this.image,
    this.enrollmentBranch,
    this.enrollmentInstitution,
    this.mobile,
    this.dateOfBirth,
    this.isConsent,
    this.idNumber,
    this.businessId,
    this.type,
    this.gender,
    this.requestedAt,
    this.country,
    this.createdAt,
    this.lastModifiedAt,
    this.id,
  });

  String? parentId;
  String? status;
  bool? dataValidation;
  bool? selfieValidation;
  String? firstName;
  String? middleName;
  String? lastName;
  String? image;
  String? enrollmentBranch;
  String? enrollmentInstitution;
  String? mobile;
  String? dateOfBirth;
  bool? isConsent;
  String? idNumber;
  String? businessId;
  String? type;
  String? gender;
  DateTime? requestedAt;
  String? country;
  DateTime? createdAt;
  DateTime? lastModifiedAt;
  String? id;

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData(
    parentId: json["parentId"],
    status: json["status"],
    dataValidation: json["dataValidation"],
    selfieValidation: json["selfieValidation"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    image: json["image"],
    enrollmentBranch: json["enrollmentBranch"],
    enrollmentInstitution: json["enrollmentInstitution"],
    mobile: json["mobile"],
    dateOfBirth: json["dateOfBirth"],
    isConsent: json["isConsent"],
    idNumber: json["idNumber"],
    businessId: json["businessId"],
    type: json["type"],
    gender: json["gender"],
    requestedAt: DateTime.parse(json["requestedAt"]),
    country: json["country"],
    createdAt: DateTime.parse(json["createdAt"]),
    lastModifiedAt: DateTime.parse(json["lastModifiedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "parentId": parentId,
    "status": status,
    "dataValidation": dataValidation,
    "selfieValidation": selfieValidation,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "image": image,
    "enrollmentBranch": enrollmentBranch,
    "enrollmentInstitution": enrollmentInstitution,
    "mobile": mobile,
    "dateOfBirth": dateOfBirth,
    "isConsent": isConsent,
    "idNumber": idNumber,
    "businessId": businessId,
    "type": type,
    "gender": gender,
    "requestedAt": requestedAt?.toIso8601String(),
    "country": country,
    "createdAt": createdAt?.toIso8601String(),
    "lastModifiedAt": lastModifiedAt?.toIso8601String(),
    "id": id,
  };
}
