import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.image,
    required this.name,
    required this.type,
  });
  final String image;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(
             image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 2,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            type,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}
