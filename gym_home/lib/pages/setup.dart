import 'package:flutter/material.dart';
import 'package:gym_home/pages/goal.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserDataPageState createState() => _UserDataPageState();
}

enum UserGenders { M, F }

final List<String> level = ['Beginner', 'Intermediate', 'Advanced'];

class _UserDataPageState extends State<UserDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  UserGenders? _gender;
  int _age = 0;
  double _weight = 0.0;
  double _height = 0.0;
  String dropdownValue = level.first;

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Do something with the entered parameters
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ObjectivesPage()),
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Name is required' : null,
                onSaved: (value) => _name = value!,
              ),
              Row(
                children: [
                  const Text(
                    'Gender:',
                  ),
                  Expanded(
                    child: RadioListTile<UserGenders>(
                      title: const Text('M'),
                      value: UserGenders.M,
                      groupValue: _gender,
                      onChanged: (UserGenders? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<UserGenders>(
                      title: const Text('F'),
                      value: UserGenders.F,
                      groupValue: _gender,
                      onChanged: (UserGenders? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) => value!.isEmpty ? 'Age is required' : null,
                onSaved: (value) => _age = int.parse(value!),
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Weight (in kg)'),
                validator: (value) => value!.isEmpty ? 'Weight is required' : null,
                onSaved: (value) => _weight = double.parse(value!),
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Height (in meters)'),
                validator: (value) => value!.isEmpty ? 'Height is required' : null,
                onSaved: (value) => _height = double.parse(value!),
              ),
              DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward_rounded),
                elevation: 4,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: level.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
