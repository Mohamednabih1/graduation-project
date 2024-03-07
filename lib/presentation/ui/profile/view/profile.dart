import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/app/di.dart';
import 'package:gradproject/data/data_source/local_data_source.dart/permanent_data_source/shared_preferences.dart';
import 'package:gradproject/domain/classes/header/header_function.dart';

import 'package:gradproject/presentation/ui/common/header.dart';
import 'package:gradproject/presentation/ui/common/resources/font_manager.dart';
import 'package:provider/provider.dart';
import 'package:gradproject/presentation/ui/profile/view_model/profile_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
      builder: (context, child) {
        return const ProfileContent();
      },
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  late final ProfileViewModel profileViewModel;
  final AppCache _appPreferences = DI.getItInstance<AppCache>();

  void _bind(BuildContext context) {
    profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.start();
  }

  // AppBar get appBar {
  //   return AppBar(title: const Text("Profile"));
  // }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  // final _formKey = GlobalKey<FormState>();
  Widget myForm() {
    return Form(
      // key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 14),
              ),
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                // }
              },
              child: const Text('Submit Button'),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  List<Widget> infoBody(screenWidth, screenHeight) {
    return [
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'name',
        subText: 'John Doe orsa',
        // fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Email',
        subText: 'orsa@essam.com',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Phone',
        subText: '123-456-7890',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Address',
        subText: '123 Main St, City, Country',
        fun: showSheet,
      ),
      Container(
        margin: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
        alignment: Alignment.centerLeft,
        child: const Text(
          "basic info",
          style: TextStyle(fontWeight: FontWeightConstants.light),
        ),
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Gender',
        subText: 'Male',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Current Weight',
        subText: '70 kg',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Target Weight',
        subText: '65 kg',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Current Weight',
        subText: '70 kg',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Target Weight',
        subText: '89 kd',
        fun: showSheet,
      ),
      MyProfileCard(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        text: 'Height',
        subText: '17 cm',
        fun: showSheet,
      ),
    ];
  }

  showSheet(screenWidth, screenHeight) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: screenHeight * 0.3,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Gender',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: Text("data"), // myForm(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getBody(screenWidth, screenHeight) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(
              name: "Profile",
              myIconsList: [
                HeaderIconsFunctions(
                  icon: const Icon(Icons.logout),
                  iconFunction: () {
                    _appPreferences.setIsUserLoggedIn(false);
                    context.pushReplacementNamed(RoutesName.splash);
                  },
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  minRadius: 20,
                  child: Image.asset(
                    'assets/images/apple.png',
                    // scale: 0.2,
                    height: 200,
                    width: 200,
                  )),
            ),
            ...infoBody(screenWidth, screenHeight),
            TextButton(
              onPressed: () {
                showSheet(screenWidth, screenHeight);
              },
              child: Text(
                "click me",
                style: TextStyle(
                  fontSize: (screenWidth * 0.03),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      body: getBody(screenWidth, screenHeight),
    );
  }
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard(
      {super.key,
      required this.text,
      required this.subText,
      this.fun,
      required this.screenWidth,
      required this.screenHeight});
  final String text;
  final String subText;
  final Function? fun;
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          if (fun != null) {
            fun!(screenWidth, screenHeight);
          }
        },
        child: ListTile(
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          title: Text(text),
          subtitle: Text(subText),
        ),
      ),
    );
  }
}
