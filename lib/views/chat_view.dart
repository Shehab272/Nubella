import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _chatHistory = [];

  @override
  Widget build(BuildContext context) {
    void getAnswer() async {
      // API
      const url =
          "";
      final uri = Uri.parse(url);
      List<Map<String, String>> msg = [];
      for (var i = 0; i < _chatHistory.length; i++) {
        msg.add({"content": _chatHistory[i]["message"]});
      }

      Map<String, dynamic> request = {
        "prompt": {
          "messages": [msg]
        },
        "temperature": 0.25,
        "candidateCount": 1,
        "topP": 1,
        "topK": 1
      };

      final response = await http.post(uri, body: jsonEncode(request));

      setState(() {
        _chatHistory.add({
          "time": DateTime.now(),
          "message": json.decode(response.body)["candidates"][0]["content"],
          "isSender": false,
        });
      });

      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 21, 33, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(21, 21, 33, 1.0),

        title: const Text(
          "Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            //get max height
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"]
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_chatHistory[index]["isSender"]
                            ? Color.fromRGBO(51, 65, 115, 1.0)
                            : Colors.white),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _chatHistory[index]["message"],
                        style: TextStyle(
                          fontSize: 15,
                          color: _chatHistory[index]["isSender"]
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 5),
            width: MediaQuery.sizeOf(context).width * .9,
            decoration: BoxDecoration(
             color: Color.fromRGBO(30, 31, 33, 1.0),

              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsetsDirectional.only(start: 15.0, top: 20.0),
                suffixIcon: MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (_chatController.text.isNotEmpty) {
                        _chatHistory.add({
                          "time": DateTime.now(),
                          "message": _chatController.text,
                          "isSender": true,
                        });
                        _chatController.clear();
                      }
                    });
                    _scrollController.jumpTo(
                      _scrollController.position.maxScrollExtent,
                    );

                    getAnswer();
                  },
                  shape: const StadiumBorder(),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                hintText: "Type a message",
                border: InputBorder.none,
              ),
              controller: _chatController,
            ),
          )
        ],
      ),
    );
  }
}
