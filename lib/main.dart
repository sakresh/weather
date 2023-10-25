import 'package:weather/export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
    );
  }
}
