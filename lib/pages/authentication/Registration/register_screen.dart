import 'package:e_commerce/pages/authentication/Registration/email_register.dart';
import 'package:e_commerce/pages/authentication/login/login_screen.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                image: AssetImage('assets/background.png'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.2,
                  child: Image(
                    image: AssetImage('assets/tezdaLogo.png'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign Up',
                  style: boldest(primaryWhite),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an account using any platform',
                  style: mediumText(searchGrey),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.065,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.065,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Register()));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryYellow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesomeIcons.mailBulk,
                          color: primaryBlack,
                        ),
                        Text(
                          "Sign using Email & password",
                          style: mediumBold(primaryBlack),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                      child: Text('Login', style: smallBold(primaryYellow)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
