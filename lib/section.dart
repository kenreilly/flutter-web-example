import 'package:flutter_web/material.dart';
import 'section-def.dart';

class Content extends AnimatedWidget {
  	
	const Content({ Key key, this.listenable, this.children, this.opacity }) 
		: super(key: key, listenable: listenable);

	final ScrollController listenable;
	final List<Widget> children;
	final double opacity;

	@override
	Widget build(BuildContext context) {

		return Opacity(
			opacity: opacity,
			child: Container(

				padding: EdgeInsets.all(48).copyWith(bottom: 0 ),
				constraints: BoxConstraints.expand(height: 720),
				child: ClipRRect(

					borderRadius: BorderRadius.all(Radius.circular(12)),
					child: Container(

						color: Color.fromARGB(64, 0, 16, 32),
						child: Row(

							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: children
						)
					)
				)
			)
		);
	}
}

class Section extends AnimatedWidget {

	const Section({ Key key, this.index, this.total, this.item, @required this.listenable })
		: super(key: key, listenable: listenable);

	final int index;
	final int total;
	final SectionDef item;
	final ScrollController listenable;

	@override
	Widget build(BuildContext context) {

		Shadow shadow = const Shadow(color: Colors.grey, blurRadius: 24, offset: Offset(12, 12));
		TextTheme theme = Theme.of(context).textTheme;
		TextStyle _titleStyle = theme.display3.copyWith( color: Colors.black45, shadows: [shadow]);
		TextStyle _descStyle = theme.display1.copyWith(fontSize: 18, color: Colors.black54, shadows: [shadow]);
		
		double offset = listenable.hasClients ? listenable.offset : 0;
		ScrollPosition position = listenable.hasClients ? listenable.position : null;
		double extent = (position == null || position.maxScrollExtent == null) ? 1 : position.maxScrollExtent;
		double diff = 1 - (index - ((offset / extent) * (total - 1))).abs();
		double opacity = diff.clamp(0.2, 1);

		return Content(
			listenable: listenable,
			opacity: opacity,
			children: <Widget>[

				Container(
					constraints: BoxConstraints.expand(width: 400),
					child: Column(
						
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Text(item.name, style: _titleStyle),
							Text(item.description, style: _descStyle)
						]
					),
				),
				Container(
					child: ClipRRect(
						
						borderRadius: BorderRadius.all(Radius.circular(12)),
						child: Container(

							constraints: BoxConstraints.expand(width: 440, height: 440),
							child: Image(image: item.image, fit: BoxFit.fitWidth),
						)
					),
				)
			]
		);	
	}
}