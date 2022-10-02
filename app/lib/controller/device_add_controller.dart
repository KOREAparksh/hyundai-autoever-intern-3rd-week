import 'package:app/controller/base_controller.dart';
import 'package:get/get.dart';

class DeviceAddController extends BaseController {
  void onTapAddButton(String userId, String deviceId, String deviceDesc,
      String deviceKind, int maxCount, bool state) {
    print(userId + deviceKind);

    //Todo: 통신 후 Dialog 띄우기

    //200 잘 날라오면
    Get.back();
  }
}
