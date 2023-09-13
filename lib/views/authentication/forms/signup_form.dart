import '../../../exports.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isObscure = true;

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Join Us.',
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
                          'We are so excited to have you! Sign up now to check on our best Pokemons.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w200),
                        ),
                      ),
                      SizedBox(height: Responsive.screenHeight(context) * 0.04),
                      CustomizedTextField(
                        name: 'name',
                        hintText: 'Full Name',
                        prefixIcon: const Icon(Icons.person),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.match(r'[a-zA-Z]',
                              errorText: "Name can only be alphabets!"),
                        ]),
                      ),
                      SizedBox(
                          height: Responsive.screenHeight(context) * 0.015),
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
                      SizedBox(
                          height: Responsive.screenHeight(context) * 0.015),
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
                      SizedBox(height: Responsive.screenHeight(context) * 0.03),
                      CustomizedButton(
                        onPressed: () {},
                        label: 'Sign Up',
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: AppColors.kScaffoldColor,
                      )
                    ],
                  ),
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
                      text: 'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
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
