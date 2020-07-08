import 'dart:convert';

enum LangType { fr, en, ar }

class Value {
  final int id;
  final String name;
  final String tooltip;

  const Value({this.id, this.name, this.tooltip});

  const Value.empty({this.id = 0, this.name = '---', this.tooltip});
}

class _Param {
  final bool hasLogo;
  final bool hasBottom;
  final bool hasTop;
  final bool hasOnTap;
  const _Param({
    this.hasLogo = false,
    this.hasBottom = false,
    this.hasTop = false,
    this.hasOnTap = false,
  });
}

class _Paragraph {
  final StringAsset title;
  final StringAsset supTitle;
  final StringAsset body;
  final String image;
  final String supImage;
  final String onTabRoot;
  final bool isRight;
  final dynamic data;
  const _Paragraph({
    this.title,
    this.supTitle,
    this.body,
    this.image,
    this.supImage,
    this.onTabRoot,
    this.isRight = false,
    this.data,
  });
}

class StringAsset {
  static String get nameFr => 'fr';
  static String get nameAr => 'ar';
  static String get nameEn => 'en';

  final String fr;
  final String en;
  final bool bold;
  final double size;
  final List<StringAsset> body;
  final dynamic data;
  final _Param param;

  StringAsset({
    this.fr,
    this.en,
    this.bold,
    this.size,
    this.body,
    this.data,
    this.param = const _Param(),
  });

  String of(LangType type) {
    switch (type) {
      case LangType.en:
        return en ?? fr;
      case LangType.fr:
        return fr;
    }
    return null;
  }

  factory StringAsset.fromString(String text) {
    final map = json.decode(text);
    return StringAsset(
      fr: map[nameFr],
      en: map[nameEn],
    );
  }

  @override
  String toString() {
    final map = <String, dynamic>{
      nameFr: fr,
      nameEn: en,
    };
    return json.encode(map);
  }
}

class Strings {
  static StringAsset get toDO => StringAsset(
        fr: '-- Todo page --',
        body: [],
      );

  static StringAsset get francais => StringAsset(
        fr: 'Français',
        en: 'Frensh',
      );

  static StringAsset get lieu => StringAsset(
        fr: 'Lieu',
        en: 'Location',
      );
  static StringAsset get ajouterinvites => StringAsset(
        fr: 'Ajouter des invites',
        en: 'Add invites',
      );
  static StringAsset get erreurtext1 => StringAsset(
        fr: 'La date est supérieure de Date Fin',
        en: 'The date is higher than End Date',
      );
  static StringAsset get erreurtext2 => StringAsset(
        fr: 'Veuillez renseigner la date',
        en: 'Please enter the date',
      );
  static StringAsset get erreurtext3 => StringAsset(
        fr: 'La date est inférieure de Date Debut',
        en: 'The Date is lower than Start Date',
      );
  static StringAsset get email => StringAsset(
        fr: 'Email',
        en: 'Email',
      );

  static StringAsset get enreg => StringAsset(
        fr: 'Enregistrer.',
        en: 'Save',
      );

  static StringAsset get ajouterungroupe => StringAsset(
        fr: 'Ajouter un groupe :',
        en: 'Add a group:',
      );

  static StringAsset get PasdeconnexionInternet => StringAsset(
        fr: 'Pas de connexion Internet',
        en: 'No network connection',
      );
  static StringAsset get connecter => StringAsset(
        fr: 'Connecté',
        en: 'Connected',
      );
  static StringAsset get cancel => StringAsset(
        fr: 'Annuler',
        en: 'Cancel',
      );

  static StringAsset get pays => StringAsset(
        fr: 'Pays',
        en: 'country',
      );

  static StringAsset get alertsync => StringAsset(
        fr: 'Alert de synchronisation',
        en: 'Sync Alert',
      );

  static StringAsset get sms => StringAsset(
        fr: 'SMS',
        en: 'SMS',
      );

  static StringAsset get types => StringAsset(
        fr: 'Types',
        en: 'Types',
      );

  static StringAsset get more => StringAsset(
        fr: 'Plus',
        en: 'More',
      );

  static StringAsset get voirplus => StringAsset(
        fr: 'Voir Plus ',
        en: 'See More ',
      );
  static StringAsset get sugEtre => StringAsset(
        fr: "Suggestion d'entreprises",
        en: 'Suggestion of companies',
      );
  static StringAsset get infos => StringAsset(
        fr: "Infos Contact : ",
        en: 'Information',
      );

