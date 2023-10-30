import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Texttospeech extends StatefulWidget {
  const Texttospeech({Key? key}) : super(key: key);

  @override
  State<Texttospeech> createState() => _TexttospeechState();
}

class _TexttospeechState extends State<Texttospeech> {
  FlutterTts ftts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final bool highContrast = MediaQuery.of(context).highContrast;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Text to speech")),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            TextFormField(
              controller: textEditingController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("^[\u0000-\u007F]+\$"))
              ],
              decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(
                      bottom: 15, top: 15, left: 10, right: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Colors.black12, width: 0.0),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter text',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  )),
            ),
            ElevatedButton(
                onPressed: () async {
                  /// currenly setting to us language
                  await ftts.setLanguage("en-US");
                  await ftts.setSpeechRate(0.5);
                  await ftts.setVolume(100.0);
                  await ftts.setPitch(1);
                  var result = await ftts.speak(textEditingController.text);
                  if (result == 1) {
                    print("currenly speaking");
                    setState(() {
                      textEditingController.text;
                    });
                  } else {
                    print("error");
                  }
                },
                child: const Text("Convert Text to Speech")),
            SizedBox(
              height: height * 0.070,
            ),

            /// default high contrast will be set to false
            Container(
                color: highContrast == false ? Colors.white : Colors.black,
                child: Text(
                  textEditingController.text,
                  style: const TextStyle(fontSize: 15.0),
                )),
          ],
        ),
      ),
    );
  }
}
