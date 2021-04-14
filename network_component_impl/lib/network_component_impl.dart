import 'package:dio/src/dio.dart';
import 'package:network_component/network_component.dart';
import 'package:network_component_impl/helper/network_component_helper.dart';

class NetworkComponentImpl implements NetworkComponent {
  @override
  Dio dio = NetworkComponentHelper.getOrCreateDio();
}
