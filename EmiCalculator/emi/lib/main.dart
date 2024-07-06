import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(EMICalculator());
}

class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  double _loanAmount = 0.0;
  double _interestRate = 0.0;
  int _loanTermInYears = 0;
  double _monthlyEMI = 0.0;
  double _totalPayment = 0.0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMI Calculator',
      home: Scaffold(
      appBar: AppBar(
          title: Text(
            'EMI Calculator',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Loan Amount'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the loan amount';
                      }
                      return null;
                    },
                    onSaved: ( value) {
                      _loanAmount = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Interest Rate (in %)'),
                    validator: ( value) {
                      if (value!.isEmpty) {
                        return 'Please enter the interest rate';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _interestRate = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Loan Term (in years)'),
                    validator: ( value) {
                      if (value!.isEmpty) {
                        return 'Please enter the loan term';
                      }
                      return null;
                    },
                    onSaved: ( value) {
                      _loanTermInYears = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 17.0), 
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 50, 99, 139), 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), 
                              ),
                            ),
                            child: Text(
                              'Calculate',
                              style: TextStyle(fontSize: 16.0, color: Colors.white), 
                            ),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();
                              int n = _loanTermInYears * 12;
                              double r = (_interestRate / 100) / 12;
                              _monthlyEMI = (_loanAmount * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
                              _totalPayment = _monthlyEMI * n;
                              setState(() {}); 
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      _monthlyEMI != 0.0 && _totalPayment != 0.0
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Monthly EMI: ${_monthlyEMI.toStringAsFixed(3)}',
                                style: TextStyle(fontSize: 17.0), 
                              ),
                              Text(
                                'Total Payment: ${_totalPayment.toStringAsFixed(3)}',
                                style: TextStyle(fontSize: 17.0), 
                              ),
                            ],
                          )
                          : SizedBox(), 
                    ],
                  ),
                ],
          ),
                ),
              ),
        ),),);
  }
}