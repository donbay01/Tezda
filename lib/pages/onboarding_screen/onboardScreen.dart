import 'package:e_commerce/pages/authentication/Registration/register_screen.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var pages = [
      Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/tezdathree.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: [
                Colors.deepPurple.withOpacity(0.95),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9)
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('A whole new shopping experience',
                          style: boldText(primaryWhite)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Find your style in the virtual reality',
                        style: mediumBold(primaryYellow),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/webtwo.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.deepPurple.withOpacity(0.9)
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Empowering decentralized ecosystems',
                        style: boldText(primaryWhite),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Web 3 technology for seamless transactions and total transparency."',
                        style: mediumBold(primaryYellow),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            onPageChangeCallback: (i) => index = i,
            enableSideReveal: true,
            enableLoop: false,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            pages: pages,
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                height: 200,
                width: 200,
                child: const Image(
                  image: AssetImage('assets/tezdaLogo.png'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: primaryYellow),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Let's Go!",
                  style: mediumBold(primaryBlack),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
