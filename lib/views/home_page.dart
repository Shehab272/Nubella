
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nubella/models/conversation.dart';
import 'package:nubella/routes.dart';

import 'package:nubella/views/widgets/example_widget.dart';

import 'signup_screen.dart';
import 'welcome_screen.dart';
import 'widgets/chat_list_view.dart';


///final TextEditingController controller = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
var size  = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 33, 1.0),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.logout_sharp,color: Color.fromRGBO(99, 137, 241, 1.0)),
                  ),
                  alignment: Alignment.topLeft,
                ),
                ///Logo
                if (!isConversationStarted) ...[
                  // SizedBox(height: 10),

                  SvgPicture.asset(height: 90,color: Color.fromRGBO(220, 129, 78, 1.0),
                      "assets/images/logo.svg"
                  ),
                  // SizedBox(height: 5),
                  Text(
                    "Welcome To \n Nebula",
                    style: textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "How can I help you today?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(99, 137, 241, 1.0)
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.wb_sunny_outlined),
                            const SizedBox(height: 6),
                            Text(
                              "Histroy",
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(height: 40),
                            const ExampleWidget(
                                text:
                                    "“Explain quantum computing in simple terms”"),
                            const ExampleWidget(
                                text:
                                    "“Got any creative ideas for a 10 year old’s birthday?”"),
                            const ExampleWidget(
                                text:
                                    "“How do I make an HTTP request in Javascript?”"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ] else
                  Expanded(
                    child: ChatListView(conversations: conversations),
                  ),
                Container(

                  margin:  EdgeInsetsDirectional.only(
                    bottom: size >500? 50.0:20,
                  ),
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: TextButton(
                    onHover: (value) {
                      setState(() {
                      onHover = value;

                      });
                    },
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.chatView);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: onHover == true? Color.fromRGBO(99, 137, 241, 1.0) :Color.fromRGBO(117, 117, 185, 1.0),

                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(size >500?15.0:5),
                      child:  Text("Ask Now",
                      style: TextStyle(
                        color: Color.fromRGBO(21, 21, 33, 1.0),
                        fontWeight: FontWeight.w700,
                       // color: onHover == true? Color.fromRGBO(75, 90, 161, 1.0) :Colors.purple,
                        fontSize: 20,
                      ),

                      ),
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
