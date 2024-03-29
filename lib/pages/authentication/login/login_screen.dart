import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import '../../../components/snackbar.dart';
import '../../../service/auth.dart';
import '../../../service/progress.dart';
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
  late W3MService _w3mService;

  bool _obscureText = true;
  bool termsAndCondition = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    _w3mService = W3MService(
      projectId: '496ab5c52369695e23b3d534fc66a1aa',
      metadata: const PairingMetadata(
        name: 'Tezda',
        description: 'Tezda e-commerce app',
        url: 'https://www.sam-dev.vercel.app',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
        redirect: Redirect(
          native: 'flutterdapp://',
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    _w3mService.init();

    super.initState();
  }

  login() async {
    var email = emailController.text;
    var password = passwordController.text;
    FocusScope.of(context).unfocus();

    if (email.isEmpty) {
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: 'You need to enter your email',
      );
    }

    if (password.isEmpty) {
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: 'You need to enter your password',
      );
    }

    try {
      await ProgressService.show(context);
      await AuthService.login(
        email,
        password,
      );
      await ProgressService.hide();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      var message = e.message;
      if (e.code == 'invalid-credential') {
        message = 'An error occured. Cross check your email and password';
      }

      await ProgressService.hide();
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: message!,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _w3mService.dispose();
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
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
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: mediumBold(primaryBlack),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: Text('OR',style: smallBold(primaryWhite),)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: size.height * 0.065,
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await _w3mService.openModal(context);
                          var token = await AuthService.getCustomToken(
                            _w3mService.session!.address!,
                          );
                          await AuthService.signInCustom(
                            token,
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const HomePage(),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 35,
                              width: 35,
                              child: Image(
                                image: AssetImage('assets/mask.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Continue with Meta Mask",
                              style: mediumBold(primaryBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
