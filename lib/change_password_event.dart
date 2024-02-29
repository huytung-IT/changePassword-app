abstract class ChangePasswordEvent {}

class RequestChangePasswordEvent extends ChangePasswordEvent {
  final String newPassword;

  RequestChangePasswordEvent(this.newPassword);
}