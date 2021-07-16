import 'package:flutter/material.dart';

class ContractorEmptySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.insert_drive_file_outlined,
            color: Colors.white,
            size: 36,
          ),
          Text(
            'Wyszukiwarka podatników VAT,\naby wyświetlić dane uzupełnij pole.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
