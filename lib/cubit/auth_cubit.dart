import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:airplane/shared/error_message.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _message = ErrorMessage();

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      UserModel user =
          await AuthService().signIn(email: email, password: password);

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(_message.auth(e.message!)));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService()
          .signUp(name: name, email: email, password: password, hobby: hobby);

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(_message.auth(e.message!)));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());

      await AuthService().signOut();

      emit(AuthInitial());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.message!));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.message!));
    }
  }
}
