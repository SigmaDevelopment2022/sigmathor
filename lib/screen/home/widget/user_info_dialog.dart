import 'package:flutter/material.dart';
import 'package:sigmathor/util/string_extension.dart';

import '../../../domain/user.dart';
import 'info_label.dart';

class UserInfoDialog extends StatefulWidget {
  const UserInfoDialog({
    Key? key,
    required this.user,
    required this.onClose,
  }) : super(key: key);

  final User user;
  final VoidCallback onClose;

  @override
  State<UserInfoDialog> createState() => _UserInfoDialogState();
}

class _UserInfoDialogState extends State<UserInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50, height: 50),
                const Text(
                  "Informações",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                      splashRadius: 20,
                      onPressed: widget.onClose,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                )
              ],
            ),
            InfoLabel(
              icon: Icons.person,
              label: "Nome:",
              value: widget.user.name.capitalize,
            ),
            InfoLabel(
              icon: Icons.group,
              label: "Equipe:",
              value: widget.user.team.name.capitalize,
            ),
            InfoLabel(
              icon: Icons.location_on,
              label: "Cidade:",
              value: widget.user.city.capitalize,
            ),
            InfoLabel(
              icon: Icons.track_changes,
              label: "Meta de hoje / Meta do mês: ",
              value:
                  "${widget.user.goalToday.value} / ${widget.user.goalMonth.value}",
            ),
            InfoLabel(
              icon: Icons.sell,
              label: "Vendido hoje / Vendido no mês: ",
              value:
                  "${widget.user.soldToday.value} / ${widget.user.soldMonth.value}",
            ),
            InfoLabel(
              icon: Icons.attach_money,
              label: "Saldo atual / Limite de crédito: ",
              value:
                  "${widget.user.balanceLast.value} / ${widget.user.balanceLimit.value}",
            )
          ],
        ),
      ),
    );
  }
}
