import 'package:contractor_gov/pages/contractor/contractor_search_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContractorSearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
