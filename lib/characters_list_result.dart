import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:taskf/detailsPage.dart';
import 'package:taskf/model/character.dart';

import 'model/fixtime.dart';
import 'model/searchCharacters.dart';

class CharatersListResultWidget extends StatelessWidget {
  CharatersListResultWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Character data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 140,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [ImageWidget(data: data), InfoWidget(data: data)],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: DateWidget(data: data),
                  )
                ],
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(id: data.id ?? 0),
          ),
        );
      },
    );
    ;
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Character data;

  @override
  Widget build(BuildContext context) {
    return Text(
      FixTime.fixTime(data.created ?? ""),
      style: TextStyle(
          fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w400),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Character data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name ?? "",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        Text(
          data?.gender ?? "",
          style: TextStyle(
              fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
        Text(
          data.status ?? "",
          style: TextStyle(
              fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
        Text(
          data.species ?? "",
          style: TextStyle(
              fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Character data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: CircleAvatar(
        backgroundColor: Color(0XFF54B534),
        backgroundImage: NetworkImage(data.image ?? ""),
        radius: 35,
      ),
    );
  }
}
