import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/oldComponent/ClimTemplate.dart';
import 'package:gestionnaire_interventions/oldComponent/PompeTemplate.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

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
  @override
  Widget build(BuildContext context) {
    return InterTemplate(
      title: "Nos interventions",
      sousTitle: "Selectionnez une pièce :",
      body: Column(
        children: List.generate(
          widget.allInterPiece.length,
          (index) => Column(
            children: [
              MainButton(
                title: "${1 + index} : ${widget.allInterPiece[index]}",
                func: () {
                  func4(index);
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ),
      )
    );
  }

  void func4(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: ((BuildContext context) => Container(
          height: MediaQuery.sizeOf(context).height - 40,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
            )
          ),
          child: widget.InterDateClimC.isNotEmpty?
              ClimTemplate(
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
                capot: widget.InterDateClimC[index].capot,
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
          : 
            widget.InterDatePompeC.isNotEmpty? PompeTemplate(
                identite: widget.InterDatePompeC[index].identite,
                place: widget.InterDatePompeC[index].place,
                date: widget.InterDatePompeC[index].date,
                clientId: widget.InterDatePompeC[index].clientId,
                type: widget.InterDatePompeC[index].type,
                marque: widget.InterDatePompeC[index].marque,
                puissance: widget.InterDatePompeC[index].puissance,
                miseRoute: widget.InterDatePompeC[index].miseRoute,
                serialNumber: widget.InterDatePompeC[index].serialNumber,
                contrProtElec: widget.InterDatePompeC[index].contrProtElec,
                resConElec: widget.InterDatePompeC[index].resConElec,
                mesContrTen: widget.InterDatePompeC[index].mesContrTen,
                mesContrInt: widget.InterDatePompeC[index].mesContrInt,
                contrParReg: widget.InterDatePompeC[index].contrParReg,
                contrEnclTher: widget.InterDatePompeC[index].contrEnclTher,
                contrEtanFri: widget.InterDatePompeC[index].contrEtanFri,
                contrEtatCal: widget.InterDatePompeC[index].contrEtatCal,
                netEchAir: widget.InterDatePompeC[index].netEchAir,
                contrFoncVentil: widget.InterDatePompeC[index].contrFoncVentil,
                contrEvacCon: widget.InterDatePompeC[index].contrEvacCon,
                mesTempFonc: widget.InterDatePompeC[index].mesTempFonc,
                contrVaseExp: widget.InterDatePompeC[index].contrVaseExp,
                contrVisuEau: widget.InterDatePompeC[index].contrVisuEau,
                contrFoncCirc: widget.InterDatePompeC[index].contrFoncCirc,
                contrEtanSouHydrau: widget.InterDatePompeC[index].contrEtanSouHydrau,
                contrAnodeBall: widget.InterDatePompeC[index].contrAnodeBall,
                contrFluideCal: widget.InterDatePompeC[index].contrFluideCal,
                contrProtAnti: widget.InterDatePompeC[index].contrProtAnti,
                contrVisuEns: widget.InterDatePompeC[index].contrVisuEns,
                essaiFonc: widget.InterDatePompeC[index].essaiFonc,
                aideClient: widget.InterDatePompeC[index].aideClient,
                purge: widget.InterDatePompeC[index].purge,
                nettEntrFiltre: widget.InterDatePompeC[index].nettEntrFiltre,
                contrPressVase: widget.InterDatePompeC[index].contrPressVase,
                regonVase: widget.InterDatePompeC[index].regonVase,
                defautsCorr: widget.InterDatePompeC[index].defautsCorr,
                aPrevoir: widget.InterDatePompeC[index].aPrevoir,
                recommandation: widget.InterDatePompeC[index].recommandation,
                gains: widget.InterDatePompeC[index].gains,
                userId: widget.InterDatePompeC[index].userId
              ): Container()
            ) 
          )
        );
  }
}
