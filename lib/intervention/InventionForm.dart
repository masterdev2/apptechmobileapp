import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

class InterventionPage extends StatefulWidget {
  @override
  _InterventionPageState createState() => _InterventionPageState();
}

class _InterventionPageState extends State<InterventionPage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une intervention"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'text',
                      //validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Semaine d'intervention"),
                    ),
                    FormBuilderDateTimePicker(
                      attribute: "time",
                      inputType: InputType.time,
                      //validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Horaire d'intervention"),
                    ),
                    FormBuilderDateTimePicker(
                      attribute: "date",
                      inputType: InputType.date,
                      //validators: [FormBuilderValidators.required()],
                      format: DateFormat("dd-MM-yyyy"),
                      decoration: InputDecoration(labelText: "Date d'intervention"),
                    ),
                    FormBuilderDropdown(
                      attribute: "statut",
                      decoration: InputDecoration(labelText: "Statut"),
                      // initialValue: 'Male',
                      hint: Text('Statut'),
                      //validators: [FormBuilderValidators.required()],
                      items: ['Aucun', 'Planifié', 'Confirmé', 'Refus']
                          .map((statut) => DropdownMenuItem(
                          value: statut, child: Text("$statut")))
                          .toList(),
                    ),
                    FormBuilderTextField(
                      attribute: "tel",
                      decoration: InputDecoration(labelText: "Tél client"),
                      keyboardType: TextInputType.number,
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(70),
                      ],
                    ),
                    FormBuilderTextField(
                      attribute: "pce",
                      decoration: InputDecoration(labelText: "PCE"),
                      //keyboardType: TextInputType.number,
                      validators: [
                        FormBuilderValidators.email(),
                        FormBuilderValidators.max(70),
                      ],
                    ),
                    FormBuilderSlider(
                      attribute: "progression",
                      //validators: [FormBuilderValidators.min(100)],
                      min: 0.0,
                      max: 100.0,
                      initialValue: 1.0,
                      //divisions: 20,
                      decoration: InputDecoration(
                          labelText: "Progression"),
                    ),
                    FormBuilderStepper(
                      decoration: InputDecoration(labelText: "Stepper"),
                      attribute: "stepper",
                      initialValue: 10,
                      step: 1,
                    ),
                    FormBuilderCheckboxList(
                      decoration:
                      InputDecoration(labelText: "Sélectionner Utilisateurs "),
                      attribute: "languages",
                      initialValue: ["Admin"],
                      options: [
                        FormBuilderFieldOption(value: "admin"),
                      ],
                    ),

                    //SIGNATURE CANVAS
                    Signature(
                      controller: _controller,
                      height: 100,
                      backgroundColor: Colors.white,
                    ),
                    //OK AND CLEAR BUTTONS
                    Container(
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          //SHOW EXPORTED IMAGE IN NEW ROUTE
                          IconButton(
                            icon: const Icon(Icons.check),
                            color: Colors.white,
                            onPressed: () async {
                              if (_controller.isNotEmpty) {
                                var data = await _controller.toPngBytes();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Scaffold(
                                        appBar: AppBar(),
                                        body: Center(
                                            child: Container(
                                                color: Colors.grey[300], child: Image.memory(data))),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          //CLEAR CANVAS
                          IconButton(
                            icon: const Icon(Icons.clear),
                            color: Colors.white,
                            onPressed: () {
                              setState(() => _controller.clear());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Sauvegarder"),
                    onPressed: () {
                      _fbKey.currentState.save();
                      if (_fbKey.currentState.validate()) {
                        print(_fbKey.currentState.value);
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Annuler"),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}