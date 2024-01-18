import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/text_style.dart';
import '../Registration/email_register.dart';
import '../forgot_password/forgot_password.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool termsAndCondition = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // login() async {
  //   var email = emailController.text;
  //   var password = passwordController.text;
  //   FocusScope.of(context).unfocus();
  //
  //   if (email.isEmpty) {
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: 'You need to enter your email',
  //     );
  //   }
  //
  //   if (password.isEmpty) {
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: 'You need to enter your password',
  //     );
  //   }
  //
  //   try {
  //     await ProgressService.show(context);
  //     await AuthService.signIn(
  //       email: email,
  //       password: password,
  //     );
  //     await ProgressService.hide();
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (ctx) => const HomePage(),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     var message = e.message;
  //     if (e.code == 'user-not-found') {
  //       message = 'Account not found';
  //     }
  //
  //     await ProgressService.hide();
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: message!,
  //     );
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/background.png'
              ),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 6,
                  ),
                  Text(
                    'Login',
                    style: boldText(primaryYellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Securely log into your account',
                    style: smallText(primaryWhite),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: smallText(primaryWhite),
                    controller: emailController,
                    autofillHints: const [AutofillHints.email],
                    onEditingComplete: () => [
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      hintStyle: smallText(primaryWhite),
                      labelStyle: const TextStyle(color: primaryWhite),
                      suffixIcon: emailController.text.isEmpty
                          ? Container(
                        width: 0,
                      )
                          : IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          emailController.clear();
                        },
                      ),
                      filled: true,
                      fillColor: cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryYellow,
                          width: 1.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    style: smallText(primaryWhite),
                    controller: passwordController,
                    obscureText: _obscureText,
                    autofillHints: const [AutofillHints.password],
                    onEditingComplete: () => [
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Password*',
                      hintText: 'xxxxxxxxxx',
                      hintStyle: smallText(primaryWhite),
                      labelStyle: const TextStyle(color: primaryWhite),
                      filled: true,
                      fillColor: cardColor,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _toggle();
                        },
                        icon: _obscureText
                            ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.grey,
                          size: 15,
                        )
                            : const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryYellow,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: smallText(primaryYellow),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: mediumBold(primaryBlack),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: smallText(primaryWhite),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Register(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: mediumText(primaryYellow),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
