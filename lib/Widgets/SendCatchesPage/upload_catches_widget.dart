import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_angler/Util/cores.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({Key? key}) : super(key: key);

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  File? _image;
  File? _video;
  bool _isAllFieldsFilled = false;

  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _checkFieldsFilled();
      }
    });
  }

  Future getVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        _checkFieldsFilled();
      }
    });
  }

  void _checkFieldsFilled() {
    if (_image != null && _video != null) {
      setState(() {
        _isAllFieldsFilled = true;
      });
    } else {
      setState(() {
        _isAllFieldsFilled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Text(
          'Enviar Foto',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CoresPersonalizada.white,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: getImage,
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: CoresPersonalizada.white,
                border: Border.all(color: CoresPersonalizada.white),
              ),
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : const Icon(Icons.camera_alt, size: 48),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Enviar Vídeo',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CoresPersonalizada.white,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: getVideo,
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: CoresPersonalizada.white,
                border: Border.all(color: CoresPersonalizada.white),
              ),
              child: _video != null
                  ? const Icon(Icons.play_arrow, size: 48)
                  : const Icon(Icons.video_call, size: 48),
            ),
          ),
        ),
      ],
    );
  }
}
