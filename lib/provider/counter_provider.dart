import 'package:flutter/material.dart';

class HistoryItem {
  final int value;
  final DateTime timestamp;
  HistoryItem({required this.value, required this.timestamp});
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  final List<HistoryItem> _history = [];

  int get counter => _counter;
  List<HistoryItem> get history => _history;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void save() {
    _history.insert(0, HistoryItem(value: _counter, timestamp: DateTime.now()));
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
