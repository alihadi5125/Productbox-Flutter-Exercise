import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/controller/document_check_controller.dart';

part 'documents_progress_bar_state.dart';

class DocumentsProgressBarCubit extends Cubit<DocumentsProgressBarState> {
  DocumentsProgressBarCubit() : super(DocumentsProgressBarInitial());

  refreshState({required index}) {
    DocumentCheckController.list[index] = true;
    emit(DocumentsProgressBarRefresh());
  }

  clearState(){
    DocumentCheckController.list=[false, false, false, false];
    emit(DocumentsProgressBarRefresh());
  }
}
