class StoresModel{
  final int id ;
  final String name ;
  StoresModel({
     required this.id ,
     required this.name});
  factory StoresModel.fromJson(jsonData){
    return StoresModel(
      id: jsonData['store id'],
      name: jsonData['name'],

    );
  }
}