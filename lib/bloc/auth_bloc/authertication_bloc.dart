import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local_resource/data_store.dart';
import '../../data/repository/user_repository.dart';
import '../../models/params/login_params.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthState> {
  UserRepository userRepository = UserRepository();

  AuthenticationBloc() : super(Init()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is Login) {
        emit(Loading());
        final response = await userRepository.logIn(
            loginParams: LoginParams(
          username: event.username,
          password: event.password,
        ));
        response.fold((l) {
          emit(Error(l));
        }, (r) {
          DataStore.instance.setToken(r.token);
          DataStore.instance.setName("${r.name} ${r.lastName}");
          emit(Success());
        });
      }
    });
  }
}
