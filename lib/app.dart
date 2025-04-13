import 'package:ecommerce_app/bindings/general_bindings.dart';
import 'package:ecommerce_app/features/authentication/bloc/theme/theme_bloc.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return GetMaterialApp(
            themeMode: themeMode,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            initialBinding: GeneralBindings(),
            getPages: AppRoutes.pages,
            home: const Scaffold(
              backgroundColor: TColors.primary,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
