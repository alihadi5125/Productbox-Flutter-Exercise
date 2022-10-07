part of 'passport_file_cubit.dart';

@immutable
abstract class PassportFileState {}

class PassportFileInitial extends PassportFileState {}

class ImageSelectState extends PassportFileState {
  final File? image;

  ImageSelectState({required this.image});
}

class PdfFileSelectState extends PassportFileState {
  final File? image;

  PdfFileSelectState({required this.image});
}

class ImageNotSelectedState extends PassportFileState {}
