import '../entities/transaction_entity.dart';

abstract class ExpenseRepository {
  Future<List<TransactionEntity>> getTransactions();
  Future<void> addTransaction(TransactionEntity transaction);
  Future<void> deleteTransaction(String id);
}
