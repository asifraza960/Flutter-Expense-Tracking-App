import 'package:equatable/equatable.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();
  
  @override
  List<Object> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<TransactionEntity> transactions;

  const ExpenseLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}
