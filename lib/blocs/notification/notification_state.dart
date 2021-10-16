import '../state.dart';

class NotificationState extends AppState {

  @override
  List<Object?> get props => [];
}

class StartUpNotificationState extends NotificationState {}

class IndexedNotification extends NotificationState {
  final int index;

  IndexedNotification(this.index);

  @override
  List<Object> get props => [this.index];

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => super.hashCode;
}