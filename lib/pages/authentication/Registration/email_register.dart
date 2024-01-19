import 'package:e_commerce/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../components/snackbar.dart';
import '../../../service/auth.dart';
import '../../../service/progress.dart';
import '../../../theme/text_style.dart';
import '../../homepage.dart';
import '../login/login_screen.dart';

class Register extends StatefulWidget {
  final String? referrerUid;
  final bool referred;

  const Register({
    Key? key,
    this.referrerUid,
    this.referred = false,
  }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var promoCode = TextEditingController();

  bool _obscureText = true;
  bool hasInternet = false;
  bool termsAndCondition = false;

  String? code;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _changeTerms(bool newValue) =>
      setState(() => termsAndCondition = newValue);

  @override
  void initState() {
    super.initState();
    emailController.addListener(onListen);
    userNameController.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.removeListener(onListen);
    userNameController.removeListener(onListen);
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    promoCode.dispose();
    super.dispose();
  }

  void onListen() => setState(() {});

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
                image: AssetImage('assets/background.png'), fit: BoxFit.cover),
          ),
          child: AutofillGroup(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: primaryWhite,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Create an Account',
                      style: boldText(primaryYellow),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fill in the details to create an account',
                      style: smallText(primaryWhite),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: smallText(primaryWhite),
                      controller: userNameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: primaryWhite),
                        hintText: 'Enter your username',
                        hintStyle: smallText(primaryWhite),
                        suffixIcon: userNameController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  userNameController.clear();
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: smallText(primaryWhite),
                      controller: emailController,
                      autofillHints: const [AutofillHints.email],
                      onEditingComplete: () => [
                        // TextInput.finishAutofillContext(),
                        FocusScope.of(context).unfocus(),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(color: primaryWhite),
                        hintText: 'Enter your email address',
                        hintStyle: smallText(Colors.grey),
                        suffixIcon: emailController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                icon: const Icon(Icons.close),
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
                      height: 20,
                    ),
                    TextFormField(
                      style: smallText(primaryWhite),
                      controller: passwordController,
                      obscureText: _obscureText,
                      autofillHints: [AutofillHints.password],
                      onEditingComplete: () => [
                        // TextInput.finishAutofillContext(),
                        FocusScope.of(context).unfocus(),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Password*',
                        hintText: 'xxxxxxxxxx',
                        labelStyle: const TextStyle(color: primaryWhite),
                        hintStyle: smallText(primaryWhite),
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
                      height: 20,
                    ),
                    CheckboxListTile(
                      activeColor: primaryYellow,
                      checkColor: primaryBlack,
                      title: Text(
                        'I accept the Terms and Conditions',
                        style: smallText(primaryWhite),
                      ),
                      value: termsAndCondition,
                      onChanged: (newValue) {
                        setState(() {
                          termsAndCondition = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: mediumBold(primaryBlack),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: smallText(primaryWhite),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: mediumText(primaryYellow),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  register() async {
    var username = userNameController.text;
    var email = emailController.text;
    var password = passwordController.text;

    FocusScope.of(context).unfocus();

    if (userNameController.text.isEmpty) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Kindly Provide your Username",
      );
    } else if (emailController.text.isEmpty) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Kindly Provide an email",
      );
    } else if (passwordController.text.isEmpty) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Kindly Provide a Password",
      );
    } else if (userNameController.text.length < 2) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "please provide a username",
      );
    } else if (!emailController.text.contains("@")) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Enter a valid email address",
      );
    } else if (!emailController.text.contains(".")) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Enter a valid email address",
      );
    } else if (passwordController.text.length < 4) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Your Password is weak",
      );
    } else if (termsAndCondition == false) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: "Accept Terms and Conditions",
      );
    } else {
      try {
        await ProgressService.show(context);
        await AuthService.register(
          email,
          password,
          username,
        );
        // await AuthService.buildProfile();
        await ProgressService.hide();
        SnackbarHelper.displayToastMessage(
          context: context,
          message: 'Account created',
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
      } catch (e) {
        print(e);
        var err = e as dynamic;
        await ProgressService.hide();
        return SnackbarHelper.displayToastMessage(
          context: context,
          message: err.message,
        );
      }
    }
  }
}
