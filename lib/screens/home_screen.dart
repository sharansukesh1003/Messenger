// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/models/chat_screen_argments_model.dart';
import 'package:messenger/service/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () async {
              await Authentication.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Messenger',
              style: GoogleFonts.poppins(
                fontSize: 24.0,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ".",
              style: GoogleFonts.poppins(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong',
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .where((doc) =>
                    doc['email'] != FirebaseAuth.instance.currentUser!.email)
                .map<Widget>((doc) => ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/chat',
                        arguments: ChatScreenModel(
                          userId: doc['uid'],
                          email: doc['email'],
                          userName: doc['email'].toString().split('@')[0],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: Text(doc['email'][0].toString().toUpperCase() +
                            doc['email']
                                .toString()
                                .split('@')[1][0]
                                .toUpperCase()),
                      ),
                      title: Text(
                        doc['email'].toString().split('@')[0][0].toUpperCase() +
                            doc['email']
                                .toString()
                                .split('@')[0]
                                .substring(1)
                                .toLowerCase(),
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        doc['email'],
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
