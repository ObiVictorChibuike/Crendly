class ResidenceCategoriesResponseList {
  final List<ResidenceCategoriesResponse> residenceCategories;

  ResidenceCategoriesResponseList({required this.residenceCategories});

  factory ResidenceCategoriesResponseList.fromJson(List<dynamic> parsedJson) {
    List<ResidenceCategoriesResponse> residenceCategories =
        <ResidenceCategoriesResponse>[];
    residenceCategories =
        parsedJson.map((i) => ResidenceCategoriesResponse.fromJson(i)).toList();
    return new ResidenceCategoriesResponseList(
        residenceCategories: residenceCategories);
  }
}

class ResidenceCategoriesResponse {
  ResidenceCategoriesResponse({
    this.id,
    this.area,
    this.state,
    this.category,
  });

  int? id;
  String? area;
  String? state;
  Category? category;

  factory ResidenceCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      ResidenceCategoriesResponse(
        id: json["id"],
        area: json["area"],
        state: json["state"],
        category: categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area,
        "state": state,
        "category": categoryValues.reverse[category],
      };
}

enum Category { SEMI_URBAN, URBAN, RURAL }

final categoryValues = EnumValues({
  "Rural": Category.RURAL,
  "Semi-Urban": Category.SEMI_URBAN,
  "Urban": Category.URBAN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
