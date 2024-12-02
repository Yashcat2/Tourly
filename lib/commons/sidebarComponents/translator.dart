import 'package:flutter/material.dart';
import 'package:tourly/utilities/colors.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  final outputController = TextEditingController(text: "Result is here...");
  final translator = GoogleTranslator();
  String inputText = '';
  String inputLanguage = 'en';
  String outputLanguage = 'fr';

  Future<void> translateText() async {
    final translated = await translator.translate(
      inputText,
      from: inputLanguage,
      to: outputLanguage,
    );
    setState(() {
      outputController.text = translated.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assests/images/trans2.png",
                      fit: BoxFit.contain,
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        "Translator",
                        style: TextStyle(
                            color: kBlackClr,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter text to translate",
                      ),
                      onChanged: (value) {
                        setState(() {
                          inputText = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: inputLanguage,
                          onChanged: (newValue) {
                            setState(() {
                              inputLanguage = newValue!;
                            });
                          },
                          items: <String>[
                            'en',
                            'fr',
                            'es',
                            'de',
                            'ur',
                            'si',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                        // Container(
                        //   height: 25,
                        //   width: 25,
                        //   decoration: const BoxDecoration(
                        //       color: kPrimaryClr, shape: BoxShape.circle),
                        //   child: const Center(
                        //     child: Icon(
                        //       Icons.arrow_back,
                        //       color: kWhiteClr,
                        //       size: 16,
                        //     ),
                        //   ),
                        // ),
                        Icon(Icons.arrow_forward),
                        DropdownButton<String>(
                          value: outputLanguage,
                          onChanged: (newValue) {
                            setState(() {
                              outputLanguage = newValue!;
                            });
                          },
                          items: <String>[
                            'en',
                            'fr',
                            'es',
                            'de',
                            'ur',
                            'si',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: translateText,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 84, 154, 211),
                          foregroundColor: Colors.white,
                          minimumSize: Size.fromHeight(50)),
                      child: Text("Translate"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller:
                          outputController, // Use outputController to show translation
                      maxLines: 5,
                      readOnly: true, // Prevent the user from editing
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Translation result will appear here",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Back arrow
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(
                      context); // This will navigate back to the previous screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
