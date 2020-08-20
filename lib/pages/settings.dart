import 'package:flutter/material.dart';
import 'package:tredjefarven/util/const_colors.dart';

class Settings extends StatelessWidget {

	ConstColors constColors = ConstColors();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: constColors.bgColor,
			body: SafeArea(child: Text("Settings")),
		);
	}
}
