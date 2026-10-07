import 'package:flutter/material.dart';

class SelectableSlotCard
    extends StatelessWidget {
  final String text;
  final bool selected;

  final VoidCallback onTap;

  const SelectableSlotCard({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,

        child: Container(
          height: 52,

          alignment:
          Alignment.center,

          decoration:
          BoxDecoration(
            color:
            selected
                ? const Color(
              0xFF159DB6,
            )
                : Colors.white,

            borderRadius:
            BorderRadius.circular(
              10,
            ),
          ),

          child: Text(
            text,

            style:
            TextStyle(
              color:
              selected
                  ? Colors.white
                  : Colors.black,

              fontWeight:
              FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}