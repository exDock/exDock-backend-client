import 'package:exdock_backend_client/utils/user_parameters/user_parameter.dart';

class UserParameterCollection {
  UserParameterCollection({
    Map<String, dynamic>? parameterValueStorage,
    List<UserParameter>? parameters,
  })  : parameterValueStorage = parameterValueStorage ?? {},
        parameters = parameters ?? [];

  final List<UserParameter> parameters;
  final Map<String, dynamic> parameterValueStorage;

  void addParameter(UserParameter parameter) {
    parameters.add(parameter);
  }
}
