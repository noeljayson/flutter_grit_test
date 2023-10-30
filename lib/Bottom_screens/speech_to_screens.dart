import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as speechToText;

class Speechtotext extends StatefulWidget {
  const Speechtotext({Key? key}) : super(key: key);

  @override
  State<Speechtotext> createState() => _SpeechtotextState();
}

class _SpeechtotextState extends State<Speechtotext> {
  late speechToText.SpeechToText speech;
  String textString = "";
  bool isListen = false;
  double confidence = 1.0;

  void listen() async {
    if (!isListen) {
      bool avail = await speech.initialize();
      if (avail) {
        setState(() {
          isListen = true;
        });
        speech.listen(onResult: (value) {
          setState(() {
            textString = value.recognizedWords;
          });
        });
      }
    } else {
      setState(() {
        isListen = false;
      });
      speech.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    speech = speechToText.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Speec to text")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          const Center(
            child: Text(
              "Press the button to speak",
              style:  TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              textString,
              style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: "Poppins-Bold",
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              textString,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: "Roboto",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              textString,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: "Agbalumo",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              textString,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: "Lato",
              ),
            ),
          )
        ],
      ),
      floatingActionButton: AvatarGlow(
        animate: isListen,
        glowColor: Colors.brown,
        endRadius: 65.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          child: Icon(isListen ? Icons.mic : Icons.mic_none),
          onPressed: () {
            /// listen speech here
            listen();
          },
        ),
      ),
    );
  }
}
