import 'package:flutter/material.dart';

class Countprovider with ChangeNotifier {
  bool _isEngineStarted = false;
  bool _areDoorsClosed = false;
  bool _isTrunkClosed = false;
  bool _isClimateOn = false;

  bool get isEngineStarted => _isEngineStarted;
  bool get areDoorsClosed => _areDoorsClosed;
  bool get isTrunkClosed => _isTrunkClosed;
  bool get isClimateOn => _isClimateOn;

  // Accept a bool argument for toggling each state
  void toggleEngine(bool value) {
    _isEngineStarted = value;
    notifyListeners();
  }

  void toggleDoors(bool value) {
    _areDoorsClosed = value;
    notifyListeners();
  }

  void toggleTrunk(bool value) {
    _isTrunkClosed = value;
    notifyListeners();
  }

  void toggleClimate(bool value) {
    _isClimateOn = value;
    notifyListeners();
  }
}
