import 'dart:math';

import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());

      await TransactionService().createTransaction(transaction);

      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions() async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions();

      List<TransactionModel> dataTransactions = [];

      for (var el in transactions) {
        if (el.user.id == user!.uid) {
          dataTransactions.add(el);
        }
      }

      emit(TransactionSuccess(dataTransactions));
    } catch (e) {
      print(e);
      emit(TransactionFailed(e.toString()));
    }
  }
}