  static StringAsset get edit => StringAsset(
        fr: 'Editer',
        en: 'Edit',
      );
  static StringAsset get suggestion => StringAsset(
        fr: "Suggestion d'entreprises",
        en: 'Suggestion of companies',
      );

  static StringAsset get editcontact => StringAsset(
        fr: 'Editer Contact',
        en: 'Edit Contact',
      );

  static StringAsset get languages => StringAsset(
        fr: 'Languages',
        en: 'languages',
      );

  // arabe number => ۰ ۱ ۲ ۳ ٤ ۵ ٦ ۷ ۸ ۹
  static StringAsset get version => StringAsset(fr: 'V 0.1.2.0');
  static StringAsset get date => StringAsset(fr: '03/05/2019');
  static StringAsset get name => StringAsset(
        fr: 'Events',
      );
  static StringAsset get business => StringAsset(
        fr: 'Business',
      );
  static StringAsset get detailbusiness => StringAsset(
        fr: 'Liste des entreprises',
        en: 'List of Companies',
      );

  static StringAsset get anglais => StringAsset(
        fr: 'Anglais',
        en: 'English',
      );

  static StringAsset get program => StringAsset(
        fr: 'Programmes',
      );
  static StringAsset get programDetail => StringAsset(
        fr: 'Programme Detail',
      );
  static StringAsset get wwwm => StringAsset(fr: '3W Media');

  static StringAsset get emailError =>
      StringAsset(fr: 'Entrer un email valide', en: 'Enter a valid email');
  static StringAsset get passwordError => StringAsset(
        fr: 'Entrez un mot de passe valide',
        en: 'Enter a valid password',
      );
  static StringAsset get emailHintText =>
      StringAsset(fr: 'e-mail', en: 'e-mail');
  static StringAsset get passwordHintText =>
      StringAsset(fr: 'mot de passe', en: 'password');
  static StringAsset get logIn => StringAsset(fr: 'Se connecter', en: 'Login');
  static StringAsset get exitWarning => StringAsset(
        fr: 'Cliquer à nouveau pour quitter',
        en: 'Click again to exit',
      );

  static StringAsset get logOut => StringAsset(
        fr: 'Se déconnecter',
        en: 'Sign out',
      );

  static StringAsset get validate => StringAsset(
        fr: 'Saisir un mot de 3 lettres et plus',
        en: 'Enter a word of 3 letters or more',
      );

  static StringAsset get Delete => StringAsset(
        fr: 'Vous êtes sûr de vouloir supprimer le contact ? ',
        en: 'Are you sure to delete contact ? ',
      );
  static StringAsset get deletePhone => StringAsset(
        fr: 'Vous êtes sûr de vouloir supprimer le numero de telephone ? ',
        en: 'Are you sure to delete the phone number ? ',
      );
  static StringAsset get deleteEmail => StringAsset(
        fr: 'Vous êtes sûr de vouloir supprimer cet email ? ',
        en: 'Are you sure to delete this mail ? ',
      );

  static StringAsset get deletegroupe => StringAsset(
        fr: 'Vous êtes sûr de vouloir supprimer ce groupe ? ',
        en: 'Are you sure to delete this group ? ',
      );

  static StringAsset get deletecontact => StringAsset(
        fr: 'Vous êtes sûr de vouloir supprimer ce contact ? ',
        en: 'Are you sure to delete this contact ? ',
      );

  static StringAsset get titleAlertDelete => StringAsset(
        fr: 'Suppression',
        en: 'Delete',
      );

  static StringAsset get addtocontact => StringAsset(
        fr: 'Ajouter au contact',
        en: 'Add to contacts',
      );

  static StringAsset get contacts => StringAsset(
        fr: 'Contact' '(s)',
        en: 'Contact' '(s)',
      );

  static StringAsset get erreur => StringAsset(
        fr: '3 lettres et plus',
        en: '3 letters and more',
      );
  static StringAsset get dernieredition => StringAsset(
        fr: 'Derniére Edition',
        en: 'Last Edition',
      );

  static StringAsset get searchcontact => StringAsset(
        fr: 'Rechercher des contacts',
        en: 'Search Contacts',
      );

  static StringAsset get nodata => StringAsset(
        fr: 'Aucun resultat',
        en: 'No Result',
      );
  static StringAsset get object => StringAsset(
        fr: 'Object',
        en: 'Object',
      );

