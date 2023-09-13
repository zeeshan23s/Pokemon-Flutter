import 'exports.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFFF7BA15);
  static const kSecondaryColor = Color(0xFFFEFEFE);

  static const kScaffoldColor = Color(0xFF171A23);
}

class AppAssets {
  static const splashSVG = 'assets/pokeball.svg';

  static const authPageImage = 'assets/images/auth-screen-image.png';
}

class AppTextFieldConstants {
  static final kEnableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  );

  static final kFocuseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: AppColors.kPrimaryColor,
    ),
  );

  static final kErrorOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );
}
