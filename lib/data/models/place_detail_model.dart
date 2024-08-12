class PlaceDetailModel {
  final Map<String, dynamic> meta;
  final List<PlaceDetailData> documents;

  PlaceDetailModel({
    required this.meta,
    required this.documents,
  });

  PlaceDetailModel.fromJson(Map<String, dynamic> json)
      : meta = json['meta'],
        documents = (json['documents'] as List<dynamic>)
            .map((item) => PlaceDetailData.fromJson(item))
            .toList();
}

class PlaceDetailData {
  final String addressName;
  final String categoryGroupCode;
  final String categoryGroupName;
  final String categoryName;
  final String distance;
  final String id;
  final String phone;
  final String placeName;
  final String placeUrl;
  final String roadAddressName;
  final String longitude;
  final String latitude;

  PlaceDetailData({
    required this.addressName,
    required this.categoryGroupCode,
    required this.categoryGroupName,
    required this.categoryName,
    required this.distance,
    required this.id,
    required this.phone,
    required this.placeName,
    required this.placeUrl,
    required this.roadAddressName,
    required this.longitude,
    required this.latitude,
  });

  PlaceDetailData.fromJson(Map<String, dynamic> json)
      : addressName = json['address_name'],
        categoryGroupCode = json['category_group_code'],
        categoryGroupName = json['category_group_name'],
        categoryName = json['category_name'],
        distance = json['distance'],
        id = json['id'],
        phone = json['phone'],
        placeName = json['place_name'],
        placeUrl = json['place_url'],
        roadAddressName = json['road_address_name'],
        longitude = json['x'],
        latitude = json['y'];
}
