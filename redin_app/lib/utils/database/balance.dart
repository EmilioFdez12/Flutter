import 'package:flutter/material.dart';
import 'package:redin_app/utils/database/crud.dart';


class BalanceProvider extends ChangeNotifier {
  int _balance = 0;
  final Crud _dbHelper = Crud();

  BalanceProvider() {
    _loadBalance();
  }

  int get balance => _balance;

  Future<void> _loadBalance() async {
    _balance = await _dbHelper.getBalance();
    notifyListeners();
  }

  Future<void> addCoins(int amount) async {
    _balance += amount;
    await _dbHelper.updateBalance(_balance);
    notifyListeners();
  }

  Future<void> subtractCoins(int amount) async {
    if (_balance >= amount) {
      _balance -= amount;
      await _dbHelper.updateBalance(_balance);
      notifyListeners();
    }
  }
}