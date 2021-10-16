import '../state.dart';

class PageState extends  AppState{

  int activePage;

  PageState({required this.activePage});

  @override
  List<Object?> get props => [activePage];
}