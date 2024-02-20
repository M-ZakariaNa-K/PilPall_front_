class LoginModel {

  final int phone;
  final String password;

  LoginModel({
    required this.phone,
    required this.password,

  });
  factory LoginModel.fromJson(JsonData){
    return LoginModel(
        phone:  JsonData['phone'],
        password:  JsonData['password'],);
  }

}