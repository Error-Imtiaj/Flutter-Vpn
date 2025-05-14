import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vpn/app/bindings.dart';
import 'package:vpn/app/theme.dart';
import 'package:vpn/features/home/ui/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      builder: (context, child) {
        return GetMaterialApp(
          theme: VpnTheme().appTheme(),
          initialBinding: MyAppBindings(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
