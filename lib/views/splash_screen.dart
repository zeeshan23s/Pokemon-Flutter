import '../exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _initialBuild(context),
      ),
    );
  }

  Widget _initialBuild(BuildContext context) => EntranceFader(
        offset: const Offset(0, 20),
        duration: const Duration(milliseconds: 1500),
        child: SvgPicture.asset(
          AppAssets.splashSVG,
          height: Responsive.screenWidth(context) * 0.35,
        ),
      );
}
