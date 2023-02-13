import 'package:cloudinary_public/cloudinary_public.dart';

import '../../services/cloudinary_services/cloudinary_service.dart';

class CloudinaryServiceImpl implements CloudinaryService {
  @override
  Future<CloudinaryResponse> uploadFileOnCloudinary(
      String filePath, CloudinaryResourceType resourceType) async {
    CloudinaryResponse response;
    try {
      var cloudinary =
          CloudinaryPublic("trustbreed", "client-upload", cache: false);
      response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(filePath, resourceType: resourceType),
      );

      return response;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      throw Exception();
    }
  }
}
