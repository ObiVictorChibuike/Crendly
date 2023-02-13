import 'package:cloudinary_public/cloudinary_public.dart';

abstract class CloudinaryService {
  Future<CloudinaryResponse> uploadFileOnCloudinary(
      String filePath, CloudinaryResourceType resourceType);
}
