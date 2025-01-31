import 'package:flutter/material.dart';
import 'package:klikni_popravi/widgets/back_button_widget.dart';
import '../services/shared_pref.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/hamburger_menu.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final SharedPref _sharedPref = SharedPref.instance;
  TextEditingController addressController = TextEditingController();
  String? address = "Doma";

  @override
  void initState(){
    super.initState();
    getAddress();
  }

  Future<void> getAddress() async {
    setState(() {
      _sharedPref.getAddress().then((value) {
        address = value;
      });
    });
  }

  setAddress() async {
    setState(() {
      address = addressController.text;
      _sharedPref.setAddress(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBarWidget(
          imagePath: 'lib/assets/images/profile_logo.png',
          title: 'Profile',
          onMenuPressed: () {
            print('Hamburger menu pressed');
          },
        ),
      ),
      endDrawer: const HamburgerMenuWidget(),
      body: Container(
        color: Colors.grey.shade400,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(border: OutlineInputBorder(),
                          focusColor: Colors.green, labelText: "Enter Your address", hintText: "Enter address"),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 150,
                      child: FloatingActionButton.extended(
                          onPressed: () =>{
                            setAddress()
                          },
                          backgroundColor: Colors.blue[100],
                          tooltip: 'Accept request',
                          label: const Text("Change address",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Your current address:", style: TextStyle(fontSize: 16,)),
                    const SizedBox(height: 10),
                    Text(address.toString(), style: TextStyle(fontSize: 16,)),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomBackButton(),
    );
  }
}

