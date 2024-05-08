import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nubella/models/conversation.dart';
import 'package:nubella/routes.dart';

import 'package:nubella/views/widgets/example_widget.dart';

import 'widgets/chat_list_view.dart';
import 'widgets/chat_text_field.dart';

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
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Logo
                if (!isConversationStarted) ...[
                  SizedBox(height: 10),
                  Image.asset("assets/images/logo.png"),
                  SizedBox(height: 24),
                  Text(
                    "Welcome To \n Nubella",
                    style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "How can I help you today?",
                    style: textTheme.bodyMedium,
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
                      backgroundColor: onHover == true? Colors.red :Colors.white,

                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(size >500?15.0:5),
                      child:  Text("Ask Now",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: onHover == true? Colors.white :Colors.grey[800],
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
