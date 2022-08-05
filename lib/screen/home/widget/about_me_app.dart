import 'package:flutter/material.dart';
import 'package:sigmathor/screen/home/widget/info_label.dart';

class AboutMeDialog extends StatefulWidget {
  const AboutMeDialog({Key? key}) : super(key: key);

  @override
  State<AboutMeDialog> createState() => _AboutMeDialogState();
}

class _AboutMeDialogState extends State<AboutMeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sobre o app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const InfoLabel(
              icon: Icons.build,
              label: "Tecnologia frontend:",
              value: "Flutter",
            ),
            const InfoLabel(
              icon: Icons.backup,
              label: "Tecnologia backend:",
              value: "Spring Boot",
            ),
            const InfoLabel(
              icon: Icons.engineering,
              label: "Desenvolvedor:",
              value: "João Victor",
            ),
            const InfoLabel(
              icon: Icons.code,
              label: "Repositório:",
              value: "https://github.com/SigmaDevelopment2022/sigmathor",
            ),
            const InfoLabel(
              icon: Icons.contact_mail,
              label: "Contato:",
              value: "sigma.dev.2022@gmail.com\n(79) 9 9693-8765",
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.black54),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Powered by",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 12),
                  ),
                  Text(
                    " SigmaDev",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
