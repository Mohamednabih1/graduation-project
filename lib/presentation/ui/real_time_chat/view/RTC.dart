// ignore_for_file: unused_import, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/video.dart';
import 'package:gradproject/app/global_functions.dart';
import 'package:gradproject/domain/classes/user.dart';
import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/real_time_chat/view_model/RTC_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RTC extends StatelessWidget {
  const RTC({super.key, required this.user});
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RTCViewModel>(
      create: (context) => RTCViewModel(user),
      builder: (context, child) {
        return RTCContent(user: user);
      },
    );
  }
}

class RTCContent extends StatefulWidget {
  const RTCContent({super.key, required this.user});
  final UserData user;

  @override
  State<RTCContent> createState() => _RTCContentState();
}

class _RTCContentState extends State<RTCContent> {
  late final RTCViewModel rTCViewModel;
  bool isUploading = false;
  void _bind(BuildContext context) {
    rTCViewModel = Provider.of<RTCViewModel>(context, listen: false);
    rTCViewModel.start();
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  final TextEditingController msgCtr = TextEditingController();
  Widget getBody(screenWidth, screenHeight) {
    // Permission.camera.request();

    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            border: Border(
                // bottom: BorderSide(width: 1.5, color: backgroundColor),
                ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              getBackButton(
                ctx: context,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                useMargin: false,
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.02),
                child: Header(name: widget.user.username),
                // margin: EdgeInsets.only(top: screenHeight * 0.01),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 224, 221),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Consumer<RTCViewModel>(
              builder: (context, rTCViewModelConsumer, child) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  reverse: true,
                  children: <Widget>[...rTCViewModelConsumer.msgList],
                );
              },
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 221),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // color: Colors.white,
                    child: TextField(
                      controller: msgCtr,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: () {
                    String msg = msgCtr.text;
                    rTCViewModel.sendMessage(msg, false);
                    msgCtr.text = "";
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.photo,
                  ),
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickVideo(source: ImageSource.gallery);
                    if (pickedFile == null) return;
                    isUploading = true;
                    setState(() {});
                    await rTCViewModel.uploadVideo(pickedFile);
                    isUploading = false;
                    setState(() {});
                  },
                ),
                // IconButton(
                //   icon:
                //       const Icon(Icons.sentiment_very_dissatisfied_rounded),
                //   onPressed: () {
                //     String msg = msgCtr.text;
                //     rTCViewModel.sendMessageFromOtherSide(msg);
                //     msgCtr.text = "";
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget loading(screenWidth, screenHeight) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
                // bottom: BorderSide(width: 1.5, color: backgroundColor),
                ),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              getBackButton(
                ctx: context,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                useMargin: false,
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.02),
                child: Header(name: widget.user.username),
                // margin: EdgeInsets.only(top: screenHeight * 0.01),
              ),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: isUploading
            ? loading(screenWidth, screenHeight)
            : getBody(screenWidth, screenHeight),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  final bool isSent;
  final bool isMsgVideo;
  final Timestamp timeSent;

  const MessageWidget(
      {super.key,
      required this.message,
      required this.sender,
      required this.isSent,
      required this.isMsgVideo,
      required this.timeSent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: sender == 'Doctor'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: sender == 'Doctor' ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  isMsgVideo
                      ? OpenYouTubeVideo(
                          videoUrl: message,
                        )
                      : Text(
                          message,
                          style: const TextStyle(color: Colors.white),
                        ),
                  const SizedBox(width: 8.0),
                  Column(
                    children: [
                      // Text("date"),
                      // Text(
                      //     "${timeSent.toDate().month.toString()} :${timeSent.toDate().day.toString()} "
                      //     // visible: isSent,
                      //     // child: const Icon(
                      //     //   Icons.check_circle,
                      //     //   color: Color.fromARGB(255, 59, 38, 38),
                      //     // ),
                      //     ),
                      // Text("time"),
                      Text(
                        " ${timeSent.toDate().hour.toString()} :${timeSent.toDate().minute.toString()} ",
                        style: const TextStyle(color: Colors.white),

                        // visible: isSent,
                        // child: const Icon(
                        //   Icons.check_circle,
                        //   color: Color.fromARGB(255, 59, 38, 38),
                        // ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
