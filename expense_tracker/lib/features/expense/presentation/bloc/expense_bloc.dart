import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/expense_usecases.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final GetTransactionsUseCase getTransactionsUseCase;
  final AddTransactionUseCase addTransactionUseCase;
  final DeleteTransactionUseCase deleteTransactionUseCase;

  ExpenseBloc({
    required this.getTransactionsUseCase,
    required this.addTransactionUseCase,
    required this.deleteTransactionUseCase,
  }) : super(ExpenseInitial()) {
    on<LoadExpensesEvent>((event, emit) async {
      emit(ExpenseLoading());
      try {
        final transactions = await getTransactionsUseCase();
        emit(ExpenseLoaded(transactions));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<AddExpenseEvent>((event, emit) async {
      try {
        await addTransactionUseCase(event.transaction);
        add(LoadExpensesEvent());
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<DeleteExpenseEvent>((event, emit) async {
      try {
        await deleteTransactionUseCase(event.id);
        add(LoadExpensesEvent());
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });
  }
}
