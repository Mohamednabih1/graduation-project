// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:gradproject/presentation/ui/exercise/view_model/exercise_view_model.dart';
import 'package:provider/provider.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExerciseViewModel>(
      create: (context) => ExerciseViewModel(),
      builder: (context, child) {
        return const ExerciseContent();
      },
    );
  }
}

class ExerciseContent extends StatefulWidget {
  const ExerciseContent({super.key});

  @override
  State<ExerciseContent> createState() => _ExerciseContentState();
}

class _ExerciseContentState extends State<ExerciseContent> {
  late final ExerciseViewModel _exerciseViewModel;

  void _bind(BuildContext context) {
    _exerciseViewModel = Provider.of<ExerciseViewModel>(context, listen: false);
    _exerciseViewModel.start();
  }

  // AppBar get appBar {
  //   return AppBar(
  //     title: const Text("Workout"),
  //     actions: [
  //       Container(
  //         margin: const EdgeInsets.only(right: 10),
  //         child: IconButton(
  //           icon: const Icon(
  //             Icons.logout,
  //             color: Colors.black,
  //           ),
  //           onPressed: () {
  //             _exerciseViewModel.logOut(context);
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget get getBody {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*
            here will be the picture
            */
          SizedBox(
              child: Image.asset(
            'assets/images/OIP.jpeg',
          )),
          const SizedBox(height: 10),
          const Text(
            "  Description ......",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.green,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please select an option :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button(1)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
            child: ListTile(
              leading: Image.asset(
                'assets/images/OIP.jpeg',
              ),
              title: const Text("title"),
              subtitle: const Text("subTitle"),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.green,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please select an option :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button(1)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            // Button(2)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
            child: ListTile(
              leading: Image.asset(
                'assets/images/OIP.jpeg',
              ),
              title: const Text("title"),
              subtitle: const Text("subTitle"),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.green,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please select an option :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button(1)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            // Button(2)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
            child: ListTile(
              leading: Image.asset(
                'assets/images/OIP.jpeg',
              ),
              title: const Text("title"),
              subtitle: const Text("subTitle"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.green,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please select an option :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button(1)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            // Button(2)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
            child: ListTile(
              leading: Image.asset(
                'assets/images/OIP.jpeg',
              ),
              title: const Text("title"),
              subtitle: const Text("subTitle"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.green,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please select an option :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Button(1)
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle back button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExerciseView()),
                                );
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }));
            },
            child: ListTile(
              leading: Image.asset(
                'assets/images/OIP.jpeg',
              ),
              title: const Text("title"),
              subtitle: const Text("subTitle"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar,
      body: getBody,
    );
  }
}
