import 'package:permission_handler/permission_handler.dart';

class GetPermission{
  static Future<bool> getCameraPermission() async{
    PermissionStatus permissionStatus = await Permission.camera.status;
    if(permissionStatus.isDenied){
      PermissionStatus status = await Permission.camera.request();
      if (status.isGranted) {
        return true;
      }
      return false;
    }
    return true;
  }

  static Future<bool> getStoragePermission() async{
    PermissionStatus permissionStatus = await Permission.storage.status;
    if(permissionStatus.isDenied){
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      }
      return false;
    }
    return true;
  }

}