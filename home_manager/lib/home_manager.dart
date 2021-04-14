import 'package:persistence_component/persistence_component.dart';
import 'package:navigation/navigation_service.dart';
import 'package:app_structure/feature_structure.dart';
import 'package:app_structure/product_structure.dart';

abstract class HomeManager extends Feature {
  void registerDependencies(
      {LocalPersistenceComponent localPersistenceComponent,
      NavigationService navigationService,
      FeatureProvider featureProvider});
}
