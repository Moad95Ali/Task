import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/api/api.dart';
import 'package:taskf/model/details.dart';

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
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzXDw0HLtnj9nLbhAK6zRD8ioLS3wqacr_EuN8knea&s'),
                          ),
                        ),
                      ),
                      Text(
                        data?.name ?? "",
                        style: TextStyle(color: Colors.black, fontSize: 24),
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
                              children: const [
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'Male',
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
                              children: const [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'Single',
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
                              children: const [
                                Text(
                                  'Species',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'Depeloper',
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
                              children: const [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  '2/10/201',
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
                              children: const [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Text(
                                  'US,FOL',
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
