import 'package:flutter/material.dart';

class InfoLabel extends StatefulWidget {
  const InfoLabel({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String value;

  @override
  State<InfoLabel> createState() => _InfoLabelState();
}

class _InfoLabelState extends State<InfoLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.blue.shade500,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                    color: Colors.blue.shade500, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            widget.value,
            style: const TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
