import '../../../exports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
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
                        'Hello Trainer!',
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
                        'Kindly enter your credentials to login.',
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
                    SizedBox(height: Responsive.screenHeight(context) * 0.015),
                    CustomizedTextField(
                      name: 'password',
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        child: Icon(
                          _isObscure
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 20.0,
                        ),
                      ),
                      obscureText: _isObscure,
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: Responsive.screenHeight(context) * 0.01),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        CustomizedModelSheets.bottomSheet(
                            context: context, child: ForgotPasswordForm());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Forgot password? ',
                          style: Theme.of(context).textTheme.bodySmall,
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
                    SizedBox(height: Responsive.screenHeight(context) * 0.03),
                    CustomizedButton(
                      onPressed: () {},
                      label: 'Login',
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
                        context: context, child: const SignUpForm());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
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
