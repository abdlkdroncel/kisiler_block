import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_block/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_block/ui/cubit/detay_cubit.dart';
import 'package:kisiler_block/ui/cubit/kayit_cubit.dart';
import 'package:kisiler_block/ui/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>KayitCubit()),
        BlocProvider(create: (context)=>DetayCubit()),
        BlocProvider(create: (context)=>AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Anasayfa(),
      ),
    );
  }
}
