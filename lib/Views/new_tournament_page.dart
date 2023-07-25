import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_angler/Controller/text_form_notifier.dart';
import 'package:pro_angler/Models/tournament.dart';
import 'package:pro_angler/Models/user.dart';
import 'package:pro_angler/Providers/tournament_provider.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/teamtype_radio_button.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/torunament_entry_fee_switch.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_date_range.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_description.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_entry_fee.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_form_field.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_location_formfield.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_modalidade.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_prizes.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_rules.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_terms_checkbox.dart';
import 'package:pro_angler/Widgets/NewTournamentsPage/tournament_type.dart';
import 'package:pro_angler/Widgets/bottom_navigation_bar_widget.dart';
import 'package:pro_angler/enum/tournament_team_based.dart';
import 'package:provider/provider.dart';

class NewTournamentPage extends StatefulWidget {
  const NewTournamentPage({Key? key}) : super(key: key);

  @override
  _NewTournamentPageState createState() => _NewTournamentPageState();
}

class _NewTournamentPageState extends State<NewTournamentPage> {
  bool _hasEntryFee = false;
  bool? _acceptTerms = false;
  Timestamp? _startDate;
  Timestamp? _endDate;
  final TextEditingController _entryFeeController = TextEditingController();
  final TextEditingController _prizesController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  TournamentTeamBased _teamBase = TournamentTeamBased.equipe;
  final picker = ImagePicker();
  File? _pickedImage;
  String _tournamentType = 'presencial';
  String _organizerName = '';
  String _administratorId = '';
  UserData? _currentUser;
  List<String> competitorsIds = [''];
  List<String> moderatorIds = [''];
  List<String> catchesIds = [''];

  final _modalidadeController = TextEditingControllerNotifier('barco');
  final TextEditingControllerNotifier _cityController =
      TextEditingControllerNotifier('SP');
  final TextEditingControllerNotifier _stateController =
      TextEditingControllerNotifier('');
  final TextEditingController _rulesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  int _currentIndex = 2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TournamentProvider _tournamentProvider = TournamentProvider();

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    _currentUser =
        Provider.of<UserProvider>(context, listen: false).getCurrentUser();
    if (_currentUser != null) {
      setState(() {
        _organizerName = _currentUser!.name;
        _administratorId = _currentUser!.id;
      });
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _startDate = null;
    _endDate = null;
    _entryFeeController.dispose();
    _prizesController.dispose();
    _nameController.dispose();
    _modalidadeController.dispose();
    _rulesController.dispose();
    _descriptionController.dispose();
    _cityController.dispose();
    _stateController.dispose();

    super.dispose();
  }

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _pickedImage = File(pickedImage.path);
      }
    });
  }

  void _createTournament() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    String imageUrl = '';
    if (_pickedImage != null) {
      final String imagePath =
          'team_images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
      final Reference storageReference =
          FirebaseStorage.instance.ref().child(imagePath);
      final UploadTask uploadTask = storageReference.putFile(_pickedImage!);
      await uploadTask.whenComplete(() async {
        imageUrl = await storageReference.getDownloadURL();
      });
    }

    double entryFeeValue = 0.0;
    if (_hasEntryFee) {
      final entryFeeString = _entryFeeController.text;
      final numericEntryFee = entryFeeString.replaceAll(RegExp(r'[^0-9.]'), '');
      entryFeeValue = double.tryParse(numericEntryFee) ?? 0.0;
    }

    final Tournament newTournament = Tournament(
      id: '',
      organizerName: _organizerName,
      administratorId: _administratorId,
      name: _nameController.text,
      description: _descriptionController.text,
      startDate: _startDate!,
      endDate: _endDate!,
      location: '${_stateController.value} - ${_cityController.value}',
      modality: _modalidadeController.value,
      type: _tournamentType,
      entryFee: entryFeeValue,
      prizes: _prizesController.text,
      status: 'Em andamento',
      teamBased: _teamBase,
      rules: _rulesController.text,
      isUserVerified: false,
      isRegistered: false,
      competitorsIds: competitorsIds,
      moderatorsIds: moderatorIds,
      catchesIds: catchesIds,
      isTournamentVerified: false,
      imageUrl: imageUrl,
    );

    try {
      await _tournamentProvider.createTournament(newTournament);

      _formKey.currentState!.reset();
      _showSuccessSnackBar();
    } catch (e) {
      print('Erro ao criar torneio: $e');
    }
  }

  void _showSuccessSnackBar() {
    const snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        'Torneio criado com sucesso!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/mytournaments', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: CoresPersonalizada.corPrimaria,
        title: const Text('Criar Torneio'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria,
            ],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: getImage,
                    child: Container(
                      height: 200.0,
                      color: Colors.grey,
                      child: _pickedImage != null
                          ? Image.file(
                              _pickedImage!,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.upload_file),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TournamentNameFormField(
                    controller: _nameController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentDateRangeFormField(
                    onStartChanged: (timestamp) {
                      setState(() {
                        _startDate = timestamp;
                      });
                    },
                    onEndChanged: (timestamp) {
                      setState(() {
                        _endDate = timestamp;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TournamentLocationFormField(
                    cityController: _cityController,
                    stateController: _stateController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentModalidadeFormField(
                    controller: _modalidadeController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentTypeFormField(
                    value: _tournamentType,
                    onChanged: (value) {
                      setState(() {
                        _tournamentType = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TeamTypeRadioButtons(
                    value: _teamBase,
                    onChanged: (value) {
                      setState(() {
                        _teamBase = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TournamentEntryFeeSwitchTile(
                    hasEntryFee: _hasEntryFee,
                    onEntryFeeChanged: (value) {
                      setState(() {
                        _hasEntryFee = value;
                      });
                    },
                  ),
                  if (_hasEntryFee)
                    TournamentEntryFeeFormField(
                      entryFeeController: _entryFeeController,
                    ),
                  const SizedBox(height: 30.0),
                  TournamentPrizesFormField(
                    prizesController: _prizesController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentRulesFormField(
                    rulesController: _rulesController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentDescriptionFormField(
                    controller: _descriptionController,
                  ),
                  const SizedBox(height: 16.0),
                  TournamentTermsCheckbox(
                    acceptTerms: _acceptTerms ?? false,
                    onTermsChanged: (value) {
                      setState(() {
                        _acceptTerms = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _createTournament,
                    child: const Text('Criar Torneio'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: CoresPersonalizada.corPrimaria,
        ),
        child: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
