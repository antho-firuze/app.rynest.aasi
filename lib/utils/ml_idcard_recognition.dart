import 'dart:developer';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class MLIdCardRecognition {
  final double confidenceLevel;
  final List<String>? comparationValues;
  final Function(double value)? onComparationCheck;
  final Function(bool value)? onConfidence;
  final bool showLog;

  MLIdCardRecognition({
    this.confidenceLevel = .5,
    this.comparationValues,
    this.onComparationCheck,
    this.onConfidence,
    this.showLog = false,
  }) {
    _comparationValues = comparationValues ?? __comparationValuesDef;
  }

  final _kLogName = 'ML-IDCARD-RECOGNITION';

  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _isBusy = false;
  bool _confidence = false;

  late List<String> _comparationValues;

  final List<String> __comparationValuesDef = [
    "nik",
    "nama",
    "tempat",
    "tgl lahir",
    "jenis kelamin",
    "alamat",
    "agama",
    "status",
    "perkawinan",
    "pekerjaan",
    "kewarganegaraan",
    "berlaku",
    "hingga",
  ];

  Future<void> close() async {
    await _textRecognizer.close();
    _isBusy = false;
    _confidence = false;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (_isBusy) return;
    _isBusy = true;

    final recognizedText = await _textRecognizer.processImage(inputImage);
    _processText(recognizedText);

    _isBusy = false;
  }

  void _processText(RecognizedText text) {
    if (text.blocks.isNotEmpty) {
      List<String> texts = _getTexts(text.blocks);
      double confidence = _comparationCheck(texts);
      if (showLog) log("confidence : $confidence", name: _kLogName);

      onComparationCheck?.call(confidence);

      if (confidence > confidenceLevel && !_confidence) {
        _confidence = true;
        onConfidence?.call(_confidence);
      } else if (confidence < confidenceLevel && _confidence) {
        _confidence = false;
        onConfidence?.call(_confidence);
      }
    }

    // _confidence = confidence > 0.5;

    // if (text.blocks.length > 13) {
    //   log("blocks : ${text.blocks.length}", name: _kLogName);

    //   texts = _getTexts(text.blocks);
    //   log("texts length : ${texts.length}", name: _kLogName);
    //   log("texts values : $texts", name: _kLogName);

    //   confidence = _comparationCheck(texts);
    //   log("confidence : $confidence", name: _kLogName);

    //   _confidence = confidence > 0.5;
    // } else {
    //   _confidence = false;
    // }
  }

  List<String> _getTexts(List<TextBlock> textBlocks) {
    List<String> res = [];
    for (final block in textBlocks) {
      res.add(block.text.toLowerCase());
    }
    return res;
  }

  /// Compare list of string with comparation value
  ///
  /// output (double) => as percentage 0 to 1
  double _comparationCheck(List<String> texts) {
    int confidence = 0;
    for (final el in _comparationValues) {
      for (final text in texts) {
        if (text.contains(el)) {
          confidence += 1;
        }
      }
    }
    return confidence / _comparationValues.length;
  }
}
