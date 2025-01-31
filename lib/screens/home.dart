import 'package:flutter/material.dart';
import 'package:klikni_popravi/models/workshop.dart';
import 'package:klikni_popravi/widgets/app_bar_widget.dart';
import 'package:klikni_popravi/widgets/workshop_widget.dart';
import '../widgets/dropdown_filter.dart';
import '../widgets/hamburger_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedRepairType;
  List<Workshop> workshopList = [];
  List<Workshop> filteredWorkshops = [];


  @override
  void initState() {
    super.initState();
    Workshop ws1 = Workshop("lib/assets/images/handyman_logo.png", "Handyman workshop", 3, 5, "today", ["handyman", "electric"]);
    Workshop ws2 = Workshop("lib/assets/images/logo.png", "Elektrik Works", 1, 4, "today", ["electric"]);
    Workshop ws3 = Workshop("lib/assets/images/profile_logo.png", "HouseMajstor", 5, 3, "today", ["handyman", "electric", "technician", "plumber"]);
    Workshop ws4 = Workshop("lib/assets/images/handyman_logo.png", "Pero Plumbing", 2, 2, "today", ["handyman", "electric"]);
    workshopList.add(ws1);
    workshopList.add(ws2);
    workshopList.add(ws3);
    workshopList.add(ws4);
    filteredWorkshops = workshopList;
  }

  void filterWorkshopsByRepairType(String? repairType) {
    setState(() {
      selectedRepairType = repairType;
      if(selectedRepairType?.toLowerCase() == "all"){
        filteredWorkshops = workshopList;
      }else{
        filteredWorkshops = workshopList
            .where((ws) => ws.repairs.contains(repairType?.toLowerCase()))
            .toList();
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: AppBarWidget(
        imagePath: 'lib/assets/images/logo.png',
        title: 'Home',
        onMenuPressed: () {},
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
                  Expanded(
                    flex: 1,
                    child: DropdownFilter(
                      onSelected: (value){
                        filterWorkshopsByRepairType(value);
                      },
                    ),
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
                child: ListView(
                  children: filteredWorkshops.map((workshop)=> WorkshopWidget(workshop: workshop)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}