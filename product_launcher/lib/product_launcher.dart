import 'package:navigation/navigation_service.dart';
import 'package:app_structure/product_structure.dart';

abstract class ProductLauncher extends App {
  NavigationService getNavigationService();
}
