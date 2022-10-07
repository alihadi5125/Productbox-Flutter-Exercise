import 'package:image_picker/image_picker.dart';

class ImagePickerRepository {
  static final ImagePicker imagePicker = ImagePicker();
  static late PickedFile? imageFile;

  static Future<PickedFile?> getImage() async {
    imageFile = await imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxHeight: 400,
      maxWidth: 400,
    );
    return imageFile!;
  }
}
