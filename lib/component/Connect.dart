import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

// Variables "global"

FirebaseFirestore db = FirebaseFirestore.instance;
List<Users> userData = [];
Entreprise entrepriseData = const Entreprise();
List<Client> clients = [];

// fonctionelle récents (référence)

Last lastClim = Last(lastTab: ["", "", ""]);
Last lastPompe = Last(lastTab: ["", "", ""]);

// fonctionelle intervention récents (concret)

List<InterventionC> lastInterC = [];
List<InterventionP> lastInterP = [];

// Intervention trié par client

List<InterventionC> allInterC = [];
List<InterventionP> allInterP = [];
List<String> allInterClientId = [];

// dictionnaire des dernières interventions

Map<String, dynamic> serialDataClim = {};
Map<String, dynamic> serialDataPompe = {};

// fonction pour get les données de l'utilisateur au lancement de l'app

Future<List<Users>> getUser() async {
  List<Users> tempUserData = [];
  try {
    CollectionReference colRef = db.collection("Users");
    QuerySnapshot docs = await colRef.get();
    for (QueryDocumentSnapshot docRef in docs.docs) {
      Map<String, dynamic> data = docRef.data() as Map<String, dynamic>;
      tempUserData.add(Users(
        nom: data["nom"],
        prenom: data["prenom"],
        mail: data["mail"],
        phone: data["phone"],
        uid: docRef.id,
      ));
    }
  } catch (error) {
    print(error);
  }
  return tempUserData;
}
// fonction pour get les données de l'entreprise au lancement de l'app

Future<Entreprise> getEntreprise() async {
  Entreprise tempEntrepriseData = const Entreprise();
  try {
    DocumentReference docRef =
        db.collection("Entreprise").doc("GestionnaireInterventions");
    DocumentSnapshot document = await docRef.get();
    if (document.exists) {
      Map<String, dynamic> temp = document.data() as Map<String, dynamic>;
      tempEntrepriseData = Entreprise(
          capacite: temp["capacite"],
          code: temp["code"],
          nom: temp["nom"],
          ville: temp["ville"],
          adresse: temp["adresse"],
          mail: temp["mail"],
          phone: temp["phone"],
          siret: temp["siret"]);
    }
  } catch (error) {
    print(error);
  }
  return tempEntrepriseData;
}

// fonction pour get les données des différents clients au lancement de l'app ainsi que leurs nombres

Future<List<Client>> getClients() async {
  List<Client> tempClients = [];
  CollectionReference colRef = db.collection("Clients");
  try {
    QuerySnapshot docsRef = await colRef.get();
    for (QueryDocumentSnapshot docRef in docsRef.docs) {
      Map<String, dynamic> document = docRef.data() as Map<String, dynamic>;
      tempClients.add(Client(
          nom: document["nom"],
          prenom: document["prenom"],
          adresse: document["adresse"],
          mail: document["mail"],
          phone: document["phone"],
          uid: docRef.id));
    }
  } catch (error) {
    print(error);
  }
  return tempClients;
}

// fonction pour get l'ordre des éléments de l'accueil

Future<Last> getLast(String doc) async {
  Last temp = Last(lastTab: ["", "", ""]);
  DocumentReference docRef = db.collection("Last").doc(doc);
  try {
    DocumentSnapshot dataRef = await docRef.get();
    Map<String, dynamic> document = dataRef.data() as Map<String, dynamic>;
    temp = Last(
      cardinal: document["cardinal"] ?? 0,
      lastCount: document["lastCount"] ?? 0,
      lastTab: convert(document["lastTab"]),
    );
  } catch (error) {
    print(error);
  }
  return temp;
}

// fonction pour mettre à jour l'ordre des éléments d'acceuil

void updateLast(String doc) async {
  DocumentReference docRef = db.collection("Last").doc(doc);
  try {
    await docRef.set({
      "lastCount": doc == "Clim" ? lastClim.lastCount : lastPompe.lastCount,
      "lastTab": doc == "Clim" ? lastClim.lastTab : lastPompe.lastTab,
      "cardinal": doc == "Clim" ? lastClim.cardinal : lastPompe.cardinal
    });
  } catch (error) {
    print(error);
  }
}

// fonction pour récupérer les interventions récentes

