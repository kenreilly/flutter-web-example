import 'package:flutter_web/material.dart';

class SectionDef {

	final String name;
	final String description;
	final AssetImage image;
	const SectionDef(this.name, this.description, this.image);
}

List<SectionDef> sections = [
	const SectionDef('Meditation', "Find your inner peace with meditation", AssetImage('images/image-02.jpg')),
	const SectionDef('Beverages', "Relax with a beverage by the pool", AssetImage('images/image-03.jpg')),
	const SectionDef('Aromatherapy', "Enjoy the aroma of pure essential oils", AssetImage('images/image-04.jpg')),
	const SectionDef('Tea Time', "Have a conversation with friends over tea", AssetImage('images/image-05.jpg')),
	const SectionDef('The Works', "Treat yourself to an all-day session", AssetImage('images/image-06.jpg'))
];