import 'feature_structure.dart';

abstract class App {
  String name;
  FeatureProvider getFeatureProvider();
}

abstract class FeatureProvider {
  Feature provideFeature(String featureName);
  void addFeature(Feature feature);
}