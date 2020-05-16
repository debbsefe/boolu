import 'package:get_it/get_it.dart';
import 'package:boolu/services/navigation_service.dart';
import 'package:boolu/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