// fonction pour la clim
Future<List<InterventionC>> getLastInterC() async {
  List<InterventionC> temp = [];
  for (String x in lastClim.lastTab) {
    if (x != "") {
      DocumentReference docRef = db.collection("Interventions").doc(x);
      try {
        DocumentSnapshot dataRef = await docRef.get();
        if (dataRef.exists) {
          Map<String, dynamic> data = dataRef.data() as Map<String, dynamic>;
          temp.add(InterventionC(
              identite: data["identite"],
              place: data["place"],
              date: data["date"],
              clientId: data["clientId"],
              marque: data["marque"],
              modele: data["modele"],
              reference: data["reference"],
              etat: data["etat"],
              observD: data["observD"],
              testFuite: data["testFuite"],
              cold: data["cold"],
              hot: data["hot"],
              carenage: data["carenage"],
              condensa: data["condensa"],
              ventilo: data["ventilo"],
              clean: data["clean"],
              assemble: data["assemble"],
              cleanFiltre: data["cleanFiltre"],
              testCondensa: data["testCondensa"],
              observD2: data["observD2"],
              typeExt: data["typeExt"],
              capeau: data["capeau"],
              aspiBros: data["aspiBros"],
              cleanRin: data["cleanRin"],
              verifCuivre: data["verifCuivre"],
              verifSupp: data["verifSupp"],
              verifVentil: data["verifVentil"],
              coldF: data["coldF"],
              hotF: data["hotF"],
              b1: data["b1"],
              b2: data["b2"],
              b3: data["b3"],
              b4: data["b4"],
              b5: data["b5"],
              userId: data["userId"]));
        }
      } catch (error) {
        print(error);
      }
    }
  }
  return temp;
}

// fonction pour la pompe

Future<List<InterventionP>> getLastInterP() async {
  List<InterventionP> temp = [];
  for (String x in lastPompe.lastTab) {
    if (x != "") {
      DocumentReference docRef = db.collection("Interventions").doc(x);
      try {
        DocumentSnapshot dataRef = await docRef.get();
        if (dataRef.exists) {
          Map<String, dynamic> data = dataRef.data() as Map<String, dynamic>;
          temp.add(InterventionP(
              identite: data["identite"],
              place: data["place"],
              date: data["date"],
              clientId: data["clientId"],
              type: data["type"],
              marque: data["marque"],
              puissance: data["puissance"],
              miseRoute: data["miseRoute"],
              serialNumber: data["serialNumber"],
              contrProtElec: data["contrProtElec"],
              resConElec: data["resConElec"],
              mesContrTen: data["mesContrTen"],
              mesContrInt: data["mesContrInt"],
              contrParReg: data["contrParReg"],
              contrEnclTher: data["contrEnclTher"],
              contrEtanFri: data["contrEtanFri"],
              contrEtatCal: data["contrEtatCal"],
              netEchAir: data["netEchAir"],
              contrFoncVentil: data["contrFoncVentil"],
              contrEvacCon: data["contrEvacCon"],
              mesTempFonc: data["mesTempFonc"],
              contrVaseExp: data["contrVaseExp"],
              contrVisuEau: data["contrVisuEau"],
              contrFoncCirc: data["contrFoncCirc"],
              contrEtanSouHydrau: data["contrEtanSouHydrau"],
              contrAnodeBall: data["contrAnodeBall"],
              contrFluideCal: data["contrFluideCal"],
              contrProtAnti: data["contrProtAnti"],
              contrVisuEns: data["contrVisuEns"],
              essaiFonc: data["essaiFonc"],
              aideClient: data["aideClient"],
              purge: data["purge"],
              nettEntrFiltre: data["nettEntrFiltre"],
              contrPressVase: data["contrPressVase"],
              regonVase: data["regonVases"],
              defautsCorr: data["defautsCorr"],
              aPrevoir: data["aPrevoir"],
              recommandation: data["recommandation"],
              gains: data["gains"],
              userId: data["userId"]));
        }
      } catch (error) {
        print(error.toString());
      }
    }
  }
  return temp;
}

// get intervention pompe