  static StringAsset get datedebut => StringAsset(
        fr: 'Date Début',
        en: 'Start Date',
      );

  static StringAsset get datefin => StringAsset(
        fr: 'Début',
        en: 'End Date',
      );

  static StringAsset get contactajoute => StringAsset(
        fr: 'Contact ajouté à votre répertoire',
        en: 'Contact added to your directory',
      );

  static StringAsset get searchcontacts => StringAsset(
        fr: 'Rechercher des contacts ... ',
        en: 'Find Contacts ... ',
      );

  static StringAsset get firstname => StringAsset(
        fr: 'Prénom',
        en: 'First Name',
      );

  static StringAsset get lastname => StringAsset(
        fr: 'Nom',
        en: 'Last Name',
      );

  static StringAsset get sync => StringAsset(
        fr: 'Ce contact sera transféré vers votre répertoire, voulez vous continuer ? ',
        en: 'This contact will be transferred to your directory, do you want to continue ? ',
      );

  static StringAsset get continuer => StringAsset(
        fr: 'Continuer',
        en: 'Continue',
      );

  static StringAsset get ecoute => StringAsset(
        fr: 'Ecoute en cours...',
        en: 'Listening ...',
      );

  static StringAsset get entreprise => StringAsset(
        fr: 'Qui ? Entreprise',
        en: 'Who ? Business',
      );
  static StringAsset get options => StringAsset(
        fr: 'Options Avancées',
        en: 'Advanced options',
      );

  static StringAsset get activites => StringAsset(
        fr: 'Quoi ? Activités, marques ...',
        en: 'What ? Activities, brands ...',
      );
  static StringAsset get maroc => StringAsset(
        fr: 'Maroc',
        en: 'Morocco',
      );

  static StringAsset get yes => StringAsset(
        fr: 'Oui',
        en: 'Yes',
      );

  static StringAsset get no => StringAsset(
        fr: 'Non',
        en: 'No',
      );

  static StringAsset get call => StringAsset(
        fr: 'Appeler',
        en: 'Call',
      );

  static StringAsset get telephone => StringAsset(
        fr: 'Téléphone',
        en: 'Phone',
      );
  static StringAsset get invites => StringAsset(
        fr: 'Invité(s)',
        en: 'Guests',
      );

  static StringAsset get type => StringAsset(
        fr: 'Type',
        en: 'Relationship',
      );

  static StringAsset get whatsapp => StringAsset(
        fr: 'Whatsapp',
        en: 'Whatsapp',
      );
  static StringAsset get groupe => StringAsset(
        fr: 'Groupes',
        en: 'Group',
      );

  static StringAsset get personnemoral => StringAsset(
        fr: 'Personne Morale',
        en: 'Corporation',
      );

  static StringAsset get personnephysique => StringAsset(
        fr: 'Personne Physique',
        en: 'Physical person',
      );

  static StringAsset get contactsupprime => StringAsset(
        fr: 'Contact supprimé',
        en: 'Delete Contact',
      );

  static StringAsset get rechercher => StringAsset(
        fr: 'Rechercher',
        en: 'Search',
      );

  static StringAsset get offLineModeOn => StringAsset(
        fr: '  Mode hors ligne activé ',
        en: 'OffLine Mode On',
      );
  static StringAsset get siteImperium => StringAsset(
        fr: 'Imperium +',
        en: 'Imperium +',
      );
  static StringAsset get mesSupports => StringAsset(
        fr: 'Mes Supports',
        en: 'My Supports',
      );
  static StringAsset get achat => StringAsset(
        fr: 'Achats',
        en: 'Purchases',
      );

  static StringAsset get offLineModeOff => StringAsset(
        fr: 'Mode hors ligne désactivé',
        en: 'OffLine Mode Off',
      );

  static StringAsset get supprimerrdv => StringAsset(
        fr: 'Voulez vous vraiment supprimer',
        en: 'Are you sur to delete this appointment',
      );

  static StringAsset get sending =>
      StringAsset(en: 'Send data', fr: 'Envoyer les données');

  static StringAsset get details => StringAsset(en: 'Details', fr: 'Détails');
  static StringAsset get createdBy =>
      StringAsset(fr: 'Créé par', en: 'Created by');
// static StringAsset get createdBy => StringAsset(fr: 'Créé par', en: 'Created by', ar: 'تم انشائها من قبل');
}
