import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satefy_cage/services/kb_data.dart';
import 'package:satefy_cage/ui/ui/initial/bloc/init_services_cubit.dart';
import 'package:satefy_cage/ui/ui/splash/uikit/splash_body.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final InitServicesCubit cubit = InitServicesCubit();

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: SplashBody(),
    );
  }

  void _initialize() {
    KBData.getPassports().then((value) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        cubit.changeScreenState(newState: ScreenState.ready, context: context);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      });
    });
  }
}
