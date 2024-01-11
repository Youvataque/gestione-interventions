import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/ClimTemplate.dart';
import 'package:gestionnaire_interventions/component/PompeTemplate.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

class InterPlace extends StatefulWidget {
  final List<String> allInterPiece;
  final List<InterventionC> InterDateClimC;
  final List<InterventionP> InterDatePompeC;
  const InterPlace(
      {super.key,
      required this.allInterPiece,
      required this.InterDateClimC,
      required this.InterDatePompeC});

  @override
  State<InterPlace> createState() => _InterPlaceState();
}

class _InterPlaceState extends State<InterPlace> {
  List<InterventionC> InterPieceClimC = [];
  List<InterventionP> InterPiecePompeC = [];
  @override
  Widget build(BuildContext context) {
    return InterTemplate(
        title: "Nos interventions",
        sousTitle: "Selectionnez une pièce :",
        Body: Column(
          children: List.generate(
              widget.allInterPiece.length,
              (index) => Column(
                    children: [
                      InterButton(
                        index,
                        func4,
                        "${1 + index} : ${widget.allInterPiece[index]}",
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )),
        ));
  }

  void func4(int index) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((BuildContext context) => Container(
            height: MediaQuery.sizeOf(context).height - 70,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: widget.InterDateClimC.length != 0
                ? ClimTemplate(
                    identite: widget.InterDateClimC[index].identite,
                    place: widget.InterDateClimC[index].place,
                    date: widget.InterDateClimC[index].date,
                    clientId: widget.InterDateClimC[index].clientId,
                    marque: widget.InterDateClimC[index].marque,
                    modele: widget.InterDateClimC[index].modele,
                    reference: widget.InterDateClimC[index].reference,
                    etat: widget.InterDateClimC[index].etat,
                    observD: widget.InterDateClimC[index].observD,
                    testFuite: widget.InterDateClimC[index].testFuite,
                    cold: widget.InterDateClimC[index].cold,
                    hot: widget.InterDateClimC[index].hot,
                    carenage: widget.InterDateClimC[index].carenage,
                    condensa: widget.InterDateClimC[index].condensa,
                    ventilo: widget.InterDateClimC[index].ventilo,
                    clean: widget.InterDateClimC[index].clean,
                    assemble: widget.InterDateClimC[index].assemble,
                    cleanFiltre: widget.InterDateClimC[index].cleanFiltre,
                    testCondensa: widget.InterDateClimC[index].testCondensa,
                    observD2: widget.InterDateClimC[index].observD2,
                    typeExt: widget.InterDateClimC[index].typeExt,
                    capeau: widget.InterDateClimC[index].capeau,
                    aspiBros: widget.InterDateClimC[index].aspiBros,
                    cleanRin: widget.InterDateClimC[index].cleanRin,
                    verifCuivre: widget.InterDateClimC[index].verifCuivre,
                    verifSupp: widget.InterDateClimC[index].verifSupp,
                    verifVentil: widget.InterDateClimC[index].verifVentil,
                    coldF: widget.InterDateClimC[index].coldF,
                    hotF: widget.InterDateClimC[index].hotF,
                    b1: widget.InterDateClimC[index].b1,
                    b2: widget.InterDateClimC[index].b2,
                    b3: widget.InterDateClimC[index].b3,
                    b4: widget.InterDateClimC[index].b4,
                    b5: widget.InterDateClimC[index].b5,
                    userId: widget.InterDateClimC[index].userId,
                  )
                : PompeTemplate(
                    identite: InterPiecePompeC[0].identite,
                    place: InterPiecePompeC[0].place,
                    date: InterPiecePompeC[0].date,
                    clientId: InterPiecePompeC[0].clientId,
                    type: InterPiecePompeC[0].type,
                    marque: InterPiecePompeC[0].marque,
                    puissance: InterPiecePompeC[0].puissance,
                    miseRoute: InterPiecePompeC[0].miseRoute,
                    serialNumber: InterPiecePompeC[0].serialNumber,
                    contrProtElec: InterPiecePompeC[0].contrProtElec,
                    resConElec: InterPiecePompeC[0].resConElec,
                    mesContrTen: InterPiecePompeC[0].mesContrTen,
                    mesContrInt: InterPiecePompeC[0].mesContrInt,
                    contrParReg: InterPiecePompeC[0].contrParReg,
                    contrEnclTher: InterPiecePompeC[0].contrEnclTher,
                    contrEtanFri: InterPiecePompeC[0].contrEtanFri,
                    contrEtatCal: InterPiecePompeC[0].contrEtatCal,
                    netEchAir: InterPiecePompeC[0].netEchAir,
                    contrFoncVentil: InterPiecePompeC[0].contrFoncVentil,
                    contrEvacCon: InterPiecePompeC[0].contrEvacCon,
                    mesTempFonc: InterPiecePompeC[0].mesTempFonc,
                    contrVaseExp: InterPiecePompeC[0].contrVaseExp,
                    contrVisuEau: InterPiecePompeC[0].contrVisuEau,
                    contrFoncCirc: InterPiecePompeC[0].contrFoncCirc,
                    contrEtanSouHydrau: InterPiecePompeC[0].contrEtanSouHydrau,
                    contrAnodeBall: InterPiecePompeC[0].contrAnodeBall,
                    contrFluideCal: InterPiecePompeC[0].contrFluideCal,
                    contrProtAnti: InterPiecePompeC[0].contrProtAnti,
                    contrVisuEns: InterPiecePompeC[0].contrVisuEns,
                    essaiFonc: InterPiecePompeC[0].essaiFonc,
                    aideClient: InterPiecePompeC[0].aideClient,
                    purge: InterPiecePompeC[0].purge,
                    nettEntrFiltre: InterPiecePompeC[0].nettEntrFiltre,
                    contrPressVase: InterPiecePompeC[0].contrPressVase,
                    regonVase: InterPiecePompeC[0].regonVase,
                    defautsCorr: InterPiecePompeC[0].defautsCorr,
                    aPrevoir: InterPiecePompeC[0].aPrevoir,
                    recommandation: InterPiecePompeC[0].recommandation,
                    gains: InterPiecePompeC[0].gains,
                    userId: InterPiecePompeC[0].userId))));
  }
}
