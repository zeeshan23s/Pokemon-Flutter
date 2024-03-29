import '../../exports.dart';

class CustomizedTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomizedTextField(
      {super.key,
      required this.name,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: FormBuilderTextField(
        textInputAction: TextInputAction.next,
        validator: validator,
        name: name,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.kScaffoldColor),
        cursorColor: AppColors.kPrimaryColor,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(letterSpacing: 1, color: AppColors.kScaffoldColor),
          fillColor: Colors.grey[200],
          filled: true,
          enabledBorder: AppTextFieldConstants.kEnableBorder,
          focusedBorder: AppTextFieldConstants.kFocuseBorder,
          errorBorder: AppTextFieldConstants.kErrorOutlineBorder,
          focusedErrorBorder: AppTextFieldConstants.kErrorOutlineBorder,
        ),
      ),
    );
  }
}
