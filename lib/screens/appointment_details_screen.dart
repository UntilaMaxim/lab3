import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appointment_cubit.dart';
import '../cubit/appointment_state.dart';
import '../models/app_data.dart';
import '../widgets/network_avatar.dart';
import '../widgets/selectable_slot_card.dart';

class AppointmentDetailsScreen
    extends StatelessWidget {
  final AppointmentDetailsData data;

  const AppointmentDetailsScreen({
    super.key,
    required this.data,
  });

  static const Color mainColor =
  Color(0xFF159DB6);

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      backgroundColor:
      const Color(
        0xFFF7F7F7,
      ),

      body: SafeArea(
        child:
        BlocBuilder<
            AppointmentCubit,
            AppointmentState>(
          builder:
              (context, state) {
            return SingleChildScrollView(
              padding:
              const EdgeInsets
                  .fromLTRB(
                24,
                20,
                24,
                30,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [
                  // HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed:
                            () {
                          Navigator.pop(
                            context,
                          );
                        },

                        icon:
                        const Icon(
                          Icons
                              .arrow_back_ios,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          data.title,

                          textAlign:
                          TextAlign
                              .center,

                          style:
                          const TextStyle(
                            color:
                            mainColor,
                            fontSize:
                            23,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 45,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // DOCTOR
                  Row(
                    children: [
                      NetworkAvatar(
                        imageUrl:
                        data
                            .doctorAvatar,
                        size: 118,
                      ),

                      const SizedBox(
                        width: 18,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                          children: [
                            Text(
                              data
                                  .doctorName,

                              style:
                              const TextStyle(
                                fontSize:
                                20,
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            Text(
                              data
                                  .doctorClinic,

                              style:
                              const TextStyle(
                                color:
                                Color(
                                  0xFF6BB9AF,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 12,
                            ),

                            Row(
                              children: [
                                if (data
                                    .messageEnabled)
                                  contactButton(
                                    Icons
                                        .chat_bubble_outline,
                                  ),

                                const SizedBox(
                                  width: 8,
                                ),

                                if (data
                                    .callEnabled)
                                  contactButton(
                                    Icons
                                        .phone_outlined,
                                  ),

                                const SizedBox(
                                  width: 8,
                                ),

                                if (data
                                    .videoEnabled)
                                  contactButton(
                                    Icons
                                        .videocam_outlined,
                                  ),
                              ],
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            Row(
                              children: [
                                Text(
                                  data
                                      .paymentLabel,

                                  style:
                                  const TextStyle(
                                    fontSize:
                                    16,
                                  ),
                                ),

                                const Spacer(),

                                Text(
                                  data
                                      .paymentFormatted,

                                  style:
                                  const TextStyle(
                                    color:
                                    Color(
                                      0xFF69B7AD,
                                    ),

                                    fontSize:
                                    16,

                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    data.detailsTitle,

                    style:
                    const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    data
                        .detailsDescription,

                    style:
                    const TextStyle(
                      color:
                      Colors.grey,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    data
                        .workingHoursTitle,

                    style:
                    const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: [
                      for (int i = 0;
                      i <
                          data
                              .timeSlots
                              .length;
                      i++) ...[
                        SelectableSlotCard(
                          text:
                          data
                              .timeSlots[i]
                              .label,

                          selected:
                          state
                              .selectedTime ==
                              data
                                  .timeSlots[i]
                                  .id,

                          onTap: () {
                            context
                                .read<
                                AppointmentCubit>()
                                .selectTime(
                              data
                                  .timeSlots[i]
                                  .id,
                            );
                          },
                        ),

                        if (i <
                            data.timeSlots
                                .length -
                                1)
                          const SizedBox(
                            width: 10,
                          ),
                      ],
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    data.dateTitle,

                    style:
                    const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: [
                      for (int i = 0;
                      i <
                          data
                              .dateSlots
                              .length;
                      i++) ...[
                        SelectableSlotCard(
                          text:
                          data
                              .dateSlots[i]
                              .label,

                          selected:
                          state
                              .selectedDate ==
                              data
                                  .dateSlots[i]
                                  .id,

                          onTap: () {
                            context
                                .read<
                                AppointmentCubit>()
                                .selectDate(
                              data
                                  .dateSlots[i]
                                  .id,
                            );
                          },
                        ),

                        if (i <
                            data.dateSlots
                                .length -
                                1)
                          const SizedBox(
                            width: 10,
                          ),
                      ],
                    ],
                  ),

                  const SizedBox(
                    height: 60,
                  ),

                  SizedBox(
                    width:
                    double.infinity,
                    height: 56,

                    child:
                    ElevatedButton(
                      onPressed:
                      data
                          .buttonEnabled
                          ? () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content:
                            Text(
                              'Appointment booked successfully!',
                            ),
                          ),
                        );
                      }
                          : null,

                      style:
                      ElevatedButton
                          .styleFrom(
                        backgroundColor:
                        mainColor,

                        foregroundColor:
                        Colors.white,
                      ),

                      child: Text(
                        data.buttonLabel,

                        style:
                        const TextStyle(
                          fontSize:
                          17,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget contactButton(
      IconData icon,
      ) {
    return Container(
      width: 32,
      height: 32,

      decoration:
      const BoxDecoration(
        color:
        Color(0xFFE4F1F0),
        shape: BoxShape.circle,
      ),

      child: Icon(
        icon,
        size: 17,
      ),
    );
  }
}