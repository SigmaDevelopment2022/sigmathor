import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.label,
    required this.onValueChange
  }) : super(key: key);
  final double height;
  final double width;
  final IconData icon;
  final String label;
  final Function(String) onValueChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        onChanged: widget.onValueChange,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          label: Text(widget.label),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(widget.icon, size: 24),
          fillColor: Colors.grey.shade300,
          filled: true,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
