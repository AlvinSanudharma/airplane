import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      this.hobby = '',
      this.balance = 0});

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
      id: id,
      email: json['email'],
      name: json['name'],
      hobby: json['hobby'],
      balance: json['balance']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'hobby': hobby,
        'balance': balance,
      };

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
