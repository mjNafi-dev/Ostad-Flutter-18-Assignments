import 'dart:io';

extension AmountFormatter on double {
  String toCurrency() {
    return ('৳${this.toStringAsFixed(2)}');
  }
}

class Expense {
  String title;
  double amount;
  String category;

  Expense(this.title, this.amount, this.category);

  String display() {
    return ('$title\t- ${amount.toCurrency()} - $category');
  }
}

class Food extends Expense {
  Food(String title, double amount) : super(title, amount, 'Food');

  @override
  String display() {
    return ('🍔 $title\t- ${amount.toCurrency()} - $category');
  }
}

class Transport extends Expense {
  Transport(String title, double amount) : super(title, amount, 'Transport');

  @override
  String display() {
    return ('🚌 $title\t- ${amount.toCurrency()} - $category');
  }
}

class Entertainment extends Expense {
  Entertainment(String title, double amount) : super(title, amount, 'Entertainment');

  @override
  String display() {
    return ('🎬 $title\t- ${amount.toCurrency()} - $category');
  }
}

class ExpenseTracker {
  List<Expense> expenses = [];

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  void viewExpenses() {
    print('======= All Expenses =======');
    if (expenses.isEmpty) {
      print('No expenses recorded yet');
      return;

    }

    for (int i = 0; i < expenses.length; i++) {
      print('${i + 1}. ${expenses[i].display()}');
    }
  }

  double totalExpenses() {
    double total = 0;
    for (var e in expenses) {
      total += e.amount;
    }
    return total;
  }
}

Expense createExpense(String title, double amount, String? categoryChoice) {
  switch (categoryChoice) {
    case '1':
      return Food(title, amount);
    case '2':
      return Transport(title, amount);
    case '3':
      return Entertainment(title, amount);
    default:
      return Expense(title, amount, 'Uncategorized');
  }
}

void main() {
  ExpenseTracker tracker = ExpenseTracker();
  bool running = true;

  while (running) {
    print('======= Expense Tracker =======');
    print('1. Add Expense');
    print('2. View All Expenses');
    print('3. Show Total Expenses');
    print('4. Exit');
    stdout.write('\nChoose Option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('\nEnter Expense Title: ');
        String title = stdin.readLineSync() ?? '';

        stdout.write('Enter Expense Amount: ');
        double amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;

        print('Choose Category:');
        print('1. Food');
        print('2. Transport');
        print('3. Entertainment');
        stdout.write('Enter Option: ');
        String? categoryChoice = stdin.readLineSync();

        Expense expense = createExpense(title, amount, categoryChoice);
        tracker.addExpense(expense);

        print('Expense Added Successfully!');
        break;

      case '2':
        tracker.viewExpenses();
        break;

      case '3':
        print('\nTotal Expenses: ${tracker.totalExpenses().toCurrency()}');
        break;

      case '4':
        print('\nThank you for using Expense Tracker!');
        running = false;
        break;

      default:
        print('\nInvalid option. Please try again.');
    }
  }
}