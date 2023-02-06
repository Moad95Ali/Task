import 'location.dart';

class DetailsApi {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? location;
  String? image;
  String? created;

  DetailsApi(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.location,
      this.image,
      this.created});

  DetailsApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    image = json['image'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    data['created'] = this.created;
    return data;
  }
}
