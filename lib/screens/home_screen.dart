import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appointment_cubit.dart';
import '../cubit/medical_cubit.dart';
import '../cubit/medical_state.dart';

import '../screens/appointment_details_screen.dart';

import '../widgets/appointment_card.dart';
import '../widgets/doctor_card.dart';
import '../widgets/medical_search_bar.dart';
import '../widgets/network_avatar.dart';
import '../widgets/service_card.dart';

class HomeScreen
    extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      body: SafeArea(
        child:
        BlocBuilder<
            MedicalCubit,
            MedicalState>(
          builder:
              (context, state) {
            // LOADING
            if (state
            is MedicalLoading) {
              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            // ERROR
            if (state
            is MedicalError) {
              return Center(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .center,

                  children: [
                    const Icon(
                      Icons
                          .error_outline,
                      size: 60,
                      color:
                      Colors.red,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const Text(
                      'Error',
                      style:
                      TextStyle(
                        fontSize:
                        22,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      state.message,
                      textAlign:
                      TextAlign
                          .center,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<
                            MedicalCubit>()
                            .loadData();
                      },

                      child:
                      const Text(
                        'Retry',
                      ),
                    ),
                  ],
                ),
              );
            }

            // EMPTY
            if (state
            is MedicalEmpty) {
              return Column(
                children: [
                  _buildHeader(
                    context,
                    state.data,
                  ),

                  const Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                        children: [
                          Icon(
                            Icons
                                .search_off,
                            size: 60,
                            color:
                            Colors.grey,
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            'No doctors found',
                            style:
                            TextStyle(
                              fontSize:
                              18,
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state
            is MedicalSuccess) {
              return SingleChildScrollView(
                padding:
                const EdgeInsets.all(
                  20,
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

                  children: [
                    _header(
                      state,
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    MedicalSearchBar(
                      hint: state
                          .data
                          .homeScreen
                          .searchHint,

                      onChanged:
                      context
                          .read<
                          MedicalCubit>()
                          .searchDoctors,

                      onFilterPressed:
                          () {
                        _showFilter(
                          context,
                          state,
                        );
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    AppointmentCard(
                      data: state
                          .data
                          .homeScreen
                          .appointment,

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (_) =>
                                BlocProvider(
                                  create:
                                      (_) =>
                                      AppointmentCubit(
                                        state
                                            .data
                                            .appointmentDetails,
                                      ),

                                  child:
                                  AppointmentDetailsScreen(
                                    data: state
                                        .data
                                        .appointmentDetails,
                                  ),
                                ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                      children: [
                        Text(
                          'Health Services',

                          style:
                          TextStyle(
                            fontSize:
                            18,
                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        Text(
                          'See All',

                          style:
                          TextStyle(
                            color:
                            Color(
                              0xFF159DB6,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      children:
                      state
                          .data
                          .homeScreen
                          .healthServices
                          .map(
                            (
                            service,
                            ) =>
                            Expanded(
                              child:
                              ServiceCard(
                                service:
                                service,
                              ),
                            ),
                      )
                          .toList(),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    const Text(
                      'Nearby Doctor',

                      style:
                      TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    ...state.doctors.map(
                          (doctor) {
                        return Padding(
                          padding:
                          const EdgeInsets
                              .only(
                            bottom: 18,
                          ),

                          child:
                          DoctorCard(
                            doctor:
                            doctor,

                            onFavorite:
                                () {
                              context
                                  .read<
                                  MedicalCubit>()
                                  .toggleFavorite(
                                doctor.id,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _header(
      MedicalSuccess state,
      ) {
    final home =
        state.data.homeScreen;

    return Row(
      mainAxisAlignment:
      MainAxisAlignment
          .spaceBetween,

      children: [
        Row(
          children: [
            NetworkAvatar(
              imageUrl:
              home.user.avatarUrl,
              size: 48,
            ),

            const SizedBox(
              width: 12,
            ),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [
                Text(
                  home.user.greeting,

                  style:
                  const TextStyle(
                    fontSize: 16,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text(
                  home.user.subtitle,

                  style:
                  const TextStyle(
                    fontSize: 11,
                    color:
                    Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),

        Stack(
          children: [
            const Icon(
              Icons
                  .notifications_none,
              size: 30,
            ),

            if (home.hasUnread)
              Positioned(
                right: 1,
                top: 1,

                child: Container(
                  width: 8,
                  height: 8,

                  decoration:
                  const BoxDecoration(
                    color:
                    Colors.red,
                    shape:
                    BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(
      BuildContext context,
      dynamic data,
      ) {
    return Padding(
      padding:
      const EdgeInsets.all(
        20,
      ),

      child:
      MedicalSearchBar(
        hint:
        data.homeScreen
            .searchHint,

        onChanged:
        context
            .read<
            MedicalCubit>()
            .searchDoctors,

        onFilterPressed:
            () {},
      ),
    );
  }

  void _showFilter(
      BuildContext context,
      MedicalSuccess state,
      ) {
    showModalBottomSheet(
      context: context,

      builder: (_) {
        return Padding(
          padding:
          const EdgeInsets.all(
            20,
          ),

          child: Column(
            mainAxisSize:
            MainAxisSize.min,

            children: [
              const Text(
                'Filter & Sort',

                style:
                TextStyle(
                  fontSize: 20,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ListTile(
                title:
                const Text(
                  'All Doctors',
                ),

                onTap: () {
                  context
                      .read<
                      MedicalCubit>()
                      .filterDoctors(
                    'All',
                  );

                  Navigator.pop(
                    context,
                  );
                },
              ),

              ListTile(
                title:
                const Text(
                  'General Practitioner',
                ),

                onTap: () {
                  context
                      .read<
                      MedicalCubit>()
                      .filterDoctors(
                    'General Practitioner',
                  );

                  Navigator.pop(
                    context,
                  );
                },
              ),

              ListTile(
                title:
                const Text(
                  'Dental Specialist',
                ),

                onTap: () {
                  context
                      .read<
                      MedicalCubit>()
                      .filterDoctors(
                    'Dental Specialist',
                  );

                  Navigator.pop(
                    context,
                  );
                },
              ),

              const Divider(),

              ListTile(
                leading:
                const Icon(
                  Icons
                      .sort_by_alpha,
                ),

                title:
                const Text(
                  'Sort A-Z',
                ),

                onTap: () {
                  context
                      .read<
                      MedicalCubit>()
                      .sortDoctors(
                    DoctorSort.az,
                  );

                  Navigator.pop(
                    context,
                  );
                },
              ),

              ListTile(
                leading:
                const Icon(
                  Icons
                      .sort_by_alpha,
                ),

                title:
                const Text(
                  'Sort Z-A',
                ),

                onTap: () {
                  context
                      .read<
                      MedicalCubit>()
                      .sortDoctors(
                    DoctorSort.za,
                  );

                  Navigator.pop(
                    context,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}