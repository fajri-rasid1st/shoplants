import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/data/utils/user_preferences.dart';
import 'package:shoplants/ui/screens/main_screen.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  late String _email;
  late String _name;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    _emailController.addListener(() => setState(() {}));
    _nameController.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();

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
                  bottom: -32,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              buildTextSpan(
                                text: "Hello, ",
                                color: primaryTextColor,
                              ),
                              buildTextSpan(
                                text: "There!",
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Please fill in the following form to continue.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    buildEmailField(),
                    const SizedBox(height: 20),
                    buildNameField(),
                    const SizedBox(height: 20),
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

  TextSpan buildTextSpan({required String text, required Color color}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Email",
        labelStyle: TextStyle(color: secondaryTextColor),
        floatingLabelStyle: TextStyle(color: primaryColor),
        prefixIcon: const Icon(Icons.email_outlined),
        suffixIcon: _emailController.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () => _emailController.clear(),
                icon: const Icon(Icons.close),
              ),
      ),
      validator: (value) {
        final regExp = RegExp(
          r"[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+",
        );

        if (!regExp.hasMatch(value!)) return "Please enter a valid email.";

        return null;
      },
      onSaved: (value) => setState(() => _email = value!),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      controller: _nameController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Name",
        labelStyle: TextStyle(color: secondaryTextColor),
        floatingLabelStyle: TextStyle(color: primaryColor),
        prefixIcon: const Icon(Icons.person_outlined),
        suffixIcon: _nameController.text.isEmpty
            ? const SizedBox()
            : IconButton(
                onPressed: () => _nameController.clear(),
                icon: const Icon(Icons.close),
              ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) return "Field cannot be empty.";

        return null;
      },
      onSaved: (value) => setState(() => _name = value!),
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () async {
        // remove the focus of keybooard
        FocusScope.of(context).unfocus();

        if (_formKey.currentState!.validate()) {
          // save form field
          _formKey.currentState!.save();

          // initialize new user object
          final user = User(
            id: Const.userId,
            email: _email,
            name: _name,
            imagePath: Const.profilePath,
          );

          // obtain shared preferences
          final prefs = await SharedPreferences.getInstance();

          Future.wait([
            // set login to true
            prefs.setBool("isLogin", true),
            // set user
            UserPreferences.setUser(user),
          ]).then((_) {
            // navigate and replace this screen with main screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => MainScreen(user: user)),
              ),
            );
          });
        }
      },
      child: const Icon(Icons.arrow_forward_rounded),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: const CircleBorder(),
      ),
    );
  }
}
