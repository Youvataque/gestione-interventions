import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/Previsu/ClimTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/ClimTemplate.dart';
import 'package:gestionnaire_interventions/oldComponent/PompeTemplate.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(title: "Vos dernières clim :"),
          const Gap(5),
          body(Column(
            children: List.generate(
                lastClim.cardinal <= 3 ? lastClim.cardinal : 3,
                (index) => Column(
                      children: [
                        InterButton(index, true),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
          )),
          const SizedBox(
            height: 40,
          ),
          const TitleText(title: "Vos dernières pompes :"),
          const Gap(5),
          body(
            Column(
              children: List.generate(
                lastPompe.cardinal <= 3 ? lastPompe.cardinal : 3,
                (index) => Column(
                  children: [
                    InterButton(index, false),
                    const Gap(20)
                  ],
                )
              ),
            )
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget body(Widget content) {
    return CloudBack(
      child: Column(
        children: [
          const Gap(20),
          content
        ],
      ),
    );
  }

  Widget InterButton(int index, bool clim) {
    return MainButton(
      title: "${1 + index} : ${clim ? lastInterC[index].date : lastInterP[index].date} | ${getNameFromInter(clim ? lastInterC[index].clientId : lastInterP[index].clientId)}",
      func: () {
        func(index, clim);
      },
    );
  }

  void func(int index, bool clim) {
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
                    topRight: Radius.circular(25))),
            child: clim
                ? ClimTemplates(
                    identite: lastInterC[index].identite,
                    place: lastInterC[index].place,
                    date: lastInterC[index].date,
                    clientId: lastInterC[index].clientId,
                    marque: lastInterC[index].marque,
                    modele: lastInterC[index].modele,
                    reference: lastInterC[index].reference,
                    etat: lastInterC[index].etat,
                    observD: lastInterC[index].observD,
                    testFuite: lastInterC[index].testFuite,
                    cold: lastInterC[index].cold,
                    hot: lastInterC[index].hot,
                    carenage: lastInterC[index].carenage,
                    condensa: lastInterC[index].condensa,
                    ventilo: lastInterC[index].ventilo,
                    clean: lastInterC[index].clean,
                    assemble: lastInterC[index].assemble,
                    cleanFiltre: lastInterC[index].cleanFiltre,
                    testCondensa: lastInterC[index].testCondensa,
                    observD2: lastInterC[index].observD2,
                    typeExt: lastInterC[index].typeExt,
                    capot: lastInterC[index].capot,
                    aspiBros: lastInterC[index].aspiBros,
                    cleanRin: lastInterC[index].cleanRin,
                    verifCuivre: lastInterC[index].verifCuivre,
                    verifSupp: lastInterC[index].verifSupp,
                    verifVentil: lastInterC[index].verifVentil,
                    coldF: lastInterC[index].coldF,
                    hotF: lastInterC[index].hotF,
                    b1: lastInterC[index].b1,
                    b2: lastInterC[index].b2,
                    b3: lastInterC[index].b3,
                    b4: lastInterC[index].b4,
                    b5: lastInterC[index].b5,
                    userId: lastInterC[index].userId,
                  )
                : PompeTemplate(
                      identite: lastInterP[index].identite, 
                      place: lastInterP[index].place, 
                      date: lastInterP[index].date, 
                      clientId: lastInterP[index].clientId, 
                      type: lastInterP[index].type, 
                      marque: lastInterP[index].marque, 
                      puissance: lastInterP[index].puissance, 
                      miseRoute: lastInterP[index].miseRoute, 
                      serialNumber: lastInterP[index].serialNumber, 
                      contrProtElec: lastInterP[index].contrProtElec, 
                      resConElec: lastInterP[index].resConElec, 
                      mesContrTen: lastInterP[index].mesContrTen, 
                      mesContrInt: lastInterP[index].mesContrInt, 
                      contrParReg: lastInterP[index].contrParReg, 
                      contrEnclTher: lastInterP[index].contrEnclTher, 
                      contrEtanFri: lastInterP[index].contrEtanFri, 
                      contrEtatCal: lastInterP[index].contrEtatCal,
                      netEchAir: lastInterP[index].netEchAir, 
                      contrFoncVentil: lastInterP[index].contrFoncVentil, 
                      contrEvacCon: lastInterP[index].contrEvacCon, 
                      mesTempFonc: lastInterP[index].mesTempFonc, 
                      contrVaseExp: lastInterP[index].contrVaseExp, 
                      contrVisuEau: lastInterP[index].contrVisuEau, 
                      contrFoncCirc: lastInterP[index].contrFoncCirc, 
                      contrEtanSouHydrau: lastInterP[index].contrEtanSouHydrau, 
                      contrAnodeBall: lastInterP[index].contrAnodeBall, 
                      contrFluideCal: lastInterP[index].contrFluideCal, 
                      contrProtAnti: lastInterP[index].contrProtAnti, 
                      contrVisuEns: lastInterP[index].contrVisuEns, 
                      essaiFonc: lastInterP[index].essaiFonc, 
                      aideClient: lastInterP[index].aideClient, 
                      purge: lastInterP[index].purge, 
                      nettEntrFiltre: lastInterP[index].nettEntrFiltre, 
                      contrPressVase: lastInterP[index].contrPressVase, 
                      regonVase: lastInterP[index].regonVase, 
                      defautsCorr: lastInterP[index].defautsCorr, 
                      aPrevoir: lastInterP[index].aPrevoir, 
                      recommandation: lastInterP[index].recommandation, 
                      gains: lastInterP[index].gains, 
                      userId: lastInterP[index].userId
                  )   )));
  }
}
