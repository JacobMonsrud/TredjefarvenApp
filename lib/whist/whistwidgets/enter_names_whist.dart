import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tredjefarven/pages/whist.dart';
import 'package:tredjefarven/util/const_colors.dart';
import 'package:tredjefarven/whist/game_whist.dart';
import 'package:tredjefarven/whist/player_whist.dart';
import 'package:tredjefarven/whist/whistwidgets/between_rounds_whist.dart';
import 'package:tredjefarven/pages/whist.dart';


class EnterNamesWhist extends StatefulWidget {

	final Function(String, String, String, String) callback;

	EnterNamesWhist(this.callback);

	@override
	_EnterNamesWhistState createState() => _EnterNamesWhistState();
}

class _EnterNamesWhistState extends State<EnterNamesWhist> {

	final p1c = TextEditingController();
	final p2c = TextEditingController();
	final p3c = TextEditingController();
	final p4c = TextEditingController();
	FlutterToast flutterToast;
	ConstColors constColors = ConstColors();

	@override
	void initState() {
		flutterToast = FlutterToast(context);
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: constColors.bgColor,
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(8.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget>[
							Text(
								"Enter player names",
								style: TextStyle(
									fontSize: 40.0,
									color: constColors.titelColor,
								),
							),
							SizedBox(
								height: 20.0,
							),

							Text(
								"Angiv navnene i den rækkefølge i sidder ved bordet. Lad spiller 1 have udspillet i første runde.",
								style: TextStyle(
									color: this.constColors.textColor,
								),
							),

							SizedBox(
								height: 10.0,
							),

							TextField(
								controller: p1c,
								decoration: InputDecoration(
										border: OutlineInputBorder(), hintText: 'Spiller 1 navn'),
							),
							SizedBox(
								height: 20.0,
							),
							TextField(
								controller: p2c,
								decoration: InputDecoration(
										border: OutlineInputBorder(), hintText: 'Spiller 2 navn'),
							),
							SizedBox(
								height: 20.0,
							),
							TextField(
								controller: p3c,
								decoration: InputDecoration(
										border: OutlineInputBorder(), hintText: 'Spiller 3 navn'),
							),
							SizedBox(
								height: 20.0,
							),
							TextField(
								controller: p4c,
								decoration: InputDecoration(
										border: OutlineInputBorder(), hintText: 'Spiller 4 navn'),
							),
							SizedBox(
								height: 20.0,
							),
							RaisedButton(
								onPressed: _startGame,
								color: constColors.btnColor,
								child: Text(
									"Tryk når i er klar!",
									style: TextStyle(
										color: constColors.btnTextColor,
									),
								),
							),
						],
					),
				),
			),
		);
	}

	void _startGame() {
		p1c.text = "Jacob";
		p2c.text = "Kasper";
		p3c.text = "Mathias";
		p4c.text = "Oskar";

		bool allNamedFilled = p1c.text.isNotEmpty && p2c.text.isNotEmpty && p3c.text.isNotEmpty && p4c.text.isNotEmpty;
		Set<String> allNames = Set();
		allNames.addAll([p1c.text, p2c.text, p3c.text, p4c.text]);
		bool allUnique = allNames.length == 4;
		if (allNamedFilled && allUnique) {
			widget.callback(p1c.text, p2c.text, p3c.text, p4c.text);
		} else {
			_showToast();
		}
	}

	_showToast() {
		Widget toast = Container(
			padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.circular(25.0),
				color: constColors.toastColor,
			),
			child: Row(
				mainAxisSize: MainAxisSize.min,
				children: [
					Icon(Icons.error_outline),
					SizedBox(
						width: 12.0,
					),
					Text("You must enter all four unique names!"),
				],
			),
		);
		flutterToast.showToast(
			child: toast,
			gravity: ToastGravity.BOTTOM,
			toastDuration: Duration(seconds: 3),
		);
	}

	@override
	void dispose() {
		p1c.dispose();
		p2c.dispose();
		p3c.dispose();
		p4c.dispose();
		super.dispose();
	}

}
