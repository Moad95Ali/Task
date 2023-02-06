import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/detailsPage.dart';
import 'package:http/http.dart' as http;

import 'api/api.dart';
import 'characters_list_result.dart';
import 'model/character.dart';
import 'model/fixtime.dart';
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
    futureSearchCharacters = Api().search();
  }

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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TextField(
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                setState(() {
                  futureSearchCharacters = Api().search(name: value);
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Color(0XFF593A5C)),
                prefixIcon: Icon(Icons.search, color: Color(0XFF593A5C)),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: FutureBuilder(
            future: futureSearchCharacters,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError && snapshot.data == null) {
                return Text(snapshot.error.toString());
              }
              final data = snapshot.data!;
              return CharatersListResultWidget(data: data);
            },
          ))
        ],
      ),
    );
  }
}
