import 'package:sigmathor/domain/balance.dart';
import 'package:sigmathor/domain/goal.dart';
import 'package:sigmathor/domain/sell.dart';
import 'package:sigmathor/domain/team.dart';

class User {
  late int code;
  late String name;
  late String city;
  late Team team;
  late Goal goalToday;
  late Goal goalMonth;
  late Sell soldToday;
  late Sell soldMonth;
  late Balance balanceLimit;
  late Balance balanceLast;

  User({
    required this.code,
    required this.name,
    required this.city,
    required this.team,
    required this.goalToday,
    required this.goalMonth,
    required this.soldToday,
    required this.soldMonth,
    required this.balanceLimit,
    required this.balanceLast,
  });

  User.fromMap(Map<dynamic, dynamic> source) {
    code = source["code"] ?? "";
    name = source["name"] ?? "";
    city = source["city"] ?? "";
    team = Team.fromMap(source["team"]);
    goalToday = Goal(source["goalToday"]["value"] ?? "");
    goalMonth = Goal(source["goalMonth"]["value"] ?? "");
    soldToday = Sell(source["soldToday"]["value"] ?? "");
    soldMonth = Sell(source["soldMonth"]["value"] ?? "");
    balanceLimit = Balance(source["creditLimit"]["value"] ?? "");
    balanceLast = Balance(source["creditLast"]["value"] ?? "");
  }
}
