import '../exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthInitial) {
            return _initialBuild(context);
          } else if (state is Authenticated) {
            return const DefaultScreen();
          } else {
            return const AuthScreen();
          }
        });
  }

  Widget _initialBuild(BuildContext context) => Scaffold(
        body: Center(
          child: EntranceFader(
            offset: const Offset(0, 20),
            duration: const Duration(milliseconds: 1500),
            child: SvgPicture.asset(
              AppAssets.splashSVG,
              height: Responsive.screenWidth(context) * 0.35,
            ),
          ),
        ),
      );
}
