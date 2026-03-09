import 'package:hive/hive.dart';
import '../models/transaction_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class ExpenseLocalDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<void> addTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String id);
}

class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final Box<TransactionModel> box;

  ExpenseLocalDataSourceImpl(this.box);

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final transactions = box.values.toList();
      // Sort by date descending
      transactions.sort((a, b) => b.date.compareTo(a.date));
      return transactions;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      await box.put(transaction.id, transaction);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await box.delete(id);
    } catch (e) {
      throw CacheException();
    }
  }
}
