import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/ClimTemplate.dart';
import 'package:gestionnaire_interventions/component/PompeTemplate.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

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
        children: [
          TopOfView(
              title: " Mon gestionnaire",
              width: MediaQuery.sizeOf(context).width - 20,
              height: 60,
              lead: SizedBox(
                height: 45,
                width: 45,
                child: Image.asset(
                  "src/logoVide.png",
                ),
              )),
          const SizedBox(
            height: 80,
          ),
          title("Vos dernières clim :"),
          Body(Column(
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
          title("Vos dernières pompes :"),
          Body(Column(
            children: List.generate(
                lastPompe.cardinal <= 3 ? lastPompe.cardinal : 3,
                (index) => Column(
                      children: [
                        InterButton(index, false),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
          )),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Container Body(Widget content) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.7))
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          content,
        ],
      ),
    );
  }

  Container InterButton(int index, bool clim) {
    return Container(
      height: 60,
      width: 320,
      child: ElevatedButton(
          onPressed: () {
            func(index, clim);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: mainColor(),
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.grey,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey))),
          child: Text(
              "${1 + index} : ${clim ? lastInterC[index].date : lastInterP[index].date} | ${getNameFromInter(clim ? lastInterC[index].clientId : lastInterP[index].clientId)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16))),
    );
  }

  void func(int index, bool clim) {
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
            child: clim
                ? ClimTemplate(
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
                    capeau: lastInterC[index].capeau,
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
                    userId: lastInterP[index].userId))));
  }
}
