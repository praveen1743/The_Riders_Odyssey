import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageProvider extends StateNotifier<XFile?> {
  ImageProvider() : super(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    state = image;
  }
}

final imageProvider = StateNotifierProvider<ImageProvider, XFile?>((ref) {
  return ImageProvider();
});