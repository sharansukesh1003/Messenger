import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String message,
    required String email,
  }) async {
    final Timestamp timestamp = Timestamp.now();
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email!;

    List<String> chatId = [currentUserId, email];
    chatId.sort();
    await _fireStore
        .collection('chat')
        .doc(chatId.join("*"))
        .collection('messages')
        .add(
          MessageModel(
            message: message,
            receiverId: email,
            timestamp: timestamp,
            senderId: currentUserId,
            senderEmail: currentUserEmail,
          ).toMap(),
        );
  }

  Stream<QuerySnapshot> getMessages({
    required String currentUserId,
    required String receiverUserId,
  }) {
    List<String> chatId = [currentUserId, receiverUserId];
    chatId.sort();

    return _fireStore
        .collection('chat')
        .doc(chatId.join("*"))
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}

// 3jGaL5V6IGNGCOi9FDkxisYkjUx1*ZrPrUOW0sHeDk2McGinmjHM8dSO2