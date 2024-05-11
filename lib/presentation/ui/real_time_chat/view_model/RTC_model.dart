// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/data/shared_preferences.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/domain/managers/fireBase/fireBase.dart';
import 'package:gradproject/presentation/ui/common/base/base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradproject/presentation/ui/common/toast/toast_manager.dart';
import 'package:gradproject/presentation/ui/real_time_chat/view/RTC.dart';
import 'package:image_picker/image_picker.dart';

class RTCViewModel extends BaseViewModel with ChangeNotifier {
  final UserData receiverData;
  RTCViewModel(this.receiverData);

  //example of functions
  // void logOut(BuildContext ctx) {
  //   DI.getItInstance<AppCache>().setIsUserLoggedIn(false);
  //   ctx.pushReplacementNamed(RoutesName.splash);
  // }
  final AppCache appPreferences = DI.getItInstance<AppCache>();
  late String userId;
  late final String chatId;
  List<MessageWidget> msgList = [];

// ...

  Future<void> uploadVideo(XFile pickedFile) async {
    // Pick a video file from the user's device

    FireBaseManger fireBaseManger = DI.getItInstance<FireBaseManger>();
    String? fileUrl = await fireBaseManger.uploadVideo(pickedFile);
    if (fileUrl.isNotEmpty) {
      ToastManager.showTextToast("uploaded successfully");
      sendMessage(fileUrl, true);
    }
  }

  void sendMessage(messageText, bool isMsgVideo) {
    CollectionReference subCollection = FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(chatId)
        .collection('chat');
    if (isMsgVideo) {
      subCollection.add({
        'msg': messageText,
        'senderId': userId,
        'receiverData': receiverData.id,
        'timeSent': DateTime.now(),
        'isMsgVideo': true,
      });
      notifyListeners();
      return;
    }
    if (messageText.isNotEmpty) {
      subCollection.add({
        'msg': messageText,
        'senderId': userId,
        'receiverData': receiverData.id,
        'timeSent': DateTime.now(),
        'isMsgVideo': false,
      });
    }
    notifyListeners();
    return;
  }

  // void sendMessageFromOtherSide(messageText) {
  //   CollectionReference subCollection = FirebaseFirestore.instance
  //       .collection('chatRoom')
  //       .doc(chatId)
  //       .collection('chat');

  //   if (messageText.isNotEmpty) {
  //     subCollection.add({
  //       'msg': messageText,
  //       'senderId': receiverData.id,
  //       'receiverData': userId,
  //       'timeSent': DateTime.now(),
  //     });
  //   }
  //   notifyListeners();
  // }

  void subMessage() async {
    CollectionReference subCollection = FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(chatId)
        .collection('chat');

    subCollection.snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          securePrint(change);
          final data = change.doc.data() as Map<String, dynamic>;
          String msg = data['msg'] as String;
          Timestamp sentTime = data['timeSent'] as Timestamp;
          String recID = "${data['receiverData']}";
          if (recID == userId) {
            if (data['isMsgVideo'] == true) {
              msgList.insert(
                  0,
                  MessageWidget(
                    isSent: true,
                    message: msg,
                    sender: 'Doctor',
                    isMsgVideo: true,
                    timeSent: sentTime,
                  ));
            } else {
              msgList.insert(
                  0,
                  MessageWidget(
                      isSent: true,
                      message: msg,
                      sender: 'Doctor',
                      timeSent: sentTime,
                      isMsgVideo: false));
            }
          } else {
            if (data['isMsgVideo'] == true) {
              msgList.insert(
                  0,
                  MessageWidget(
                    isSent: true,
                    message: msg,
                    sender: 'Patient',
                    timeSent: sentTime,
                    isMsgVideo: true,
                  ));
            } else {
              msgList.insert(
                  0,
                  MessageWidget(
                      isSent: true,
                      message: msg,
                      sender: 'Patient',
                      timeSent: sentTime,
                      isMsgVideo: false));
            }
          }
          notifyListeners();
        } else if (change.type == DocumentChangeType.modified) {
        } else if (change.type == DocumentChangeType.removed) {}
      }
    });
  }

  // void createNewChat() {
  //   String userId = appPreferences.getUserId;
  //   int senderToId = 4;
  //   String msg = "orsa mesa";
  //   CollectionReference usersRef =
  //       FirebaseFirestore.instance.collection('chatRoom');
  //   CollectionReference chatRef =
  //       usersRef.doc('$userId' 'orsaIDz' '$senderToId').collection('chat');

  //   chatRef.add({
  //     'msg': msg,
  //     'senderId': "$userId",
  //     'receiverData': '$senderToId',
  //     'timeSent': "${DateTime.now()}",
  //   });
  // }

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
    userId = appPreferences.getUserId;
    chatId = sortID(userId, receiverData.id);
    securePrint(chatId);
    subMessage();
  }
}
