import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? profileImage;

  pickProfileImage() async {
    final XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      profileImage = File(file.path);
      update();
    }
  }
}
