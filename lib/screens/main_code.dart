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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_padding * 2),
        child: ListView(
          children: <Widget>[
            Image(image: AssetImage('assets/Money-icon.png')),
            Padding(
                padding: EdgeInsets.only(top: _padding, bottom: _padding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter the Principal amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: _padding, bottom: _padding),
                child: TextField(
                  keyboardType: TextInputType.number,
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
                        child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Enter the Term',
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
                      onPressed: () {},
                    )),
                    Expanded(
                        child: RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () {},
                    ))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text("Todo Text"),
            )
          ],
        ),
      ),
    );
  }
}
