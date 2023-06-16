class CafePlaceIdModel {
  final String placeId;
  CafePlaceIdModel({required this.placeId});

  factory CafePlaceIdModel.fromJson(Map<String, dynamic> json) {
    return CafePlaceIdModel(
      placeId: json['place_id'],
    );
  }
}

class CafeDataModel {
  final String name;
  OpeningHours openingHours;
  Geometry geometry;
  CafeDataModel(
      {required this.name, required this.geometry, required this.openingHours});

  CafeDataModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        geometry = Geometry.fromJson(json['geometry']),
        openingHours = OpeningHours.fromJson(json['current_opening_hours']);
}

class Geometry {
  final location;
  Geometry({required this.location});
  Geometry.fromJson(Map<String, dynamic> json) : location = json['location'];
}

class OpeningHours {
  final weekdayText;
  OpeningHours({required this.weekdayText});

  OpeningHours.fromJson(Map<String, dynamic> json)
      : weekdayText = json['weekday_text'];
}
