import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_angler/Providers/user_provider.dart';
import 'package:pro_angler/Util/cores.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:provider/provider.dart';

class FillUserInfoScreen extends StatefulWidget {
  @override
  _FillUserInfoScreenState createState() => _FillUserInfoScreenState();
}

class _FillUserInfoScreenState extends State<FillUserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _state = '';
  String _city = '';
  late String fullCityState = "$_city-$_state";
  File? _image;
  final picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  void _getUserEmail() {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      _email = currentUser.email!;
      _emailController.text = _email;
    }
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _saveUserInfo() async {
    BuildContext dialogContext = context;
    
    if (_formKey.currentState!.validate()) {
      if (_image == null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Foto de perfil obrigatória'),
              content: const Text(
                  'Por favor, selecione uma foto de perfil antes de prosseguir.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        _name = _nameController.text;
        _state = _stateController.text;
        _city = _cityController.text;
        await saveUserDataToFirestore(context);

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Informações Atualizadas'),
              content: const Text('As informações foram salvas com sucesso.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    Navigator.pushReplacementNamed(context, '/homepage');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<void> saveUserDataToFirestore(BuildContext context) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        final usersCollection = FirebaseFirestore.instance.collection('users');
        final userId = currentUser.uid;

        final storageRef = storage.FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
        final uploadTask = storageRef.putFile(_image!);
        final taskSnapshot = await uploadTask.whenComplete(() => null);
        final imageURL = await taskSnapshot.ref.getDownloadURL();

        await usersCollection.doc(userId).update({
          'name': _name,
          'email': _email,
          'state': _state,
          'city': fullCityState,
          'photoURL': imageURL,
        });

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.currentUser!.name = _name;
        userProvider.currentUser!.email = _email;
        userProvider.currentUser!.photoURL = imageURL;
        userProvider.currentUser!.city = fullCityState;

        userProvider.notifyListeners();

        print('Documento criado para o usuário: $userId');
      }
    } catch (e) {
      print('Erro ao salvar informações do usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem Vindo'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CoresPersonalizada.corPrimaria,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              CoresPersonalizada.corSecundaria,
              CoresPersonalizada.corPrimaria
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: getImage,
                            child: CircleAvatar(
                              radius: screenWidth * 0.15,
                              backgroundImage:
                                  _image != null ? FileImage(_image!) : null,
                              child: _image == null
                                  ? const Icon(
                                      Icons.camera_alt,
                                      size: 36,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Nome ou Apelido',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite o seu nome';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          enabled: false,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite o seu e-mail';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _stateController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Estado',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite o seu estado';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _cityController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Cidade',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite a sua cidade';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _saveUserInfo,
                          child: const Text('Salvar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
