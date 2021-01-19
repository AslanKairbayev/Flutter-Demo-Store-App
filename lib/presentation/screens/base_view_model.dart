import 'package:demo_app/presentation/enums/screen_state.dart';
import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  ScreenState _state = ScreenState.Idle;

  ScreenState get state => _state;

  void setState(ScreenState screenState) {
    _state = screenState;
    notifyListeners();
  }
}
