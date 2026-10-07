import 'package:flutter/material.dart';

import '../models/doctor.dart';
import 'network_avatar.dart';

class DoctorCard
    extends StatelessWidget {
  final Doctor doctor;

  final VoidCallback
  onFavorite;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.onFavorite,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Row(
      children: [
        NetworkAvatar(
          imageUrl:
          doctor.avatarUrl,
          size: 50,
        ),

        const SizedBox(
          width: 11,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Text(
                doctor.name,

                style:
                const TextStyle(
                  fontSize: 13,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 3,
              ),

              Text(
                doctor.specialty,

                style:
                const TextStyle(
                  color:
                  Colors.grey,
                  fontSize: 10,
                ),
              ),

              const SizedBox(
                height: 6,
              ),

              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 15,
                    color:
                    Color(
                      0xFF25A9BC,
                    ),
                  ),

                  const SizedBox(
                    width: 3,
                  ),

                  Expanded(
                    child: Text(
                      doctor.distance,

                      style:
                      const TextStyle(
                        fontSize: 9,
                        color:
                        Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        IconButton(
          onPressed:
          onFavorite,

          icon: Icon(
            doctor.isFavorite
                ? Icons.favorite
                : Icons
                .favorite_border,

            color:
            doctor.isFavorite
                ? Colors.red
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}