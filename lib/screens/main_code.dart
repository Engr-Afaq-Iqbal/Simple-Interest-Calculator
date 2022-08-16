import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'dart:html';
//import 'dart:ui';

class SIApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SICreate();
  }
}

class _SICreate extends State<SIApp> {
  var _currencies = {'Rupees', 'Dollar', 'Dirham'};
  var _currentitemselected = 'Rupees';
  final _padding = 5.0;
  var _formkey = GlobalKey<FormState>();

  TextEditingController principalcontroller = TextEditingController();
  TextEditingController ratecontroller = TextEditingController();
  TextEditingController termcontroller = TextEditingController();

  var displayresult = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Interest Calculator"),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(_padding * 2),
            //margin: ,
            child: ListView(
              children: <Widget>[
                Image(image: AssetImage('assets/Money-icon.png')),
                Padding(
                    padding: EdgeInsets.only(top: _padding, bottom: _padding),
                    child: TextFormField(
                      controller: principalcontroller,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Principal Value';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.red),
                          labelText: 'Principal',
                          hintText: 'Enter the Principal amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: _padding, bottom: _padding),
                    child: TextFormField(
                      controller: ratecontroller,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Interest value';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Rate of Interest',
                          hintText: 'Enter rate of interest',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: _padding, bottom: _padding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          controller: termcontroller,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Time period';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Time',
                              hintText: 'Enter the Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                        Container(
                          width: _padding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: _currencies.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (newvalueselected) {
                            setState(() {
                              this._currentitemselected = newvalueselected!;
                            });
                          },
                          value: _currentitemselected,
                        )),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: _padding, bottom: _padding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          child: Text("Calculate"),
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState!.validate()) {
                                this.displayresult = calculatetotalreturns();
                              }
                            });
                          },
                        )),
                        Expanded(
                            child: RaisedButton(
                          child: Text("Reset"),
                          onPressed: () {
                            setState(() {
                              principalcontroller.text = '';
                              ratecontroller.text = '';
                              termcontroller.text = '';
                              displayresult = '';
                              _currentitemselected = 'Rupees';
                            });
                          },
                        ))
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text(this.displayresult),
                )
              ],
            ),
          ),
        ));
  }

  String calculatetotalreturns() {
    double principal = double.parse(principalcontroller.text);
    double rate = double.parse(ratecontroller.text);
    double term = double.parse(termcontroller.text);
    double totalinterest = principal + (principal * term * rate) / 100;
    String result =
        'After $term years, your investment will be worth $totalinterest $_currentitemselected';
    return result;
  }
}
