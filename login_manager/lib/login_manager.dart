import 'package:navigation/navigation_service.dart';
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';
import 'package:app_structure/feature_structure.dart';
import 'package:app_structure/product_structure.dart';

abstract class LoginManager extends Feature {
  void registerDependencies(
      {SharedPrefComponent sharedPrefComponent,
      NetworkComponent networkComponent,
      NavigationService navigationService,
      FeatureProvider featureProvider});
}
