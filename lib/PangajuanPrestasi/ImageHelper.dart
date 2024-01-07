import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final ImagePicker _imagePicker;

  ImageHelper({
    ImagePicker? imagePicker,
  }) : _imagePicker = imagePicker ?? ImagePicker();

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    final file = await _imagePicker.pickImage(
        source: source, imageQuality: imageQuality);
    if (file != null) {
      return file;
    } else {
      return null;
    }
  }

  Future<XFile?> pickCamera() async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    return file;
  }
}
