import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/api/api.dart';
import 'package:taskf/model/details.dart';

import 'model/details.dart';
import 'model/location.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  const DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<DetailsApi?> futureDetailsApi;

  @override
  void initState() {
    super.initState();
    futureDetailsApi = Api().details(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureDetailsApi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
                width: 50, height: 50, child: CircularProgressIndicator()),
          );
        }

        var data = snapshot.data;
        return SafeArea(
          child: Container(
            color: Color(0xFFE3E3E3),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  color: Color(0XFF593A5C),
                  child: const Center(
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black12,
                          radius: 75,
                          child: CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(data?.image ?? "")),
                        ),
                      ),
                      Text(
                        data?.name ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 490,
                  child: ListView(
                    children: [
                      Container(
                          height: 100,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  data?.gender ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 100,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  data?.status ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 100,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Species',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  data?.species ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 100,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  data?.created ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 100,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  data?.location?.name ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
