import 'package:e_commerce/pages/authentication/Registration/email_register.dart';
import 'package:e_commerce/pages/authentication/login/login_screen.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

import '../../homepage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late W3MService _w3mService;

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

  @override
  void dispose() {
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  child: const Image(
                    image: AssetImage('assets/tezdaLogo.png'),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign Up',
                  style: boldest(primaryWhite),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an account using any platform',
                  style: mediumText(searchGrey),
                ),
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
                SizedBox(
                  height: size.height * 0.065,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Register(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryYellow),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
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
                const SizedBox(
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
