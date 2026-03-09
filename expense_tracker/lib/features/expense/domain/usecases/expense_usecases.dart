import '../entities/transaction_entity.dart';
import '../repositories/expense_repository.dart';

class GetTransactionsUseCase {
  final ExpenseRepository repository;
  GetTransactionsUseCase(this.repository);

  Future<List<TransactionEntity>> call() async {
    return await repository.getTransactions();
  }
}

class AddTransactionUseCase {
  final ExpenseRepository repository;
  AddTransactionUseCase(this.repository);

  Future<void> call(TransactionEntity transaction) async {
    return await repository.addTransaction(transaction);
  }
}

class DeleteTransactionUseCase {
  final ExpenseRepository repository;
  DeleteTransactionUseCase(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteTransaction(id);
  }
}
