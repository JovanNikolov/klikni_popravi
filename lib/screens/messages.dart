import 'package:flutter/material.dart';
import 'package:klikni_popravi/widgets/app_bar_widget.dart';
import '../widgets/back_button_widget.dart';
import '../widgets/hamburger_menu.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(
          imagePath: 'lib/assets/images/messages_logo.png',
          title: 'Messages',
          onMenuPressed: () {},
        ),
      ),
      endDrawer: const HamburgerMenuWidget(),
      body: Container(
        color: Colors.grey.shade400,
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Row(
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                alignment: Alignment.center,
                child: Text(
                  "TODO"
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomBackButton(),
    );
  }
}