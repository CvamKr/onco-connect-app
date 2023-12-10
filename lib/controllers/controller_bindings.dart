import 'package:get/get.dart';
import 'package:onco_app/controllers/auth_controller.dart';
import 'package:onco_app/controllers/poll_controller.dart';
import 'package:onco_app/controllers/user_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => PollController(), fenix: true);
  }
}
