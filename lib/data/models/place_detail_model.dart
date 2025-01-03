class PlaceDetailModel {
  final PlaceDetailMeta meta;
  final List<PlaceDetailData> documents;

  PlaceDetailModel({
    required this.meta,
    required this.documents,
  });

  PlaceDetailModel.fromJson(Map<String, dynamic> json)
      : meta = PlaceDetailMeta.fromJson(json['meta']),
        documents = (json['documents'] as List<dynamic>)
            .map((item) => PlaceDetailData.fromJson(item))
            .toList();
}

class PlaceDetailMeta {
  final bool isEnd;
  final int pageableCount;
  final int totalCount;
  final String? sameName;

  PlaceDetailMeta({
    required this.isEnd,
    required this.pageableCount,
    required this.totalCount,
    this.sameName,
  });

  factory PlaceDetailMeta.fromJson(Map<String, dynamic> json) {
    return PlaceDetailMeta(
      isEnd: json['is_end'],
      pageableCount: json['pageable_count'],
      totalCount: json['total_count'],
      sameName: json['same_name'],
    );
  }
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
  final double longitude;
  final double latitude;

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
        longitude = double.tryParse(json['x'].toString()) ?? 0.0,
        latitude = double.tryParse(json['y'].toString()) ?? 0.0;
}
