import 'package:cloud_firestore/cloud_firestore.dart';

import 'mla_opponents_model.dart';

class MlaModel {

  static const MlaName = 'mlaName';
  static const ConstituencyName = 'constituencyName';
  static const PartyName = 'partyName';
  static const NoOfFlowwers = 'noOfFlowwers';
  static const PercentageToWin = 'percentageToWin';
  static const Manifesto = 'manifesto';
  static const Questions = 'questions';
  static const MlaModelUrl = 'mlaModelUrl';
  static const MlaImageUrl = 'mlaImageUrl';
  static const MlaPartySymbolUrl = 'mlaPartySymbolUrl';
  static const MlavideoUrl = 'mlavideoUrl';
  static const OpponentsMLAs = 'opponentsMLAs';


  String? mlaName;
  String? constituencyName;
  String? partyName;
  String? noOfFlowwers;
  String? percentageToWin;
  String? manifesto;
  String? questions;
  String? mlaModelUrl;
  String? mlaImageUrl;
  String? mlaPartySymbolUrl;
  String? mlavideoUrl;
  List<MlaOpponentModel>? opponentsMLAs;

  MlaModel(
      {this.mlaName,
      this.constituencyName,
      this.partyName,
      this.noOfFlowwers,
      this.percentageToWin,
      this.manifesto,
      this.questions,
      this.mlaModelUrl,
      this.mlaImageUrl,
      this.mlaPartySymbolUrl,
      this.mlavideoUrl,
      this.opponentsMLAs});


  MlaModel.fromMap(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    mlaName = snapshot.data()![MlaName];
    constituencyName = snapshot.data()![ConstituencyName];
    partyName = snapshot.data()![PartyName];
    noOfFlowwers = snapshot.data()![NoOfFlowwers];
    percentageToWin = snapshot.data()![PercentageToWin];
    manifesto = snapshot.data()![Manifesto];
    questions = snapshot.data()![Questions];
    mlaModelUrl = snapshot.data()![MlaModelUrl];
    mlaImageUrl = snapshot.data()![MlaImageUrl];
    mlaPartySymbolUrl = snapshot.data()![MlaPartySymbolUrl];
    mlavideoUrl = snapshot.data()![MlavideoUrl];
    opponentsMLAs = _convertMla(snapshot.data()![OpponentsMLAs] ?? []);
  }

  List<MlaOpponentModel> _convertMla(List mlaFomDb){
    List<MlaOpponentModel> _result = [];
    if(mlaFomDb.length > 0){
      mlaFomDb.forEach((element) {
        _result.add(MlaOpponentModel.fromJson(element));
      });
    }
    return _result;
  }

  List itemsToJson() => opponentsMLAs!.map((item) => item.toJson()).toList();

  Map toJson() => {

    MlaName:mlaName,
    ConstituencyName:constituencyName,
    PartyName:partyName,
    NoOfFlowwers:noOfFlowwers,
    PercentageToWin:percentageToWin,
    Manifesto:manifesto,
    Questions:questions,
    MlaModelUrl:mlaModelUrl,
    MlaImageUrl:mlaImageUrl,
    MlaPartySymbolUrl:mlaPartySymbolUrl,
    MlavideoUrl:mlavideoUrl,
    OpponentsMLAs:opponentsMLAs,
  };


}