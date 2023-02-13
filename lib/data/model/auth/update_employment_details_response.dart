class UpdateEmploymentDetailsResponse {
  UpdateEmploymentDetailsResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory UpdateEmploymentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UpdateEmploymentDetailsResponse(
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
    this.employer,
    this.occupation,
    this.salaryOrIncomeRange,
    this.position,
    this.employmentType,
    this.id,
    this.dateTimeCreated,
  });

  String? userId;
  String? employer;
  String? occupation;
  String? salaryOrIncomeRange;
  String? position;
  String? employmentType;
  String? id;
  DateTime? dateTimeCreated;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        employer: json["employer"],
        occupation: json["occupation"],
        salaryOrIncomeRange: json["salaryOrIncomeRange"],
        position: json["position"],
        employmentType: json["employmentType"],
        id: json["id"],
        dateTimeCreated: DateTime.parse(json["dateTimeCreated"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "employer": employer,
        "occupation": occupation,
        "salaryOrIncomeRange": salaryOrIncomeRange,
        "position": position,
        "employmentType": employmentType,
        "id": id,
        "dateTimeCreated": dateTimeCreated?.toIso8601String(),
      };
}
