import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  double totalDonations = 0.0;

  final TextEditingController donationController = TextEditingController();

  void addDonation(double amount) {
    setState(() {
      totalDonations += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جمع التبرعات لمرضى السرطان'),
        backgroundColor: const Color(0xFF98c242),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/photo_1_2024-06-01_13-54-09.jpg ',
                fit: BoxFit.cover,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'تبرع لمساعدة مرضى السرطان',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'تبرعك يمكن أن يحدث فرقًا كبيرًا في حياة العديد من مرضى السرطان. كل تبرع يساعد في توفير العلاج والأمل لمن يحتاجون إليه.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'مبلغ التبرعات الحالي: \$${totalDonations.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: donationController,
                decoration: InputDecoration(
                  labelText: 'أدخل مبلغ التبرع',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double? donationAmount =
                  double.tryParse(donationController.text);
                  if (donationAmount != null) {
                    addDonation(donationAmount);
                    donationController.clear();
                  }
                },
                child: Text('تبرع الآن'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF98c242),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
