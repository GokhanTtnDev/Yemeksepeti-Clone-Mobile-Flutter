import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_colors.dart';
import 'presentation/layout/main_layout.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const YemeksepetiClone());
}

class YemeksepetiClone extends StatelessWidget {
  const YemeksepetiClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemeksepeti Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryRed,
        fontFamily: 'Roboto',
        platform: TargetPlatform.iOS,
      ),
      home: const MainLayout(),
    );
  }
}