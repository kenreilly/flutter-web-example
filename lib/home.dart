import 'package:flutter_web/material.dart';
import 'package:flutter_web_example/background.dart';
import 'section-def.dart';
import 'section.dart';

class HomePage extends StatefulWidget {
  
  	HomePage({ Key key, this.title }) : super(key: key);
	final String title;

  	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	List<Section> get _cards =>
		List.generate(sections.length, (int x) 
			=> Section(listenable: _controller, index: x, total: sections.length, item: sections[x]));

	ScrollController _controller = ScrollController();

	@override
	Widget build(BuildContext context) {

		return Scaffold(

			backgroundColor: Colors.black,
			body: Stack(

				children: <Widget>[

					Background(
						image: AssetImage('images/image-01.jpg'),
						listenable: _controller
					),
					Container(
						child: ListView(
							padding: EdgeInsets.only(top: 16, bottom: 64),
							children: _cards,
							controller: _controller
						)
					)
				]
			)
		);
	}		
}