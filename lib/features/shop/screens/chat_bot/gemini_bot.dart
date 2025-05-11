import 'package:ecommerce_app/features/shop/models/message_model.dart';
import 'package:ecommerce_app/features/shop/screens/chat_bot/widgets/user_prompt_item.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class GeminiBot extends StatefulWidget {
  const GeminiBot({super.key});

  @override
  State<GeminiBot> createState() => _GeminiBotState();
}

class _GeminiBotState extends State<GeminiBot> {
  TextEditingController proprController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  static const apiKey = "AIzaSyCFVPqCE2WC8KGcHuxvwEfHlkjP3X-6Xws";
  final mode = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);

  final List<MessageModel> promt = [];

  @override
  void initState() {
    super.initState();
    _sendInitialMessage();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendInitialMessage() async {
    const initialText = "Chào bạn! Bạn đang tìm kiếm gì trong ngày hôm nay? 😊";

    setState(() {
      promt.add(MessageModel(
        isPrompt: false,
        message: initialText,
        time: DateTime.now(),
      ));
    });
    _scrollToBottom();
  }

  Future<void> sendMessage() async {
    final message = proprController.text;
    if (message.isEmpty) return;

    setState(() {
      promt.add(MessageModel(
        isPrompt: true, 
        message: message,
        time: DateTime.now(),
      ));
      proprController.clear();
    });
    _scrollToBottom();

    final content = [Content.text(message)];
    final response = await mode.generateContent(content);

    setState(() {
      promt.add(MessageModel(
        isPrompt: false,
        message: response.text ?? "Xin lỗi, tôi chưa hiểu câu hỏi của bạn.",
        time: DateTime.now(),
      ));
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[750],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Iconsax.arrow_left,
                color: Colors.grey,
              )),
        ),
        elevation: 3,
        title: const Text('AI ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: promt.length,
              itemBuilder: (context, index) {
                final message = promt[index];
                return UserPrompt(
                  message: message.message,
                  isPrompt: message.isPrompt,
                  date: DateFormat('hh:mm a').format(message.time),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: proprController,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Enter answer...',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: sendMessage,
                  child: const CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.blue,
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
