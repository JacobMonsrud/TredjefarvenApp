import 'package:tredjefarven/whist/player_round_whist.dart';
import 'package:tredjefarven/whist/player_whist.dart';
import 'package:tredjefarven/whist/round_whist.dart';
import 'package:tredjefarven/whist/whistwidgets/whistutil/const_bids.dart';
import 'package:tredjefarven/whist/scoresheet_whist.dart';

class Game {

	Player p1, p2, p3 ,p4;
	List<Player> listOfPlayers;
	ScoreSheet scoreSheet = ScoreSheet();
	ConstBids constBids = ConstBids();

	Game(Player p1, Player p2, Player p3, Player p4) {
		this.p1 = p1;
		this.p2 = p2;
		this.p3 = p3;
		this.p4 = p4;
		listOfPlayers = [p1, p2, p3, p4];
	}

	void reportNewRound(Round round) {

		Map<String, Player> mapPlayers = { "p1": this.p1, "p2": this.p2, "p3": this.p3, "p4": this.p4, };

		bool isNolo = [constBids.SOL, constBids.RENSOL, constBids.BORD, constBids.RENBORD].contains(round.bidType);

		if (isNolo) {
			double point = scoreSheet.getNoloPoint(round.bidType);

			double tempP1 = 0;
			double tempP2 = 0;
			double tempP3 = 0;
			double tempP4 = 0;

			List<String> allNoloPlayers = round.partnersOrNoloJoiners;
			allNoloPlayers.add(round.biddingPlayer);

			if (allNoloPlayers.contains("p1")) {
				int won = round.noloWonLoseList[0] ? 1 : -1;
				tempP1 += won * 3 * point;
				tempP2 += won * -1 * point;
				tempP3 += won * -1 * point;
				tempP4 += won * -1 * point;
			} if (allNoloPlayers.contains("p2")) {
				int won = round.noloWonLoseList[1] ? 1 : -1;
				tempP1 += won * -1 * point;
				tempP2 += won * 3 * point;
				tempP3 += won * -1 * point;
				tempP4 += won * -1 * point;
			} if (allNoloPlayers.contains("p3")) {
				int won = round.noloWonLoseList[2] ? 1 : -1;
				tempP1 += won * -1 * point;
				tempP2 += won * -1 * point;
				tempP3 += won * 3 * point;
				tempP4 += won * -1 * point;
			} if (allNoloPlayers.contains("p4")) {
				int won = round.noloWonLoseList[3] ? 1 : -1;
				tempP1 += won * -1 * point;
				tempP2 += won * -1 * point;
				tempP3 += won * -1 * point;
				tempP4 += won * 3 * point;
			}

			p1.reportNewRound(PlayerRound("p1" == round.biddingPlayer, round.partnersOrNoloJoiners.contains("p1"), round.noloWonLoseList[0], round.bidType, tempP1));
			p2.reportNewRound(PlayerRound("p2" == round.biddingPlayer, round.partnersOrNoloJoiners.contains("p2"), round.noloWonLoseList[1], round.bidType, tempP2));
			p3.reportNewRound(PlayerRound("p3" == round.biddingPlayer, round.partnersOrNoloJoiners.contains("p3"), round.noloWonLoseList[2], round.bidType, tempP3));
			p4.reportNewRound(PlayerRound("p4" == round.biddingPlayer, round.partnersOrNoloJoiners.contains("p4"), round.noloWonLoseList[3], round.bidType, tempP4));

		} else {
			bool isTwoVsTwo = (round.partnersOrNoloJoiners.length == 1);

			double point = scoreSheet.getPoint(round.bidSize, round.tricksGotten);
			int multiplier = scoreSheet.getMultiplier(round.bidType);

			double totalPointForBidder = point * multiplier;
			double totalPointForOpposition = totalPointForBidder * -1;
			int isAloneMultiplier;

			List<String> opo = ["p1", "p2", "p3", "p4"];
			opo.remove(round.biddingPlayer);

			if (isTwoVsTwo) {
				opo.remove(round.partnersOrNoloJoiners[0]);
				isAloneMultiplier = 1;

				// The partner
				PlayerRound playerRoundPartner = PlayerRound(false, true, (totalPointForBidder > 0), round.bidSize.toString() + " " + round.bidType, totalPointForBidder);
				mapPlayers[round.partnersOrNoloJoiners[0]].reportNewRound(playerRoundPartner);

			} else {
				// 1 v 3
				isAloneMultiplier = 3;
			}

			// The bidder
			PlayerRound playerRoundBidder = PlayerRound(true, false, (totalPointForBidder > 0), round.bidSize.toString() + " " + round.bidType, totalPointForBidder * isAloneMultiplier);
			mapPlayers[round.biddingPlayer].reportNewRound(playerRoundBidder);

			// The two opposition
			for (String p in opo) {
				PlayerRound playerRoundOpo = PlayerRound(false, false, (totalPointForBidder < 0), round.bidSize.toString() + " " + round.bidType, totalPointForOpposition);
				mapPlayers[p].reportNewRound(playerRoundOpo);
			}
		}

	}

	void undoLastRound() {
		listOfPlayers.forEach((p) => p.undoLastRound());
	}

	List<List<double>> getPointLists() {
		return listOfPlayers.map((p) => p.pointList).toList();
	}

}