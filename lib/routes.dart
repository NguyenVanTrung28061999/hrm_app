import 'package:app_hrm/screens/home/home_screen.dart';
import 'package:app_hrm/screens/login/login_screen.dart';
import 'package:app_hrm/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetPageApp {
  final box = GetStorage();
  GetPageApp();

  List<GetPage> onGenerateGetPage(String payload) {
    return [
      GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
      GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
      GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
    ];
  }
}
