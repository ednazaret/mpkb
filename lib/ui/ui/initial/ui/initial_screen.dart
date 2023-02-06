import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/favorite/bloc/favorites_cubit.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/splash/ui/splash_screen.dart';
import 'package:satefy_cage/utils/theme/apptheme.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FavoritesCubit(),
          ),
          BlocProvider(
            create: (_) => SearchCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Каркас безопасности',
          theme: AppTheme.main,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
