import 'package:flutter/material.dart';
import '../models/workshop.dart';

class WorkshopWidget extends StatelessWidget {
  final Workshop workshop;

  const WorkshopWidget({
    super.key,
    required this.workshop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            child: Row(
              children: [
                const SizedBox(width: 40),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(workshop.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                FloatingActionButton.extended(
                    onPressed: () =>print("Hire button pressed"),
                    backgroundColor: Colors.blue[100],
                    tooltip: 'Hire this workshop',
                    label: const Text("Hire", style: TextStyle(color: Colors.black),
                    )
                ),
                const SizedBox(width: 40),
              ],
            ),
           ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade400,
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                                workshop.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.blue[100],
                              alignment: Alignment.center,
                              child: Text(
                                "Available: " + workshop.available,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
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
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blue[100],
                            alignment: Alignment.center,
                            child: Text(
                              "Price score: " + workshop.priceScore.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue[100],
                            alignment: Alignment.center,
                            child: Text(
                              "Rating: " + workshop.rating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
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