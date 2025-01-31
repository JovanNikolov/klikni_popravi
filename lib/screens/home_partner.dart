import 'package:flutter/material.dart';
import 'package:klikni_popravi/widgets/app_bar_widget.dart';
import 'package:klikni_popravi/widgets/next_job_widget.dart';
import '../models/event.dart';
import "../utils/calendar_utils.dart";
import '../widgets/hamburger_menu_partner.dart';
import '../widgets/incomming_requests_widget.dart';

class HomePartner extends StatefulWidget {
  const HomePartner({super.key});

  @override
  State<HomePartner> createState() => _HomeState();
}

class _HomeState extends State<HomePartner> {
  String? selectedRepairType;
  List<Event> incommingRequests = [];

  @override
  void initState() {
    super.initState();
    Event rq1 = Event("Naso Nasov", DateTime.utc(2025, 2, 20, 12, 30), 42.004775, 21.409854, "Washing machine", "Karposh 10/5");
    Event rq2 = Event("Petar Petrov", DateTime.utc(2025, 2, 25, 9, 30), 42.004775, 21.409854, "Coffee machine", "Centar br.13");
    incommingRequests.add(rq1);
    incommingRequests.add(rq2);
  }

  void removeRequest(Event event){
    //TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(
          imagePath: 'lib/assets/images/logo.png',
          title: 'Repair requests',
          onMenuPressed: () {},
        ),
      ),
      endDrawer: const HamburgerMenuWidgetPartner(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next job",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: NextJobWidget(nextJob: getNextEvent()),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Incomming requests",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: ListView(
                  children: incommingRequests.map((request)=> IncommingRequestsWidget(incommingRequest: request)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}