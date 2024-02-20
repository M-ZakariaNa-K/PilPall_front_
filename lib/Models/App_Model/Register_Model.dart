
class RegisterModel {
  final String first_name;
  final String last_name;
  final int phone;
  final String address;
  final String password;
  final String confirm_password;
      RegisterModel({
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.address,
    required this.password,
    required this.confirm_password,

});
      factory RegisterModel.fromJson(JsonData){
        return RegisterModel(first_name: JsonData['first_name'],
            last_name:  JsonData['last_name'],
            phone:  JsonData['phone'],
            address:  JsonData['address'],
            password:  JsonData['password'],
            confirm_password:  JsonData['confirm_password']);
      }

}