class LoginModel {
//   bool status;
//   bool message;
//   UserData data;
//   LoginModel.formJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? UserData.formJson(json['data']) : null;
//   }
// }

// class UserData {
//   int id;
//   String name;
//   String email;
//   String phone;
//   String image;
//   int points;
//   int credit;
//   String token;

//   // UserData({
//   //   this.id,
//   //   this.email,
//   //   this.phone,
//   //   this.image,
//   //   this.token,
//   //   this.points,
//   //   this.credit,
//   //   this.name,
//   // });
//   UserData.formJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }
  bool status;
  String message;
  UserData data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  String id;
  String name;
  String phone;

  UserData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
