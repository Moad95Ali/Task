class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? image;
  String? created;

  Character(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.gender,
      this.image,
      this.created,
      required Character data});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    gender = json['gender'];
    image = json['image'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['created'] = this.created;
    return data;
  }
}
