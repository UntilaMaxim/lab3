import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/medical_cubit.dart';
import 'repositories/medical_repository.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => MedicalRepository(),
      child: BlocProvider(
        create: (context) =>
        MedicalCubit(
          context.read<MedicalRepository>(),
        )..loadData(),

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Medical App',

          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFF7F7F7),

            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF159DB6),
            ),
          ),

          home: const HomeScreen(),
        ),
      ),
    );
  }
}