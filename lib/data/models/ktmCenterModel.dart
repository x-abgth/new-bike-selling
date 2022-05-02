class CenterData {
  String id;
  String center_name;
  String center_address;
  String contact_number;
  String latitude;
  String longitude;

  CenterData(
      {this.id,
      this.center_name,
      this.center_address,
      this.contact_number,
      this.latitude,
      this.longitude});

  factory CenterData.fromJson(Map<String, dynamic> json) {
    return CenterData(
      id: json['id'],
      center_name: json['center_name'],
      center_address: json['center_address'],
      contact_number: json['contact_number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
