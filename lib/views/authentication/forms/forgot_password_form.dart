import '../../../exports.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: Responsive.screenHeight(context) * 0.8,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Responsive.screenHeight(context) * 0.04,
                    horizontal: Responsive.screenWidth(context) * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: Responsive.screenHeight(context) * 0.01),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot your password? It\'s okay. We all forgot things sometimes.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(height: Responsive.screenHeight(context) * 0.04),
                    CustomizedTextField(
                      name: 'email',
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ],
                      ),
                    ),
                    SizedBox(height: Responsive.screenHeight(context) * 0.03),
                    CustomizedButton(
                      onPressed: () {},
                      label: 'Submit',
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kScaffoldColor,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    CustomizedModelSheets.bottomSheet(
                      context: context,
                      child: const LoginForm(),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Remember your password? ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Click here',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