Future<List<InterventionP>> getInterventionP() async {
  List<InterventionP> temp = [];
  CollectionReference colRef = db.collection("Interventions");
  try {
    QuerySnapshot docsRef = await colRef.get();
    for (QueryDocumentSnapshot docRef in docsRef.docs) {
      Map<String, dynamic> data = docRef.data() as Map<String, dynamic>;
      if (data["identite"] == "pompe") {
        temp.add(InterventionP(
            identite: data["identite"],
            place: data["place"],
            date: data["date"],
            clientId: data["clientId"],
            type: data["type"],
            marque: data["marque"],
            puissance: data["puissance"],
            miseRoute: data["miseRoute"],
            serialNumber: data["serialNumber"],
            contrProtElec: data["contrProtElec"],
            resConElec: data["resConElec"],
            mesContrTen: data["mesContrTen"],
            mesContrInt: data["mesContrInt"],
            contrParReg: data["contrParReg"],
            contrEnclTher: data["contrEnclTher"],
            contrEtanFri: data["contrEtanFri"],
            contrEtatCal: data["contrEtatCal"],
            netEchAir: data["netEchAir"],
            contrFoncVentil: data["contrFoncVentil"],
            contrEvacCon: data["contrEvacCon"],
            mesTempFonc: data["mesTempFonc"],
            contrVaseExp: data["contrVaseExp"],
            contrVisuEau: data["contrVisuEau"],
            contrFoncCirc: data["contrFoncCirc"],
            contrEtanSouHydrau: data["contrEtanSouHydrau"],
            contrAnodeBall: data["contrAnodeBall"],
            contrFluideCal: data["contrFluideCal"],
            contrProtAnti: data["contrProtAnti"],
            contrVisuEns: data["contrVisuEns"],
            essaiFonc: data["essaiFonc"],
            aideClient: data["aideClient"],
            purge: data["purge"],
            nettEntrFiltre: data["nettEntrFiltre"],
            contrPressVase: data["contrPressVase"],
            regonVase: data["regonVases"],
            defautsCorr: data["defautsCorr"],
            aPrevoir: data["aPrevoir"],
            recommandation: data["recommandation"],
            gains: data["gains"],
            userId: data["userId"]));
        if (!allInterClientId.contains(data["clientId"]))
          allInterClientId.add(data["clientId"]);
      }
    }
  } catch (error) {
    print(error);
  }
  return temp;
}

// get intervention clim

Future<List<InterventionC>> getInterventionC() async {
  List<InterventionC> temp = [];
  CollectionReference colRef = db.collection("Interventions");
  try {
    QuerySnapshot docsRef = await colRef.get();
    for (QueryDocumentSnapshot docRef in docsRef.docs) {
      Map<String, dynamic> data = docRef.data() as Map<String, dynamic>;
      if (data["identite"] == "clim") {
        temp.add(InterventionC(
          identite: data["identite"],
          place: data["place"],
          date: data["date"],
          clientId: data["clientId"],
          marque: data["marque"],
          modele: data["modele"],
          reference: data["reference"],
          etat: data["etat"],
          observD: data["observD"],
          testFuite: data["testFuite"],
          cold: data["cold"],
          hot: data["hot"],
          carenage: data["carenage"],
          condensa: data["condensa"],
          ventilo: data["ventilo"],
          clean: data["clean"],
          assemble: data["assemble"],
          cleanFiltre: data["cleanFiltre"],
          testCondensa: data["testCondensa"],
          observD2: data["observD2"],
          typeExt: data["typeExt"],
          capeau: data["capeau"],
          aspiBros: data["aspiBros"],
          cleanRin: data["cleanRin"],
          verifCuivre: data["verifCuivre"],
          verifSupp: data["verifSupp"],
          verifVentil: data["verifVentil"],
          coldF: data["coldF"],
          hotF: data["hotF"],
          b1: data["b1"],
          b2: data["b2"],
          b3: data["b3"],
          b4: data["b4"],
          b5: data["b5"],
          userId: data["userId"],
        ));
        if (!allInterClientId.contains(data["clientId"]))
          allInterClientId.add(data["clientId"]);
      }
    }
  } catch (error) {
    print(error);
  }
  return temp;
}

// get le dictionnaire des numéros de série.

Future<Map<String, dynamic>> getSerialDataClim() async {
  Map<String, dynamic> data = {};
  DocumentReference docRef = db.collection("SerialData").doc("Clim");
  try {
    DocumentSnapshot temp = await docRef.get();
    data = temp.data() as Map<String, dynamic>;
  } catch (error) {
    print(error);
  }
  return data;
}

////////

Future<Map<String, dynamic>> getSerialDataPompe() async {
  Map<String, dynamic> data = {};
  DocumentReference docRef = db.collection("SerialData").doc("Pompe");
  try {
    DocumentSnapshot temp = await docRef.get();
    data = temp.data() as Map<String, dynamic>;
  } catch (error) {
    print(error);
  }
  return data;
}

// update le dico

void updateSerialDataClim(String serialNumber, String date) {
  DocumentReference docRef = db.collection("SerialData").doc("Clim");
  serialDataClim[serialNumber] = date;
  docRef.set(serialDataClim, SetOptions(merge: true));
}

//////

void updateSerialDataPompe(String serialNumber, String date) {
  DocumentReference docRef = db.collection("SerialData").doc("Pompe");
  serialDataPompe[serialNumber] = date;
  docRef.set(serialDataPompe, SetOptions(merge: true));
}
