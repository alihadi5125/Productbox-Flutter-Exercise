import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/controller/repositories/image_picker_repository.dart';

part 'certificate_file_state.dart';

class CertificateFileCubit extends Cubit<CertificateFileState> {
  CertificateFileCubit() : super(CertificateFileInitial());

  selectProfileImageCamera() async {
    PickedFile? image;

    image = await ImagePickerRepository.getImage();

    if (image!.path.isNotEmpty) {
      emit(ImageSelectState(image: File(image.path)));
    } else {
      emit(ImageNotSelectedState());
    }
  }

  Future<void> selectProfileImageFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['png', 'jpg', 'pdf'], type: FileType.custom);

    if (result != null) {
      File file = File(result.files.single.path!);
      print('File type: ${file.uri.toString()}');
      if (file.uri.toString().contains('pdf')) {
        emit(PdfFileSelectState(image: file));
      } else {
        emit(ImageSelectState(image: file));
      }
    } else {
      emit(ImageNotSelectedState());
    }
  }

  clearState() => emit(CertificateFileInitial());
}
