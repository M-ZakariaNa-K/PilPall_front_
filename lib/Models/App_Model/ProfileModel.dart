class ProfileModel{
  final String name;
  final String image;
  final int phone;
  ProfileModel({
    required this.name,
    required this.image,
    required this.phone,
  });
  factory ProfileModel.fromJson(JsonData){
    return ProfileModel(name:JsonData['name'],
        image: JsonData['image'],
        phone: JsonData['phone']);
  }
}