import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;

  late String usernameOrEmail;
  late String password;

  final formKey = GlobalKey<FormState>();
  final usernameOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    usernameOrEmailController.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    usernameOrEmailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              clipBehavior: Clip.none,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/svg/pattern.svg",
                  alignment: Alignment.topLeft,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: -40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              buildTextSpan("Sign ", primaryTextColor),
                              buildTextSpan("In", primaryColor),
                            ],
                          ),
                        ),
                        const Text(
                          'Welcome there, login with your account first.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                left: 24,
                top: 64,
                right: 24,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    buildUsernameOrEmailField(),
                    const SizedBox(height: 16),
                    buildPasswordField(),
                    const SizedBox(height: 16),
                    buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan buildTextSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  TextFormField buildUsernameOrEmailField() {
    return TextFormField(
      controller: usernameOrEmailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Username",
        labelStyle: TextStyle(color: secondaryTextColor),
        floatingLabelStyle: TextStyle(color: primaryColor),
        prefixIcon: const Icon(Icons.person_outline_rounded),
        suffixIcon: usernameOrEmailController.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () => usernameOrEmailController.clear(),
                icon: const Icon(Icons.close),
              ),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        setState(() {
          usernameOrEmail = value ?? '';
        });
      },
      validator: validator,
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Password",
        labelStyle: TextStyle(color: secondaryTextColor),
        floatingLabelStyle: TextStyle(color: primaryColor),
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: isPasswordVisible
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined),
        ),
      ),
      obscureText: isPasswordVisible,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        setState(() {
          password = value ?? '';
        });
      },
      validator: validator,
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        final isFormValid = formKey.currentState!.validate();

        if (isFormValid) {
          formKey.currentState!.save();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$usernameOrEmail \n $password')),
          );
        }
      },
      child: const Icon(Icons.arrow_forward_rounded),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }

  String? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field cannot be empty";
    }

    return null;
  }
}
