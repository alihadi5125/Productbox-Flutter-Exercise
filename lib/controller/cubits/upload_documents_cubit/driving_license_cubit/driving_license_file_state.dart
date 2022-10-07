part of 'driving_license_file_cubit.dart';

@immutable
abstract class DrivingLicenseFileState {}

class DrivingLicenseFileInitial extends DrivingLicenseFileState {}

class ImageSelectState extends DrivingLicenseFileState {
  final File? image;

  ImageSelectState({required this.image});
}

class PdfFileSelectState extends DrivingLicenseFileState {
  final File? image;

  PdfFileSelectState({required this.image});
}

class ImageNotSelectedState extends DrivingLicenseFileState {}
