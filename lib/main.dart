import 'package:google_fonts/google_fonts.dart';

import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Pokemon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.028,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
          headlineMedium: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.026,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
          headlineSmall: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.022,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
          bodyLarge: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.018,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
          bodyMedium: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.016,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
          bodySmall: TextStyle(
              fontSize: Responsive.screenHeight(context) * 0.014,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: AppColors.kSecondaryColor),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
        useMaterial3: true,
      ),
      home: const DefaultScreen(),
    );
  }
}
