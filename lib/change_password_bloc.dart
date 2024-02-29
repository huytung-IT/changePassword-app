import 'dart:async';
import 'change_password_event.dart';
import 'change_password_state.dart';

class ChangePasswordBloc {
  bool _isLoading = false;
  String _message = '';

  final _stateController = StreamController<ChangePasswordState>();
  Stream<ChangePasswordState> get stateStream => _stateController.stream;

  final _eventController = StreamController<ChangePasswordEvent>();
  Sink<ChangePasswordEvent> get eventSink => _eventController.sink;

  ChangePasswordBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ChangePasswordEvent event) {
    if (event is RequestChangePasswordEvent) {
      _isLoading = true;
      _message = 'Changing password...';

      // Simulate password change process, you can integrate your logic here.

      _isLoading = false;
      _message = 'Password changed successfully.';
    }

    _stateController.add(ChangePasswordState(isLoading: _isLoading, message: _message));
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
