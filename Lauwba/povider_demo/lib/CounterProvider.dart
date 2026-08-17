import 'package:flutter/material.dart';

class Counterprovider extends ChangeNotifier{
  int _counter = 0; // inisialisasi nilai counter 0

  int get counter => _counter;

  void increment(){ // ambil nilai counter 0
    _counter++; // tambah nilai counter
    notifyListeners(); // notifikasi perubahan nilai counter
  }
}