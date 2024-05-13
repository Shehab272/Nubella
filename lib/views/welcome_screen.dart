import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nubella/views/signin_screen.dart';
import 'package:nubella/views/signup_screen.dart';
import 'package:nubella/views/widgets/custom_scaffold.dart';
import 'package:nubella/views/widgets/welcome_button.dart';

import '../theme/gradient.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 60.0,
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      ' Nebula AI ',
                      style: TextStyle(
                        fontSize: 60,

                        fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(157, 54, 21, 1.0),


                      ),
                    ),
                    //Harness the Nebula s Wisdom with Our AI System.
                    Text(
                      ' Beyond the Stars,at Your Service ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(211, 218, 206, 1.0),
                      ),
                    ),
                    Text(
                      ' Harness the Nebula s Wisdom with Our AI System.',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(211, 218, 206, 1.0),
                      ),
                    ),
                    SizedBox(height: 80,),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox (
                  height: 65,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: WelcomeButton(
                    buttonText: 'Sign in',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ));
                    },
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: WelcomeButton(
                    buttonText: 'Sign Up',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ));
                    },
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
