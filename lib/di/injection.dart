import 'package:get_it/get_it.dart';

import '../network/dio/dio.dart';
import '../network/dio/network_call.dart';

final instance = GetIt.instance;

Future<void> initAppDependencies() async {
  instance.registerLazySingleton<DioHelper>(() => DioHelper());
  instance.registerLazySingleton<NetworkCall>(
      () => NetworkCall(dioHelper: instance<DioHelper>()));
}
