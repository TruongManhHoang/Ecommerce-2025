import 'package:ecommerce_app/features/shop/models/message_model.dart';
import 'package:ecommerce_app/features/shop/screens/chat_bot/widgets/user_prompt_item.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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
    _sendInitialMessage(); // Chatbot gửi tin nhắn đầu tiên
  }

  /// Hàm tự động cuộn đến cuối danh sách sau khi frame được render
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
        isPrompt: false, // Đây là tin nhắn của chatbot
        message: initialText,
        time: DateTime.now(),
      ));
    });
    _scrollToBottom();
  }

  Future<void> sendMessage() async {
    final message = proprController.text;
    if (message.isEmpty) return; // Không gửi tin nhắn rỗng

    setState(() {
      promt.add(MessageModel(
        isPrompt: true, // Đây là tin nhắn của người dùng
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
        isPrompt: false, // Đây là tin nhắn của chatbot
        message: response.text ?? "Xin lỗi, tôi chưa hiểu câu hỏi của bạn.",
        time: DateTime.now(),
      ));
    });
    _scrollToBottom();
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
                      hintText: 'Nhập câu trả lời...',
                      hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 18),
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
