import 'package:flutter/cupertino.dart';

class DrawerProvider with ChangeNotifier {
  double _xOffset = 0;
  double get xOffset => _xOffset;

  double _yOffset = 0;
  double get yOffset => _yOffset;

  double _scale = 1;
  double get scale => _scale;

  bool _isDrawerOpen = false;
  bool get isDrawerOpen => _isDrawerOpen;

  void toggleDrawer() {
    _isDrawerOpen = !isDrawerOpen;
    _scale = isDrawerOpen ? 0.7 : 1;
    _xOffset = isDrawerOpen ? -150 : 0;
    _yOffset = isDrawerOpen ? 120 : 0;

    notifyListeners();
  }
}
