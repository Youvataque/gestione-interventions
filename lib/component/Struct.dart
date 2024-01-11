class Users {
  final String nom;
  final String prenom;
  final String mail;
  final String phone;
  final String uid;

  const Users(
      {this.nom = "",
      this.prenom = "",
      this.mail = "",
      this.phone = "",
      this.uid = ""});
}

/////////////////

class Entreprise {
  final String adresse;
  final String capacite;
  final String code;
  final String mail;
  final String nom;
  final String phone;
  final String siret;
  final String ville;

  const Entreprise(
      {this.adresse = "",
      this.capacite = "",
      this.code = "",
      this.mail = "",
      this.nom = "",
      this.phone = "",
      this.siret = "",
      this.ville = ""});
}

////////////////

class Client {
  final String nom;
  final String prenom;
  final String adresse;
  final String mail;
  final String phone;
  final String uid;

  const Client(
      {this.nom = "",
      this.prenom = "",
      this.adresse = "",
      this.mail = "",
      this.phone = "",
      this.uid = ""});
}

////////////////

class Last {
  List<String> lastTab;
  int lastCount;
  int cardinal;
  Last({required this.lastTab, this.lastCount = 0, this.cardinal = 0});
}

////////////////

class InterventionC {
  final String identite;
  final String place;
  final String date;
  final String clientId;
  final String marque;
  final String modele;
  final String reference;
  final String etat;
  final String observD;
  final bool testFuite;
  final String cold;
  final String hot;
  final bool carenage;
  final bool condensa;
  final bool ventilo;
  final bool clean;
  final bool assemble;
  final bool cleanFiltre;
  final bool testCondensa;
  final String observD2;
  final String typeExt;
  final bool capeau;
  final bool aspiBros;
  final bool cleanRin;
  final bool verifCuivre;
  final bool verifSupp;
  final bool verifVentil;
  final String coldF;
  final String hotF;
  final String b1;
  final String b2;
  final String b3;
  final String b4;
  final String b5;
  final String userId;

  const InterventionC({
    this.identite = "",
    this.place = "",
    this.date = "",
    this.clientId = "",
    this.marque = "",
    this.modele = "",
    this.reference = "",
    this.etat = "",
    this.observD = "",
    this.testFuite = false,
    this.cold = "",
    this.hot = "",
    this.carenage = false,
    this.condensa = false,
    this.ventilo = false,
    this.clean = false,
    this.assemble = false,
    this.cleanFiltre = false,
    this.testCondensa = false,
    this.observD2 = "",
    this.typeExt = "",
    this.capeau = false,
    this.aspiBros = false,
    this.cleanRin = false,
    this.verifCuivre = false,
    this.verifSupp = false,
    this.verifVentil = false,
    this.coldF = "",
    this.hotF = "",
    this.b1 = "",
    this.b2 = "",
    this.b3 = "",
    this.b4 = "",
    this.b5 = "",
    this.userId = "",
  });
}

////////////////

class InterventionP {
  final String identite;
  final String place;
  final String date;
  final String clientId;
  final String type;
  final String marque;
  final String puissance;
  final String miseRoute;
  final String serialNumber;
  final bool contrProtElec;
  final bool resConElec;
  final bool mesContrTen;
  final bool mesContrInt;
  final bool contrParReg;
  final bool contrEnclTher;
  final bool contrEtanFri;
  final bool contrEtatCal;
  final bool netEchAir;
  final bool contrFoncVentil;
  final bool contrEvacCon;
  final bool mesTempFonc;
  final bool contrVaseExp;
  final bool contrVisuEau;
  final bool contrFoncCirc;
  final bool contrEtanSouHydrau;
  final bool contrAnodeBall;
  final bool contrFluideCal;
  final bool contrProtAnti;
  final bool contrVisuEns;
  final bool essaiFonc;
  final bool aideClient;
  final bool purge;
  final bool nettEntrFiltre;
  final bool contrPressVase;
  final bool regonVase;
  final String defautsCorr;
  final String aPrevoir;
  final String recommandation;
  final String gains;
  final String userId;

  const InterventionP(
      {this.identite = "",
      this.place = "",
      this.date = "",
      this.clientId = "",
      this.type = "",
      this.marque = "",
      this.puissance = "",
      this.miseRoute = "",
      this.serialNumber = "",
      this.contrProtElec = false,
      this.resConElec = false,
      this.mesContrTen = false,
      this.mesContrInt = false,
      this.contrParReg = false,
      this.contrEnclTher = false,
      this.contrEtanFri = false,
      this.contrEtatCal = false,
      this.netEchAir = false,
      this.contrFoncVentil = false,
      this.contrEvacCon = false,
      this.mesTempFonc = false,
      this.contrVaseExp = false,
      this.contrVisuEau = false,
      this.contrFoncCirc = false,
      this.contrEtanSouHydrau = false,
      this.contrAnodeBall = false,
      this.contrFluideCal = false,
      this.contrProtAnti = false,
      this.contrVisuEns = false,
      this.essaiFonc = false,
      this.aideClient = false,
      this.purge = false,
      this.nettEntrFiltre = false,
      this.contrPressVase = false,
      this.regonVase = false,
      this.defautsCorr = "",
      this.aPrevoir = "",
      this.recommandation = "",
      this.gains = "",
      this.userId = ""});
}
