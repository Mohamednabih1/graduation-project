import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/real_time_chat/view_model/RTC_model.dart';
import 'package:provider/provider.dart';

class RTC extends StatelessWidget {
  const RTC({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RTCViewModel>(
      create: (context) => RTCViewModel(userId),
      builder: (context, child) {
        return const RTCContent();
      },
    );
  }
}

class RTCContent extends StatefulWidget {
  const RTCContent({super.key});

  @override
  State<RTCContent> createState() => _RTCContentState();
}

class _RTCContentState extends State<RTCContent> {
  late final RTCViewModel rTCViewModel;

  void _bind(BuildContext context) {
    rTCViewModel = Provider.of<RTCViewModel>(context, listen: false);
    rTCViewModel.start();
  }

  AppBar get appBar {
    return AppBar(title: const Text("RTC"));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  final TextEditingController msgCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mohamed Nabih'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              reverse: true,
              children: <Widget>[...rTCViewModel.msgList],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: msgCtr,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String msg = msgCtr.text;
                    rTCViewModel.sendMessage(msg);
                    msgCtr.text = "";
                  },
                ),
                // IconButton(
                //   icon: const Icon(Icons.ac_unit_outlined),
                //   onPressed: () {},
                // ),
                // IconButton(
                //   icon: const Icon(Icons.read_more),
                //   onPressed: () {
                //     rTCViewModel.createNewChat();
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  final bool isSent;

  const MessageWidget(
      {super.key,
      required this.message,
      required this.sender,
      required this.isSent});

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
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8.0),
                  Visibility(
                    visible: isSent,
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
