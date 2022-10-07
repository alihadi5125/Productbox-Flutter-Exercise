part of 'profile_picture_cubit.dart';

@immutable
abstract class ProfilePictureState {}

class ProfilePictureInitial extends ProfilePictureState {}

class ImageSelectState extends ProfilePictureState {
  final File? image;

  ImageSelectState({required this.image});
}

class PdfFileSelectState extends ProfilePictureState {
  final File? image;

  PdfFileSelectState({required this.image});
}

class ImageNotSelectedState extends ProfilePictureState {}
