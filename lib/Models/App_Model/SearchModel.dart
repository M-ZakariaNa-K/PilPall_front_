class SearchAppModel{
  final int id;
  final String name;
  final String image;
  SearchAppModel({
  required this.id,
  required this.name,
  required this.image,
  });
  factory SearchAppModel.fromJson(JsonData){
  return SearchAppModel(
    id: JsonData['id'],
    name:JsonData['name'],
    image: JsonData['image']==null?"": JsonData['image'],
 );}}
