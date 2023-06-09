import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class GoalDataPage extends StatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const GoalDataPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GoalDataPageState createState() => _GoalDataPageState();
}

// ignore: non_constant_identifier_names
final List<int> number_of_days = [1, 2, 3, 4, 5, 6, 7];

class _GoalDataPageState extends State<GoalDataPage>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  int dropdownValue = number_of_days.first;
  int _equipmentIndex = 1;
  int _goalIndex = 0;

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Do something with the entered parameters
      if (_equipmentIndex == 1) {
        const snackBar = SnackBar(
          content: Text(
            'Account created succesfully!',
            textAlign: TextAlign.center,
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        widget.onNext();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.onPrevious();
          },
        ),
        title: const Text('Objectives'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _submit,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'What is your goal?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              ToggleSwitch(
                activeBorders: [
                  Border.all(
                    color: Colors.blue,
                    width: 3.0,
                  ),
                  Border.all(
                    color: Colors.yellow.shade700,
                    width: 3.0,
                  ),
                  Border.all(
                    color: Colors.deepOrangeAccent,
                    width: 3.0,
                  ),
                  Border.all(
                    color: Colors.blue.shade500,
                    width: 3.0,
                  ),
                ],
                activeFgColor: Colors.black54,
                isVertical: true,
                minWidth: 150.0,
                radiusStyle: true,
                cornerRadius: 20.0,
                initialLabelIndex: _goalIndex,
                totalSwitches: 3,
                activeBgColors: const [
                  [Colors.lightBlue],
                  [Colors.yellow],
                  [Colors.orange],
                ],
                icons: const [
                  Icons.monitor_weight_outlined,
                  Icons.fitness_center_outlined,
                  Icons.directions_run_outlined,
                ],
                labels: const ['Weight loss', 'Muscle mass', 'Fitness'],
                onToggle: (index) {
                  setState(() {
                    _goalIndex = index!;
                  });
                },
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'How many days per week do you want to train?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: DropdownButton<int>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 4,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: number_of_days.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Do you have equipment?',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ToggleSwitch(
                      customWidths: const [50.0, 50.0],
                      cornerRadius: 20.0,
                      activeBgColors: const [
                        [Colors.cyan],
                        [Colors.redAccent]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      labels: const ['', ''],
                      icons: const [
                        FontAwesomeIcons.check,
                        FontAwesomeIcons.times
                      ],
                      initialLabelIndex: _equipmentIndex,
                      onToggle: (index) {
                        setState(() {
                          _equipmentIndex = index!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
