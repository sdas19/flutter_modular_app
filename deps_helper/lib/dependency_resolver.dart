
import 'package:network_component/network_component.dart';
import 'package:persistence_component/persistence_component.dart';

abstract class SharedPreferenceDependencyResolver {
  registerSharedPrefComponent(SharedPrefComponent sharedPrefComponent);
}

abstract class LocalPersistanceDependencyResolver {
  registerLocalPersistenceComponent(LocalPersistenceComponent localPersistenceComponent);
}

abstract class NetworkDependencyResolver {
  registerNetworkComponent(NetworkComponent networkComponent);
}