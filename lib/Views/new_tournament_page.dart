import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_angler/Util/cores.dart';

import '../Widgets/NewTournamentsPage/teamtype_radio_button.dart';
import '../Widgets/NewTournamentsPage/torunament_entry_fee_switch.dart';
import '../Widgets/NewTournamentsPage/tournament_date_range.dart';
import '../Widgets/NewTournamentsPage/tournament_description.dart';
import '../Widgets/NewTournamentsPage/tournament_entry_fee.dart';
import '../Widgets/NewTournamentsPage/tournament_form_field.dart';
import '../Widgets/NewTournamentsPage/tournament_modalidade.dart';
import '../Widgets/NewTournamentsPage/tournament_rules.dart';
import '../Widgets/NewTournamentsPage/tournament_terms_checkbox.dart';
import '../Widgets/NewTournamentsPage/tournament_type.dart';
import '../Widgets/bottom_navigation_bar_widget.dart';
import '../enum/tournament_team_based.dart';

class NewTournamentPage extends StatefulWidget {
  const NewTournamentPage({Key? key}) : super(key: key);

  @override
  _NewTournamentPageState createState() => _NewTournamentPageState();
}

class _NewTournamentPageState extends State<NewTournamentPage> {
  bool _hasEntryFee = false;
  bool? _acceptTerms = false;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _entryFeeController = TextEditingController();
  final picker = ImagePicker();
  File? _pickedImage;
  TournamentTeamBased _teamBase = TournamentTeamBased.Equipe;

  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _entryFeeController.dispose();
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
              CoresPersonalizada.corPrimaria
            ],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                const TournamentNameFormField(),
                const SizedBox(height: 16.0),
                TournamentDateRangeFormField(
                  startDateController: _startDateController,
                  endDateController: _endDateController,
                ),
                const SizedBox(height: 16.0),
                const TournamentModalidadeFormField(),
                const SizedBox(height: 16.0),
                const TournamentTypeFormField(),
                const SizedBox(height: 40.0),
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
                  TournamentRulesFormField(
                rulesController: TextEditingController(),
              ),
                const SizedBox(height: 16.0),
                const TournamentDescriptionFormField(),
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
                  onPressed:
                      _acceptTerms ?? false ? () => _createTournament() : null,
                  child: const Text('Criar Torneio'),
                ),
              ],
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

  void _createTournament() {
    // Implement your logic to create the tournament
  }
}
