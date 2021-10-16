import 'package:a_doctor/blocs/splash/splash_event.dart';
import 'package:a_doctor/blocs/splash/splash_state.dart';
import 'package:a_doctor/models/repository.dart';
import 'package:bloc/bloc.dart';

import 'departments/departments_event.dart';
import 'departments/departments_state.dart';
import 'event.dart';
import 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  // AppBloc(AppState initialState) : super(initialState);
  int activePage = 0;
  Repository repo;

  AppBloc(AppState initialState,this.repo) : super(initialState);

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is PageEvent) {
      activePage = event.activePage;
      yield PageState(activePage: activePage);
    }else if(event is GetAllDepartmentsEvent) {
      yield LoadDepartmentsStates();
      var departments = await repo.getAlldepartments();
      yield GetAllDepartmentsStates(departments: departments, isSearching: false);
    }else if(event is FindDepartmentsEvent) {

      var departments = await repo.finddepartments(event.text);
      yield FindDepartmentsStates(departments: departments,isSearching: true);

    }
  }

}