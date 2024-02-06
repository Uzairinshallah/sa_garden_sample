


import 'dart:convert';

List<PropertyCount> propertyCountFromJson(String str) => List<PropertyCount>.from(json.decode(str).map((x) => PropertyCount.fromJson(x)));

String propertyCountToJson(List<PropertyCount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyCount {
  int total;
  String type;

  PropertyCount({
    required this.total,
    required this.type,
  });

  factory PropertyCount.fromJson(Map<String, dynamic> json) => PropertyCount(
    total: json["Total"],
    type: json["Type"],
  );

  Map<String, dynamic> toJson() => {
    "Total": total,
    "Type": type,
  };
}
