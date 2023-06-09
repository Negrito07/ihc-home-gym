import 'package:flutter/material.dart';

class EquipmentDataPage extends StatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const EquipmentDataPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EquipmentDataPageState createState() => _EquipmentDataPageState();
}

class _EquipmentDataPageState extends State<EquipmentDataPage>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text("Please select at least one item."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Do something with the entered parameters
      if(checkboxValue1 || checkboxValue2 || checkboxValue3 || checkboxValue4 || checkboxValue5) {
        widget.onNext();
      }
      else{
        showAlert(context);
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
        title: const Center(child: Text('Equipment')),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsetsDirectional.all(100),
                child: Text(
                  'Already Owned Equipment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              CheckboxListTile(
                title: const Text('Dumbbells'),
                value: checkboxValue1,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Treadmill'),
                value: checkboxValue2,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue2 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Bench'),
                value: checkboxValue3,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue3 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Fixed Bar'),
                value: checkboxValue4,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue4 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Other'),
                value: checkboxValue5,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue5 = value!;
                  });
                },
              ),
              Visibility(
                visible: checkboxValue5,
                child: const TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Equipment:',
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
