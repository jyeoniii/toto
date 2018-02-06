pragma solidity ^0.4.0;

import "browser/Game.sol";

contract Main {

    uint private id = 0;
    Game[] private games;
    TokenContract tokenManager;
    RewardingContract reward;

    mapping (string => address[]) private creators; // string: identifier of the game

    function Main() {
        tokenManager = new TokenContract();
        reward = new RewardingContract();
    }

    function createGame(/*game info*/) {
        require(/*check timestamp*/);
        // findIdStr();
        string gameInfoStr = "201802/....";
        creators[gameInfoStr].push(msg.sender);

        if (true) {
            Game game = new Game(id++ /*, game info*/);
            games.push(game);
        }
    }

    function betGame(uint id, uint numEther, uint numToken, uint scoreA, uint scoreB) {
        require(/*compare timestamp*/);
        games[id].addBettingInfo(/*..*/);
    }


    function enterResult(uint id, uint scoreA, uint scoreB) {
        require(/*compare timestamp*/);
        games[id].enterResult(scoreA, scoreB, msg.sender);
    }


    function checkResult(uint id) { // when user triggers event after the result has been decided
        games[id].finalize();
        reward.reward(games[id]);
    }
}

contract RewardingContract {

    Game game;
    address owner;

    modifier ownerFunc {
      require(owner == msg.sender);
      _;
    }

    function RewardingContract() {
        owner = msg.sender;
    }

    function reward(Game game) ownerFunc {
        rewardCreators(game);
        rewardParticipants(game);
        rewardVerifier(game);
    }

    function rewardCreators() private {

    }

    function rewardParticipants() private {

    }

    function rewardVerifier() private {

    }

}
