import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/detailsPage.dart';
import 'package:http/http.dart' as http;

import 'api/api.dart';
import 'model/searchCharacters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<SearchCharacters?> futureSearchCharacters;
  @override
  void initState() {
    super.initState();
    futureSearchCharacters = Api().search(1);
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: futureSearchCharacters,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Container(
                  width: 50, height: 50, child: CircularProgressIndicator()));
        }
        var data = snapshot.data;
        print(snapshot.error);
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
          body: ListView(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Color(0XFF593A5C)),
                        prefixIcon:
                            Icon(Icons.search, color: Color(0XFF593A5C)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 720,
                    child: ListView.builder(
                      itemCount: data?.results?.length,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data?.results?[index].name ?? "",
                                            style: TextStyle(
                                                fontSize: 13,
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
                                builder: (context) => DetailsPage(
                                    id: data?.results?[index].id ?? 0),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
