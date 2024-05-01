import 'package:flutter/material.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradproject/presentation/ui/real_time_chat/view/RTC.dart';

class RTCViewModel extends BaseViewModel with ChangeNotifier {
  final String receiverId;
  RTCViewModel(this.receiverId);

  //example of functions
  // void logOut(BuildContext ctx) {
  //   DI.getItInstance<AppCache>().setIsUserLoggedIn(false);
  //   ctx.pushReplacementNamed(RoutesName.splash);
  // }
  final AppCache appPreferences = DI.getItInstance<AppCache>();

  List<MessageWidget> msgList = [
    const MessageWidget(
        isSent: true, message: 'Hello, how can I help you?', sender: 'Doctor'),
    const MessageWidget(
        isSent: true, message: 'I have a fever.', sender: 'Patient'),
    const MessageWidget(
        isSent: true,
        message: 'Please describe your symptoms.',
        sender: 'Doctor'),
    const MessageWidget(
        isSent: true, message: 'I feel weak and dizzy.', sender: 'Patient'),
    const MessageWidget(
        isSent: true,
        message: 'You may need to visit the clinic.',
        sender: 'Doctor')
  ];

  void sendMessage(messageText) {
    int userId = appPreferences.getUserId;
    securePrint('$userId' 'orsaIDz' '$receiverId');
    CollectionReference subCollection = FirebaseFirestore.instance
        .collection('chatRoom')
        .doc("48o3UU050YMHxMh9mt2j")
        .collection('chat');

    if (messageText.isNotEmpty) {
      subCollection.add({
        'msg': messageText,
        'senderId': userId,
        'receiverId': receiverId,
        'timeSent': DateTime.now(),
      });
    }
  }

  void subMessage() async {
    CollectionReference subCollection = FirebaseFirestore.instance
        .collection('chatRoom')
        .doc("48o3UU050YMHxMh9mt2j")
        .collection('chat');

    subCollection.snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          securePrint(change);
          final data = change.doc.data() as Map<String, dynamic>;
          String msg = data['msg'] as String;
          msgList.insert(
              0, MessageWidget(isSent: true, message: msg, sender: 'Doctor'));
        } else if (change.type == DocumentChangeType.modified) {
          // Handle updated data
        } else if (change.type == DocumentChangeType.removed) {
          // Handle deleted data
        }
      }
    });
  }

  void createNewChat() {
    int userId = appPreferences.getUserId;
    int senderToId = 4;
    String msg = "orsa mesa";
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('chatRoom');
    CollectionReference chatRef =
        usersRef.doc('$userId' 'orsaIDz' '$senderToId').collection('chat');

    chatRef.add({
      'msg': msg,
      'senderId': "$userId",
      'receiverId': '$senderToId',
      'timeSent': "${DateTime.now()}",
    });
  }

  void receiveMessage(messageText) {
    if (messageText.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': messageText,
        'timestamp': Timestamp.now(),
      });
    }
  }

  @override
  void start() {
    subMessage();
  }
}
