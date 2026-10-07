import 'package:flutter/material.dart';

import '../models/app_data.dart';
import 'network_avatar.dart';

class AppointmentCard
    extends StatelessWidget {
  final AppointmentSummary data;

  final VoidCallback onTap;

  const AppointmentCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding:
        const EdgeInsets.all(
          18,
        ),

        decoration:
        BoxDecoration(
          color:
          const Color(
            0xFF25A9BC,
          ),

          borderRadius:
          BorderRadius.circular(
            14,
          ),
        ),

        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,

              children: [
                Text(
                  data.title,

                  style:
                  const TextStyle(
                    color:
                    Colors.white,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const Icon(
                  Icons
                      .chevron_right,
                  color:
                  Colors.white,
                ),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            Row(
              children: [
                const Icon(
                  Icons
                      .calendar_month,
                  color:
                  Colors.white,
                ),

                const SizedBox(
                  width: 8,
                ),

                Text(
                  data.date,

                  style:
                  const TextStyle(
                    color:
                    Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color:
                  Colors.white,
                ),

                const SizedBox(
                  width: 8,
                ),

                Text(
                  data.time,

                  style:
                  const TextStyle(
                    color:
                    Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            Container(
              padding:
              const EdgeInsets.all(
                10,
              ),

              decoration:
              BoxDecoration(
                color:
                Colors.white,

                borderRadius:
                BorderRadius
                    .circular(
                  12,
                ),
              ),

              child: Row(
                children: [
                  NetworkAvatar(
                    imageUrl:
                    data.doctorAvatar,
                    size: 45,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [
                        Text(
                          data.doctorName,

                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        Text(
                          data
                              .doctorSpecialty,

                          style:
                          const TextStyle(
                            color:
                            Colors.grey,
                            fontSize:
                            11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons
                        .chat_bubble_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}