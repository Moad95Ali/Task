import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskf/api/api.dart';
import 'package:taskf/model/details.dart';
import 'package:taskf/model/fixtime.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  color: Color(0XFF54B534),
                  child: Center(
                    child: Text('Details',
                        style: GoogleFonts.itim(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        )),
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
                      Text(data?.name ?? "",
                          style: GoogleFonts.itim(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                          )),
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
                                Text('Gender',
                                    style: GoogleFonts.itim(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    )),
                                Text(data?.gender ?? "",
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    )),
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
                                Text('Status',
                                    style: GoogleFonts.itim(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    )),
                                Text(data?.status ?? "",
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    )),
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
                                Text('Species',
                                    style: GoogleFonts.itim(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    )),
                                Text(data?.species ?? "",
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    )),
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
                                Text('Date',
                                    style: GoogleFonts.itim(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    )),
                                Text(FixTime.fixTime(data?.created ?? ""),
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    )),
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
                                Text('Location',
                                    style: GoogleFonts.itim(
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    )),
                                Text(data?.location?.name ?? "",
                                    style: GoogleFonts.itim(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.none,
                                    )),
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
