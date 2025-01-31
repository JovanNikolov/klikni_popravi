import 'package:flutter/material.dart';
import 'package:klikni_popravi/models/event.dart';

class NextJobWidget extends StatelessWidget {
  final Event? nextJob;

  const NextJobWidget({
    super.key,
    required this.nextJob,
  });

  @override
  Widget build(BuildContext context) {
    if(nextJob == null){
      return Container(
          height: 180,
          color: Colors.grey.shade400,
          child: const Text("No jobs assigned"),
      );
    }else{
      return Container(
        height: 180,
        color: Colors.grey.shade400,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade400,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Text(
                              nextJob!.title,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                nextJob!.repairType,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address: " + nextJob!.address,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.extended(
                              onPressed: () =>{
                                Navigator.pushNamed(context, '/calendar')
                              },
                              backgroundColor: Colors.blue[100],
                              tooltip: 'See on calendar',
                              label: const Text("See on calendar",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}