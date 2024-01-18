import 'package:e_commerce/components/snackbar.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/text_style.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // reset() async {
  //   FocusScope.of(context).unfocus();
  //   var email = emailController.text;
  //
  //   if (email.isEmpty) {
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: 'A valid email is required',
  //     );
  //   }
  //
  //   try {
  //     await ProgressService.show(context);
  //     await AuthService.resetPassword(email: email);
  //     await ProgressService.hide();
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: 'An email has been sent',
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     await ProgressService.hide();
  //     return SnackbarHelper.displayToastMessage(
  //       context: context,
  //       message: e.message!,
  //     );
  //   }
  // }

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Reset Your Password',
                    style: largeText(primaryWhite),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    style: smallText(primaryWhite),
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: mediumText(primaryWhite),
                      hintText: 'Enter your email address',
                      hintStyle: smallText(primaryWhite),
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
                    height: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: primaryYellow),
                      child: Text(
                        'Reset Password',
                        style: mediumBold(primaryBlack),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: primaryYellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Back', style: mediumBold(primaryYellow)),
                      ],
                    ),
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
