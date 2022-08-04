import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sigmathor/config/api_constants.dart';
import 'package:sigmathor/domain/user.dart';
import 'package:sigmathor/param/list_users_param.dart';

abstract class ISigmathorApiDatasource {
  Future<Either<String, List<User>>> listUsers(ListUsersParams params);
}

class SigmathorApiDatasource implements ISigmathorApiDatasource {
  Dio instance = Dio();

  @override
  Future<Either<String, List<User>>> listUsers(ListUsersParams params) async {
    var url = "$baseUrl/reports/users";

    try {
      Response response = await instance.post(url, data: {
        "todayDate": params.todayDate,
        "initialDate": params.initialDate,
        "finalDate": params.finalDate,
      });

      List<User> users = [];

      response.data.forEach((data) {
        users.add(User.fromMap(data));
      });

      return right(users);
    } on DioError catch (e) {
      if (e.message.contains(
          "No route to host (OS Error: No route to host, errno = 113)"
              .trim())) {
        return left("Erro ao se conectar com a API.");
      }
      rethrow;
    }
  }
}
