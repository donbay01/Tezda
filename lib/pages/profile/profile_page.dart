import 'package:e_commerce/theme/color.dart';
import 'package:e_commerce/theme/text_style.dart';
import 'package:flutter/material.dart';

import '../../service/auth.dart';
import '../onboarding_screen/onboardScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var user = AuthService.getCurrentUser();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              user!.email!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: scaffoldBlack,
                  title: Text(
                    'Are You sure you want to log out?',
                    style: mediumText(primaryWhite),
                  ),
                  content: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          AuthService.logout();
                          // PurchaseService.logOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnboardingScreen(),
                            ),
                                (route) => false,
                          );
                        },
                        child: Text(
                          'Yes',
                          style: mediumText(primaryYellow),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: mediumText(Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              'Log Out',
              style: medium(),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: primaryYellow),
          )
        ],
      ),
    );
  }
}
