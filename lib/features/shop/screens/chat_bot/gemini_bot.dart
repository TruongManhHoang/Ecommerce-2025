import 'package:ecommerce_app/features/shop/models/message_model.dart';
import 'package:ecommerce_app/features/shop/screens/chat_bot/widgets/user_prompt_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class GeminiBot extends StatefulWidget {
  const GeminiBot({super.key});

  @override
  State<GeminiBot> createState() => _GeminiBotState();
}

class _GeminiBotState extends State<GeminiBot> {
  TextEditingController proprController = TextEditingController();
  static const apiKey = "AIzaSyCFVPqCE2WC8KGcHuxvwEfHlkjP3X-6Xws";
  final mode = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);

  final bool isPrompt = true;
  final List<MessageModel> promt = [];

  Future<void> sendMessage() async {
    final message = proprController.text;
    setState(() {
      proprController.clear();
      promt.add(MessageModel(
        isPrompt: true,
        message: message,
        time: DateTime.now(),
      ));
    });
    // for respond
    final content = [Content.text(message)];
    final response = await mode.generateContent(content);
    setState(() {
      promt.add(MessageModel(
        isPrompt: false,
        message: response.text ?? "",
        time: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.blue[100],
        title: const Text('AI ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: promt.length,
                  itemBuilder: (context, index) {
                    final message = promt[index];
                    return UserPrompt(
                      message: message.message,
                      isPrompt: message.isPrompt,
                      date: DateFormat('hh:mm a').format(message.time),
                    );
                  })),
          Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: proprController,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Nhập câu hỏi của bạn',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: const CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
