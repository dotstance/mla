class MlaOpponentModel{

  final String? opponentMlaName;
  final String? opponentConstituencyName;
  final String? opponentMlaPartyName;
  final String? opponentMlaImage;
  final String? opponentPercentageToWin;

  MlaOpponentModel(
      {this.opponentMlaName,
      this.opponentConstituencyName,
      this.opponentMlaPartyName,
      this.opponentMlaImage,
      this.opponentPercentageToWin,
      });


  Map<String, dynamic> toJson() {
    return {
      'opponentMlaName': opponentMlaName,
      'opponentConstituencyName': opponentConstituencyName,
      'opponentMlaPartyName': opponentMlaPartyName,
      'opponentMlaImage': opponentMlaImage,
      'opponentPercentageToWin': opponentPercentageToWin,

    };
  }

  factory MlaOpponentModel.fromJson(Map<String, dynamic> json) {
    return MlaOpponentModel(
      opponentMlaName: json['opponentMlaName'],
      opponentConstituencyName: json['opponentConstituencyName'],
      opponentMlaPartyName: json['opponentMlaPartyName'],
      opponentMlaImage: json['opponentMlaImage'],
      opponentPercentageToWin: json['opponentPercentageToWin'],

    );
  }

}