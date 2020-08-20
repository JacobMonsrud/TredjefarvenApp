import 'package:flutter/material.dart';
import 'package:tredjefarven/pages/games.dart';
import 'package:tredjefarven/pages/profile.dart';
import 'package:tredjefarven/pages/settings.dart';
import 'package:tredjefarven/util/const_colors.dart';

class Home extends StatefulWidget {

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	int _selectedIndex = 0;
	ConstColors constColors = ConstColors();

	// The different body widgets.
	List<Widget> _pagesWidgets = <Widget>[
		Games(),
		Profile(),
		Settings(),
	];

	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: _pagesWidgets.elementAt(_selectedIndex),

			bottomNavigationBar: BottomNavigationBar(
				backgroundColor: constColors.barColor,
				items: const <BottomNavigationBarItem>[
					BottomNavigationBarItem(
						icon: Icon(Icons.videogame_asset),
						title: Text('Games'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.account_circle),
						title: Text('Profile'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.settings),
						title: Text('Settings'),
					),
				],
				currentIndex: _selectedIndex,
				selectedItemColor: constColors.btnColor,
				onTap: _onItemTapped,
			),
		);
	}
}
