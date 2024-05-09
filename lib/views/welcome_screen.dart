import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubella/views/signin_screen.dart';
import 'package:nubella/views/signup_screen.dart';
import 'package:nubella/views/widgets/custom_scaffold.dart';
import 'package:nubella/views/widgets/welcome_button.dart';

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
                  horizontal: 45.0,
                ),
                child: const Column(
                  children: [
                    Text(
                      ' Nebulla AI ',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      ' for your life development ',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(36, 50, 88, 1.0)),
                    ),
                    SizedBox(height: 60,),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500,
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
                SizedBox(
                  height: 65,
                  width: MediaQuery.sizeOf(context).width * 0.2,
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
                  width: MediaQuery.sizeOf(context).width * 0.2,
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
