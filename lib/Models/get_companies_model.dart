class CompaniesModel{
  final int id ;
  final String name ;
  CompaniesModel({
     required this.id ,
     required this.name});
  factory CompaniesModel.fromJson(jsonData){
    return CompaniesModel(
      id: jsonData['id'],
      name: jsonData['name'],

    );
  }
}