class CategoriesModels {
  final int id ;
  final String name;
  final String image; 
  CategoriesModels({
  required this.id ,
  required this.name ,
  required this.image});
  factory CategoriesModels.fromJson(jsonData){
    return CategoriesModels(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
    );
  }
}