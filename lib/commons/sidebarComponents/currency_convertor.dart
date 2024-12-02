import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourly/utilities/colors.dart';


class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  // State Variables
  String? selectedSourceCurrency;
  String? selectedTargetCurrency;
  double? amountInSourceCurrency;
  String? amountInTargetCurrency;
  String? date;
  Map<String, String> currencies = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  // Fetch Currency Names from Backend
  Future<void> fetchCurrencies() async {
    final response = await http.get(Uri.parse('http://localhost:5000/getAllCurrency'));
    if (response.statusCode == 200) {
      setState(() {
        currencies = Map<String, String>.from(json.decode(response.body));
        loading = false;
      });
    } else {
      print('Failed to fetch currency names');
    }
  }

  // Convert Currency
  Future<void> convertCurrency() async {
    final response = await http.get(
      Uri.parse('http://localhost:5000/convert').replace(queryParameters: {
        'date': date ?? '',
        'sourceCurrency': selectedSourceCurrency ?? '',
        'targetCurrency': selectedTargetCurrency ?? '',
        'amountInSourceCurrency': amountInSourceCurrency.toString(),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        amountInTargetCurrency = response.body;
      });
    } else {
      print('Failed to convert currency');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Currency Converter')),
        backgroundColor:kPrimaryClr,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Date (YYYY-MM-DD)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => date = value,
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Source Currency',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedSourceCurrency,
                    items: currencies.keys
                        .map((currency) => DropdownMenuItem(
                              child: Text('$currency - ${currencies[currency]}'),
                              value: currency,
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      selectedSourceCurrency = value;
                    }),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Target Currency',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedTargetCurrency,
                    items: currencies.keys
                        .map((currency) => DropdownMenuItem(
                              child: Text('$currency - ${currencies[currency]}'),
                              value: currency,
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      selectedTargetCurrency = value;
                    }),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount in Source Currency',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        amountInSourceCurrency = double.tryParse(value),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: convertCurrency,
                    child: Text('Convert'),
                  ),
                  SizedBox(height: 32),
                  if (amountInTargetCurrency != null)
                    Text(
                      '$amountInSourceCurrency $selectedSourceCurrency = $amountInTargetCurrency $selectedTargetCurrency',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
    );
  }
}
