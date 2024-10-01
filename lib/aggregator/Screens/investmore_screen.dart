


import 'package:flutter/material.dart';

import '../../view/digi gold screen/gold buying screen/screen_gold_buying_selling.dart';

class InvestMoreScreen extends StatefulWidget {
  const InvestMoreScreen({super.key});

  @override
  _InvestMoreScreenState createState() => _InvestMoreScreenState();
}

class _InvestMoreScreenState extends State<InvestMoreScreen> {
  String _selectedOption = 'Rupees';
  double _inputAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Save Manually',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
           /* onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>GoldBalanceScreen() *//*const GoldBalanceScreen()*//*));
            },*/
            child: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(12),
              decoration:
                  BoxDecoration(
                    color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '🔴  Buy Rate: ₹7735.17/gm  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: '+ 3% GST',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Start your savings journey',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text('Buy in Rupees',style: TextStyle(fontWeight: FontWeight.bold),),
                    value: 'Rupees',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value.toString();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text('Buy in Grams',style: TextStyle(fontWeight: FontWeight.bold)),
                    value: 'Grams',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  hintText: ' 0',
                  hintStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Color.fromRGBO(126, 85, 177, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color:  Color.fromRGBO(126, 85, 177, 1), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    _inputAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Wrap(
                spacing: 10,
                children: [
                  buildAmountButton('₹10'),
                  buildAmountButton('₹50'),
                  buildAmountButton('₹150'),
                  buildAmountButton('₹200', isPopular: true),
                  buildAmountButton('₹250'),
                  buildAmountButton('₹300'),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.25),
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.all(14),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(126, 85, 177, 1),
              ),
              child: const Center(
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildAmountButton(String label, {bool isPopular = false}) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: isPopular ? Colors.black : Colors.black),
      ),
      backgroundColor: isPopular ? Colors.yellow : Colors.grey.shade300,
    );
  }


}
