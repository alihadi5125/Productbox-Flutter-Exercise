part of 'certificate_file_cubit.dart';

@immutable
abstract class CertificateFileState {}

class CertificateFileInitial extends CertificateFileState {}

class ImageSelectState extends CertificateFileState {
  final File? image;

  ImageSelectState({required this.image});
}

class PdfFileSelectState extends CertificateFileState {
  final File? image;

  PdfFileSelectState({required this.image});
}

class ImageNotSelectedState extends CertificateFileState {}
