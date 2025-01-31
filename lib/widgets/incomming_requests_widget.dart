import 'package:flutter/material.dart';
import 'package:klikni_popravi/models/event.dart';

class IncommingRequestsWidget extends StatelessWidget {
  final Event? incommingRequest;

  const IncommingRequestsWidget({
    super.key,
    required this.incommingRequest,
  });

  @override
  Widget build(BuildContext context) {
    if(incommingRequest == null){
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
            Container(
              height: 20,
              color: Colors.grey[200],
            ),
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
                              incommingRequest!.title,
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
                                incommingRequest!.repairType,
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
                                "Address: " + incommingRequest!.address,
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
                                print("TODO")
                                // Navigator.pushNamed(context, '/calendar')
                              },
                              backgroundColor: Colors.red[200],
                              tooltip: 'Decline request',
                              label: const Text("Decline",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                          const SizedBox(width: 40),
                          FloatingActionButton.extended(
                              onPressed: () =>{
                                print("TODO")
                                // Navigator.pushNamed(context, '/calendar')
                              },
                              backgroundColor: Colors.blue[100],
                              tooltip: 'Accept request',
                              label: const Text("Accept",
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