import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Models/user.dart';
import '../Providers/user_provider.dart';
import '../Util/cores.dart';
import '../Util/custom_styles.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final List<String> participants = [];
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _participantController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  File? _teamImage;

  final List<String> searchResults = [];
  bool isLoading = false;

  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser =
        Provider.of<UserProvider>(context, listen: false).getCurrentUser();
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    _participantController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _addParticipant(String participant) {
    // Verificar se o participante não é o usuário atual antes de adicionar à lista
    if (participant != currentUser?.id) {
      setState(() {
        participants.add(participant);
        _participantController.clear();
        searchResults.clear();
      });
    } else {
      // Exibir mensagem de validação
      final snackBar = SnackBar(
        content: Text('Você será adicionado automaticamente à lista de participantes.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _removeParticipant(String participant) {
    setState(() {
      participants.remove(participant);
    });
  }

  Future<void> _createTeam() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final String teamName = _teamNameController.text;
    final String city = _cityController.text;

    // Verificar se o usuário atual está na lista de participantes
    if (!participants.contains(currentUser?.id)) {
      participants.add(currentUser?.id ?? '');
    }

    // Adicione a lógica para criar a equipe com os dados fornecidos e exibir uma mensagem de confirmação.
    // ...

    // Limpar os campos após a criação da equipe
    setState(() {
      _teamNameController.clear();
      _participantController.clear();
      _cityController.clear();
      participants.clear();
      _teamImage = null;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _teamImage = File(pickedImage.path);
      });
    }
  }

  Future<List<String>> _searchParticipants(String query) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final List<User> results = await userProvider.searchUsers(query);
    return results.map((user) => user.id).toList();
  }

  Widget _buildAddParticipantTextField() {
    return TextFormField(
      controller: _participantController,
      onChanged: _handleParticipantSearch,
      decoration: InputDecoration(
        hintText: 'Digite o nome ou e-mail do participante',
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: isLoading
              ? const SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                )
              : const Icon(Icons.add),
          onPressed: () {
            if (searchResults.isNotEmpty) {
              _addParticipant(searchResults[0]);
            }
          },
        ),
      ),
    );
  }

  void _handleParticipantSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      _searchParticipants(query).then((results) {
        setState(() {
          searchResults.clear();
          searchResults.addAll(results);
          isLoading = false;
        });
      });
    } else {
      setState(() {
        searchResults.clear();
        isLoading = false;
      });
    }
  }

  Widget _buildSearchResults() {
    return searchResults.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2.0,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final String participant = searchResults[index];
                final User user =
                    Provider.of<UserProvider>(context).getUserById(participant);

                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          user.photo ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.city),
                    onTap: () {
                      _addParticipant(user.id);
                    },
                  ),
                );
              },
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildAddedParticipantsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final String participant = participants[index];
        final User user =
            Provider.of<UserProvider>(context).getUserById(participant);

        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  user.photo ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            trailing: const Icon(Icons.remove_circle, color: Colors.red),
            title: Text(user.name),
            subtitle: Text(user.city),
            onTap: () {
              // Verificar se o usuário está clicando no próprio card
              if (participant == currentUser?.id) {
                // Exibir mensagem de validação
                final snackBar = SnackBar(
                  content: Text('Você será adicionado automaticamente à lista de participantes.'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                _removeParticipant(user.id);
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresPersonalizada.corPrimaria,
      appBar: AppBar(
        title: const Text('Criar Equipe'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Foto da Equipe', style: CustomTextStyles.texto16Bold),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _showImagePickerBottomSheet(context),
              child: CircleAvatar(
                radius: 60.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: _teamImage != null
                      ? Image.file(
                          _teamImage!,
                          fit: BoxFit.cover,
                          width: 120.0,
                          height: 120.0,
                        )
                      : const Icon(Icons.add_a_photo, size: 40.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Nome da Equipe', style: CustomTextStyles.texto16Bold),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _teamNameController,
              decoration: const InputDecoration(
                hintText: 'Digite o nome da equipe',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Cidade da Equipe', style: CustomTextStyles.texto16Bold),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: 'Digite a cidade da equipe',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Adicionar Participantes',
                style: CustomTextStyles.texto16Bold),
            const SizedBox(height: 8.0),
            _buildAddParticipantTextField(),
            if (searchResults.isNotEmpty) const SizedBox(height: 8.0),
            _buildSearchResults(),
            const SizedBox(height: 16.0),
            const Text('Participantes Adicionados',
                style: CustomTextStyles.texto16Bold),
            const SizedBox(height: 8.0),
            _buildAddedParticipantsList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _createTeam,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('Criar Equipe'),
        ),
      ),
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Câmera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
