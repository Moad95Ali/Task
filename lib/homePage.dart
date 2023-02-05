import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/detailsPage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE3E3E3),
        appBar: AppBar(
          backgroundColor: const Color(0XFF593A5C),
          title: const Center(
            child: Text(
              'Characters',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                    height: 140,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: CircleAvatar(
                                backgroundColor: Colors.black45,
                                radius: 35,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Species',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 170,
                            ),
                            const Text(
                              '2/5/2010',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailsPage(),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
