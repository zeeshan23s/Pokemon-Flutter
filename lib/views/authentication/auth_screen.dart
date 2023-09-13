import '../../exports.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenHeight(context) * 0.04,
              horizontal: Responsive.screenWidth(context) * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Welcome to\n',
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Pokemon Pokedex',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontFamily:
                                  GoogleFonts.rubikDistressed().fontFamily,
                              fontSize:
                                  Responsive.screenHeight(context) * 0.032,
                              letterSpacing:
                                  Responsive.screenWidth(context) * 0.01),
                    )
                  ],
                ),
              ),
              Image.asset(AppAssets.authPageImage),
              Column(
                children: [
                  CustomizedButton(
                      label: 'Create Account',
                      onPressed: () {},
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kScaffoldColor),
                  SizedBox(height: Responsive.screenHeight(context) * 0.025),
                  GestureDetector(
                    onTap: () => CustomizedModelSheets.bottomSheet(
                        context: context, child: const LoginForm()),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.bodySmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kPrimaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
