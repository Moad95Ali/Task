import 'package:flutter/material.dart';
import 'package:taskf/detailsPage.dart';
import 'model/fixtime.dart';
import 'model/searchCharacters.dart';

class CharatersListResultWidget extends StatelessWidget {
  const CharatersListResultWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final SearchCharacters data;

  @override
  Widget build(BuildContext context) {
    return data.results!.isEmpty
        ? Center(child: Text("No result"))
        : Container(
            child: ListView.builder(
              itemCount: data.results?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                      height: 140,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      data.results?[index].image ?? ""),
                                  radius: 35,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.results?[index].name ?? "",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    data?.results?[index].gender ?? "",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    data.results?[index].status ?? "",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    data.results?[index].species ?? "",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Text(
                                FixTime.fixTime(
                                    data.results?[index].created ?? ""),
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
                        builder: (context) =>
                            DetailsPage(id: data.results?[index].id ?? 0),
                      ),
                    );
                  },
                );
              },
            ),
          );
  }
}
