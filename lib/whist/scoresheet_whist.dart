import 'package:tredjefarven/util/const_bids.dart';

class ScoreSheet {

	ConstBids constBids = ConstBids();
	// < bidSize, tricksGotten >
	List<List<double>> _scoresheet;
	Map<String, double> _nolo;
	Map<String, int> _multiplier;

	ScoreSheet() {
		_scoresheet = List.generate(6, (_) => new List(14));
		_multiplier = Map<String, int>();
		_nolo = Map<String, double>();

		_scoresheet[0][0] = -4.5;
		_scoresheet[0][1] = -4;
		_scoresheet[0][2] = -3.5;
		_scoresheet[0][3] = -3;
		_scoresheet[0][4] = -2.5;
		_scoresheet[0][5] = -2;
		_scoresheet[0][6] = -1.5;
		_scoresheet[0][7] = -1;
		_scoresheet[0][8] = 1;
		_scoresheet[0][9] = 1.5;
		_scoresheet[0][10] = 2;
		_scoresheet[0][11] = 2.5;
		_scoresheet[0][12] = 3;
		_scoresheet[0][13] = 3.5;

		_scoresheet[1][0] = -9;
		_scoresheet[1][1] = -8;
		_scoresheet[1][2] = -7;
		_scoresheet[1][3] = -6;
		_scoresheet[1][4] = -5;
		_scoresheet[1][5] = -4;
		_scoresheet[1][6] = -3;
		_scoresheet[1][7] = -2;
		_scoresheet[1][8] = -1;
		_scoresheet[1][9] = 2;
		_scoresheet[1][10] = 3;
		_scoresheet[1][11] = 4;
		_scoresheet[1][12] = 5;
		_scoresheet[1][13] = 6;

		_scoresheet[2][0] = -18;
		_scoresheet[2][1] = -16;
		_scoresheet[2][2] = -14;
		_scoresheet[2][3] = -12;
		_scoresheet[2][4] = -10;
		_scoresheet[2][5] = -8;
		_scoresheet[2][6] = -6;
		_scoresheet[2][7] = -4;
		_scoresheet[2][8] = -3;
		_scoresheet[2][9] = -2;
		_scoresheet[2][10] = 4;
		_scoresheet[2][11] = 6;
		_scoresheet[2][12] = 8;
		_scoresheet[2][13] = 10;

		_scoresheet[3][0] = -40;
		_scoresheet[3][1] = -36;
		_scoresheet[3][2] = -32;
		_scoresheet[3][3] = -28;
		_scoresheet[3][4] = -24;
		_scoresheet[3][5] = -20;
		_scoresheet[3][6] = -16;
		_scoresheet[3][7] = -12;
		_scoresheet[3][8] = -8;
		_scoresheet[3][9] = -5;
		_scoresheet[3][10] = -3;
		_scoresheet[3][11] = 8;
		_scoresheet[3][12] = 12;
		_scoresheet[3][13] = 16;

		_scoresheet[4][0] = -88;
		_scoresheet[4][1] = -80;
		_scoresheet[4][2] = -72;
		_scoresheet[4][3] = -64;
		_scoresheet[4][4] = -56;
		_scoresheet[4][5] = -48;
		_scoresheet[4][6] = -40;
		_scoresheet[4][7] = -32;
		_scoresheet[4][8] = -24;
		_scoresheet[4][9] = -16;
		_scoresheet[4][10] = -8;
		_scoresheet[4][11] = -4;
		_scoresheet[4][12] = 16;
		_scoresheet[4][13] = 32;

		_scoresheet[5][0] = -152;
		_scoresheet[5][1] = -140;
		_scoresheet[5][2] = -128;
		_scoresheet[5][3] = -116;
		_scoresheet[5][4] = -104;
		_scoresheet[5][5] = -92;
		_scoresheet[5][6] = -80;
		_scoresheet[5][7] = -68;
		_scoresheet[5][8] = -56;
		_scoresheet[5][9] = -44;
		_scoresheet[5][10] = -32;
		_scoresheet[5][11] = -20;
		_scoresheet[5][12] = -8;
		_scoresheet[5][13] = 40;

		_multiplier[constBids.ALM] = 1;
		_multiplier[constBids.HALVE] = 2;
		_multiplier[constBids.GODE] = 2;
		_multiplier[constBids.SANS] = 3;
		_multiplier[constBids.VIP1] = 2;
		_multiplier[constBids.VIP2] = 3;
		_multiplier[constBids.VIP3] = 4;

		_nolo[constBids.SOL] = 2;
		_nolo[constBids.RENSOL] = 4;
		_nolo[constBids.BORD] = 8;
		_nolo[constBids.RENBORD] = 16;

	}


	double getPoint(int bidSize, int tricksGotten) {
		return this._scoresheet[bidSize - 8][tricksGotten];
	}

	int getMultiplier(String mul) {
		return this._multiplier[mul];
	}

	double getNoloPoint(String type) {
		return this._nolo[type];
	}

}