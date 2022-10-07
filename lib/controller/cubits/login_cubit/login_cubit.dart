import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/controller/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  /// login
  userLogin({required String? email}) async {
    emit(LoginLoadingState());

    try {
      final userModelList = await LoginRepository.userLogin();

      if (userModelList!.isNotEmpty) {
        for (int i = 0; i < userModelList.length; i++) {
          if (userModelList[i]!.email == email) {
            emit(LoginSuccessState());
            break;
          } else {
            emit(EmailNotExistState());
            break;
          }
        }
      } else {
        emit(LoginErrorState());
      }
    } on Exception catch (e) {
      print('login exception: $e');
      emit(LoginErrorState());
    }
  }
}
