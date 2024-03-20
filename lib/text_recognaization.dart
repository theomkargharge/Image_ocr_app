import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class TextReorganization extends StatefulWidget {
  const TextReorganization({super.key});

  @override
  State<TextReorganization> createState() => _TextReorganizationState();
}

class _TextReorganizationState extends State<TextReorganization> {
  File? _imageFile;
  String? str;
  var aadhaarCard;
  var panCard;
  var drivinglicense;
  // picked image
  Future<void> pickedImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }

    setState(() async {
      str = await _processImage();
    });
  }

  Future<String> _processImage() async {
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String extractedText = recognizedText.text;
    debugPrint('This is text $extractedText');
    setState(() {});
    aadhaarCard = extractAadhaarCard(extractedText);
    panCard = extractPANNumber(extractedText);
    drivinglicense = extractDrivingLicenseNumber(extractedText);
    return extractedText;
  }

  extractAadhaarCard(String str) {
    RegExp regex = RegExp(r'\b[0-9]{4}\s[0-9]{4}\s[0-9]{4}\b');

    final match = regex.firstMatch(str);
    if (match != null) {
      return match.group(0) ?? '';
    } else {
      return 'No Aadhaar number found';
    }
  }

  String extractPANNumber(String text) {
    final RegExp panRegex = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]');
    final match = panRegex.firstMatch(text);
    if (match != null) {
      return match.group(0) ?? '';
    } else {
      return 'No PAN number found';
    }
  }

  String extractDrivingLicenseNumber(String text) {
    final RegExp dlRegex = RegExp(r'MH\d{2}\s\d{9}\s\d{2}');
    final match = dlRegex.firstMatch(text);
    if (match != null) {
      return match.group(0) ?? '';
    } else {
      return 'No driving license number found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Documents Recognition',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Column(
                children: [
                  const Text(
                    'This is for Aadhaar Card',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _imageFile?.path == null
                      ? const Text('Image displayed here')
                      : Image.file(
                          File(_imageFile?.path ?? " "),
                          height: 200,
                          width: 400,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: pickedImage,
                          child: const Text('Upload Image'))),
                  Text(
                    '$str',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The Aadhaar Card Number: $aadhaarCard',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Column(
                children: [
                  const Text(
                    'This is for Pan Card',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _imageFile?.path == null
                      ? const Text('Image displayed here')
                      : Image.file(
                          File(_imageFile!.path),
                          height: 200,
                          width: 400,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: pickedImage,
                          child: const Text('Upload Image'))),
                  Text(
                    '$str',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The Pan Card Number: $panCard',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)),
              child: Column(
                children: [
                  const Text(
                    'This is for Driving License',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _imageFile?.path == null
                      ? const Text('Image displayed here')
                      : Image.file(
                          File(_imageFile?.path ?? " "),
                          height: 200,
                          width: 400,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: pickedImage,
                          child: const Text('Upload Image'))),
                  Text(
                    '$str',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The Driving license Number: $drivinglicense',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
