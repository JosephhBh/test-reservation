import 'package:flutter/material.dart';
import 'package:testluggagelocker/model/locker_model.dart';

class LockersProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  List<LockersModel> _listOfLockers = [];
  List<int> _currentLockers = [];
  // List<int> _currentMeidumLockers = [];
  // List<int> _currentLargeLockers = [];

  int get selectedIndex => _selectedIndex;
  List<LockersModel> get listOfLockers => _listOfLockers;
  List<int> get currentLockers => _currentLockers;
  // List<int> get currentMeidumLockers => _currentMeidumLockers;
  // List<int> get currentLargeLockers => _currentLargeLockers;

  void setSelctedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addLocker() {
    _listOfLockers.add(LockersModel());
    notifyListeners();
  }

  void removeLocker() {
    _listOfLockers.removeLast();
    notifyListeners();
  }

  void updateLockerDetail(LockersModel lockersModel) {
    _listOfLockers[_selectedIndex] = lockersModel;
    notifyListeners();
  }

  void setReservedLockers(int val) {
    _currentLockers.add(val);
    notifyListeners();
  }
}

List<String> lockersSize = ['S', 'M', 'L'];

List<int> smallLockers = [1, 2, 3, 4, 5];
List<int> mediumLockers = [6, 7, 8, 9, 10];
List<int> largeLockers = [11, 12, 13, 14, 15];
