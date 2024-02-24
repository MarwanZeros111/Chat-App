import 'package:chat_app/Screens/chat_bubble.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  final ScrollController _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('Created', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Color(0xff2B475E),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assest/images/scholar.png',
                          height: 60,
                        ),
                        const Text(
                          'Chat',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )
                      ]),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messageList.length,
                          itemBuilder: (context, index) {
                            return messageList[index].id == email
                                ? ChatBubble(
                                    message: messageList[index],
                                  )
                                : ChatBubbleFriend(message: messageList[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({
                            'message': data,
                            'Created': DateTime.now(),
                            'id': email
                          });
                          controller.clear();
                          _controller.animateTo(
                            0,
                            curve: Curves.easeOut,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        decoration: InputDecoration(
                            hintText: 'Send Message',
                            suffixIcon: Icon(
                              Icons.send,
                              color: Color(0xff2B475E),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    )
                  ],
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
