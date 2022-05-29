import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Text(
          'Chat room',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: theme.primaryColor, width: 2))),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Write your message here...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
