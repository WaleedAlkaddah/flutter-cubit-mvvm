import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_projects_cubit/view/loading_view.dart';
import 'package:my_projects_cubit/viewModel/login_view_model.dart';
import 'package:my_projects_cubit/viewModel/verify_view_model.dart';
import 'package:toastification/toastification.dart';

void main() {
  /*
  runApp(DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) {
        return const MyApp();
      }));
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412.0, 870.0),
        //MediaQuery.of(context).size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: ToastificationWrapper(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    //lazy: true,
                    create: (context) => LoginViewModel(),
                  ),
                  BlocProvider(
                      //lazy: true,
                      create: (context) => VerifyViewModel())
                ],
                child: const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: LoadingView(),
                ),
              ),
            ),
          );
        });
  }
}
