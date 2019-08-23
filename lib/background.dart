import 'package:flutter_web/material.dart';

class Background extends AnimatedWidget {

	Background({ Key key, @required this.image, @required this.listenable }) 
		: super(key: key, listenable: listenable);

	final AssetImage image;
	final ScrollController listenable;
	
	@override
	Widget build(BuildContext context) {

		double offset = listenable.hasClients ? listenable.offset : 0;
		ScrollPosition position = listenable.hasClients ? listenable.position : null;
		double extent = (position == null) ? 1 : position.maxScrollExtent * 1.2;
		double align = (offset / extent);

		return Container(
			constraints: BoxConstraints.expand(),
			child: Image(
				image: image,
				alignment: Alignment(0, align),
				fit: BoxFit.cover
			)
		);
	}
}