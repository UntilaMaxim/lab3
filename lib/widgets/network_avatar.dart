import 'package:flutter/material.dart';

class NetworkAvatar
    extends StatelessWidget {
  final String imageUrl;
  final double size;

  const NetworkAvatar({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(
        size / 2,
      ),

      child: Image.network(
        imageUrl,

        width: size,
        height: size,

        fit: BoxFit.cover,

        loadingBuilder:
            (
            context,
            child,
            progress,
            ) {
          if (progress == null) {
            return child;
          }

          return Container(
            width: size,
            height: size,
            color:
            const Color(
              0xFFE4ECEE,
            ),
            child:
            const Center(
              child:
              CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        },

        errorBuilder:
            (
            context,
            error,
            stackTrace,
            ) {
          return Container(
            width: size,
            height: size,
            color:
            const Color(
              0xFFE4ECEE,
            ),
            child:
            const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}