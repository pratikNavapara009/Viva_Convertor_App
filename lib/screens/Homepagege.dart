import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, int> _measuresMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  String _startMeasure;
  String _convertedMeasure;
  double _numberForm;
  String _resultMessage;

  final TextStyle inputStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );
  final TextStyle labelStyle = const TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  void initState() {
    _numberForm = 0;
    super.initState();
  }

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  void convert(double value, String from, String to) {
    int nFrom = _measuresMap[from];
    int nTo = _measuresMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'This conversion cannot be performed';
    } else {
      _resultMessage =
          '${_numberForm.toString()} $_startMeasure are ${result.toString()} $_convertedMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Measures Converter'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 330,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Convertor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextField(
                style: inputStyle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please enter the value",
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberForm = rv;
                    });
                  }
                },
              ),
              Row(
                children: [
                  DropdownButton(
                    style: inputStyle,
                    hint: Text(
                      "Unit",
                      style: inputStyle,
                    ),
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _startMeasure = value;
                      });
                    },
                    value: _startMeasure,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.blue[600],
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  const Spacer(),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    hint: Text(
                      "Unit",
                      style: inputStyle,
                    ),
                    style: inputStyle,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value;
                      });
                    },
                    value: _convertedMeasure,
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('Convert',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (_startMeasure.isEmpty ||
                      _convertedMeasure.isEmpty ||
                      _numberForm == 0) {
                    return;
                  } else {
                    convert(_numberForm, _startMeasure, _convertedMeasure);
                  }
                },
              ),
              const SizedBox(
                  // height: ,
                  ),
              Text((_resultMessage == null) ? '' : _resultMessage,
                  style: labelStyle),
            ],
          ),
        ),
      ),
    );
  }
}
