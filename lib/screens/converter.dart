import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => ConverterState();
}

class ConverterState extends State<Converter> {
  final TextEditingController _controller = TextEditingController();
  double conversionResult = 0.0;
  double conversionRate = 0.0206;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ميزان')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'في هذه الغرفة يمكنك تحويل العملات إلى قيمتها الدولية',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: 'Egypt (EGP)',
              items: [
                DropdownMenuItem(
                  value: 'Egypt (EGP)',
                  child: Text('Egypt (EGP)'),
                ),
              ],
              onChanged: (value) {},
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'أدخل المبلغ المراد تحويله',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('تحويل')),
            SizedBox(height: 20),
            Text(
              'Egypt (EGP) (${_controller.text}) = $conversionResult USD',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
