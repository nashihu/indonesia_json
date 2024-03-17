class AddressModel {
  String id;
  String name;

  AddressModel({required this.id, required this.name});

  static AddressModel fromJson(Map<String, dynamic> json) {
    return AddressModel(id: json['id'], name: json['nama']);
  }
}
