class MedicineModel{
  final int id ;
  final String commercialName;
  MedicineModel({required this.id ,required this.commercialName});
  factory MedicineModel.fromJson(jsonData){
    return MedicineModel(
      id: jsonData['id'],
      commercialName: jsonData['commercial name'],

    );
  }
}