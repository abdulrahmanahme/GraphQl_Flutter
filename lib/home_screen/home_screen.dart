import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: PersonCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(
              "https://rickandmortyapi.com/api/character/avatar/152.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 2,
        children: [
          Text(
            'Motoy',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            'Motoy',
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
