import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sigmathor/domain/user.dart';
import 'package:sigmathor/param/list_users_param.dart';

abstract class ISigmathorApiDatasource {
  Future<Either<String, List<User>>> listUsers(ListUsersParams params);
}

class SigmathorApiDatasource implements ISigmathorApiDatasource {
  final String url = "http://ip_here:8080/reports/users";
  Dio instance = Dio();

  @override
  Future<Either<String, List<User>>> listUsers(ListUsersParams params) async {
    var response = await instance.post(url, data: {
      "todayDate": params.todayDate,
      "initialDate": params.initialDate,
      "finalDate": params.finalDate,
    });

    throw UnimplementedError();
  }
}
