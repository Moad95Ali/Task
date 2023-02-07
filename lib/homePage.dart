import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskf/detailsPage.dart';
import 'package:http/http.dart' as http;
  

import 'api/api.dart';
import 'characters_list_result.dart';
import 'model/character.dart';
import 'model/fixtime.dart';
import 'model/searchCharacters.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _pageSize = 20;

  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: 0);

  late Future<SearchCharacters?> futureSearchCharacters;
  @override
  void initState() {
    futureSearchCharacters = Api().search();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await Api().search(page: pageKey);
      bool isLastPage = (newItems.info?.pages ?? 0) < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.results ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems.results ?? [], nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      appBar: AppBar(
        backgroundColor: const Color(0XFF54B534),
        title: Center(
          child: Text('Characters',
              style:
                  GoogleFonts.itim(fontSize: 30, fontWeight: FontWeight.w400)),
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

              return PagedListView<int, Character>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Character>(
                  itemBuilder: (context, item, index) {
                    return CharatersListResultWidget(
                      data: item,
                    );
                  },
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
