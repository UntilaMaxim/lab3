import 'package:flutter/material.dart';

class MedicalSearchBar
    extends StatelessWidget {
  final String hint;
  final ValueChanged<String>
  onChanged;

  final VoidCallback
  onFilterPressed;

  const MedicalSearchBar({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Container(
      height: 52,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
      ),

      child: TextField(
        onChanged: onChanged,

        decoration:
        InputDecoration(
          border: InputBorder.none,

          hintText: hint,

          hintStyle:
          const TextStyle(
            color:
            Color(0xFF9CA5B5),
          ),

          prefixIcon:
          const Icon(
            Icons.search,
            color:
            Color(0xFF9CA5B5),
          ),

          suffixIcon:
          IconButton(
            onPressed:
            onFilterPressed,

            icon:
            const Icon(
              Icons.tune,
              color:
              Color(0xFF9CA5B5),
            ),
          ),
        ),
      ),
    );
  }
}