import 'package:get_it/get_it.dart';
import 'package:deps_helper/DependencyResolver.dart';
import 'package:core/core_component.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class HomeManagerImplDepsResolver implements DependencyResolver {
  HomeManagerImplDepsResolver._();

  static final HomeManagerImplDepsResolver instance =
  HomeManagerImplDepsResolver._();

  @override
  registerFeature(CoreComponent coreComponent) {
    GetIt.instance.registerLazySingleton<Future<SharedPreferences>>(
            () => coreComponent.prefs);
    GetIt.instance
        .registerLazySingleton<Future<Database>>(() => coreComponent.db);
    GetIt.instance.registerLazySingleton<Dio>(() => coreComponent.dio);
  }
}
