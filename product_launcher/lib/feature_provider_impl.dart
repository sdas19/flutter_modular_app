import 'package:app_structure/feature_structure.dart';
import 'package:app_structure/product_structure.dart';

class FeatureProviderImpl implements FeatureProvider {
  final List<Feature> featureList;

  FeatureProviderImpl({this.featureList});

  @override
  Feature provideFeature(String featureName) {
    return featureList.firstWhere((element) => element.name == featureName);
  }

  @override
  void addFeature(Feature feature) {
    featureList.add(feature);
  }
}
