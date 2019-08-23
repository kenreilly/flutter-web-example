import 'package:flutter_web/material.dart';
import 'home.dart';

class FlutterWebDemo extends StatelessWidget {

	@override
	Widget build(BuildContext context) {

		return MaterialApp(
			title: 'Flutter Web Demo',
			theme: ThemeData(primarySwatch: Colors.deepPurple),
			home: HomePage(title: 'Flutter Web Demo'),
		);
	}
}