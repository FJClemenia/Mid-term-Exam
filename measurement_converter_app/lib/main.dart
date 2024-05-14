import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'converter.dart'; // Import the Converter class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String box1 = 'Meter';
  String box2 = 'Milimeter';
  String inputValue = '';
  String convertedValue = '';

  Converter converter = Converter(); // Instantiate the Converter class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Measurement Converter App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[400],
          title: Row(
            children: [
              //Image.asset('/assets/measuring_tape_logo.png',
              //  height: 100), // Update the image path
              const SizedBox(width: 10), // Add some spacing
              const Text('Measurement Converter'),
            ],
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 164, 247, 167),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 70, horizontal: 0),
            child: Column(
              children: [
                Text(
                  'Converter Here!',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 250,
                  child: Row(
                    children: [
                      Text('Input: '),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+$')),
                          ],
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              inputValue = value;
                              converter.setInputValue(value);
                              converter.setBox1Value(box1);
                              converter.setBox2Value(box2);
                              if (value.isEmpty) {
                                convertedValue =
                                    ''; // Clear the converted value if input is empty
                              } else {
                                convertedValue = converter.convert();
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                DropdownButton<String>(
                  value: box1,
                  icon: Icon(Icons.arrow_drop_down),
                  dropdownColor: Colors.cyanAccent[400],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        box1 = newValue;
                        converter.setBox1Value(newValue);
                        convertedValue = converter.convert();
                      });
                    }
                  },
                  items: <String>[
                    'Meter',
                    'Milimeter',
                    'Centimeter',
                    'Kilometer',
                    'Feet'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Text('Converted Into'),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 250,
                  child: Row(
                    children: [
                      Text('Converted: '),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          controller:
                              TextEditingController(text: convertedValue),
                        ),
                      ),
                    ],
                  ),
                ),
                DropdownButton<String>(
                  value: box2,
                  icon: Icon(Icons.arrow_drop_down),
                  dropdownColor: Colors.cyanAccent[400],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        box2 = newValue;
                        converter.setBox2Value(newValue);
                        convertedValue = converter.convert();
                      });
                    }
                  },
                  items: <String>[
                    'Meter',
                    'Milimeter',
                    'Centimeter',
                    'Kilometer',
                    'Feet'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
