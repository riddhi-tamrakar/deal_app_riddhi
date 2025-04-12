import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:deal_app/core/utils/route.dart';
import 'package:deal_app/core/utils/theme.dart';
import 'package:deal_app/data/service/api_service.dart';


void main() async {
   ApiService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      child: GetMaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Pet Adoption App',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/', // Define the initial route
        getPages: AppRoutes.pages, // Use the pages defined in AppRoutes
      ),
    );
  }
}
