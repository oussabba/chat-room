import 'dart:developer';

import 'package:chatapp/Core/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final _auth = FirebaseAuth.instance;
  late User currentUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        currentUser = user;
        log(currentUser.email.toString());
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

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
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
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
