class CompanyModel{
  final String name;
  final int id;
  CompanyModel({
    required this.name,
    required this.id,
  });
  factory CompanyModel.fromJson(JsonData){
    return CompanyModel(name:JsonData['name'],
        id: JsonData['id']);
  }
}