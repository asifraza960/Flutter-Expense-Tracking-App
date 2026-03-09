import 'package:equatable/equatable.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class LoadExpensesEvent extends ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final TransactionEntity transaction;

  const AddExpenseEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class DeleteExpenseEvent extends ExpenseEvent {
  final String id;

  const DeleteExpenseEvent(this.id);

  @override
  List<Object> get props => [id];
}
