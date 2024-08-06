import 'package:flutter/material.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  String selectedProvider = 'Bank of Amrika';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "Top Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bank Transfer",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              PaymentProvider(
                image: "assets/bank_of_america.jpg",
                name: "Bank of Amrika",
                account: "**** **** **** 1990",
                isSelected: selectedProvider == 'Bank of Amrika',
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      selectedProvider = 'Bank of Amrika';
                    });
                  }
                },
              ),
              PaymentProvider(
                image: "assets/us_bank.png",
                name: "US Bank",
                account: "**** **** **** 1990",
                isSelected: selectedProvider == 'US Bank',
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      selectedProvider = 'US Bank';
                    });
                  }
                },
              ),
              const Text(
                "Other",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),

              PaymentProvider(
                image: "assets/paypal.jpg",
                name: "Paypal",
                account: "Easy Payment",
                isSelected: selectedProvider == 'Pay Pal',
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      selectedProvider = 'Pay Pal';
                    });
                  }
                },
              ),

              PaymentProvider(
                image: "assets/apple.png",
                name: "ApplePay",
                account: "Easy Payment",
                isSelected: selectedProvider == 'Apple Pal',
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      selectedProvider = 'Apple Pal';
                    });
                  }
                },
              ),


              PaymentProvider(
                image: "assets/google.png",
                name: "GooglePay",
                account: "Easy Payment",
                isSelected: selectedProvider == 'GooglePay',
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      selectedProvider = 'GooglePay';
                    });
                  }
                },
              ),

              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopUp()),);
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: Size(double.maxFinite, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                child: Text("Confirm", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentProvider extends StatelessWidget {
  const PaymentProvider({
    super.key,
    required this.image,
    required this.name,
    required this.account,
    required this.isSelected,
    required this.onChanged,
  });

  final String image;
  final String name;
  final String account;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(image),
            backgroundColor: Colors.white,
          ),
          title: Text(name),
          subtitle: Text(account),
          trailing: Transform.scale(
            scale: 1.5,
            child: Radio<bool?>(
              value: true,
              groupValue: isSelected,
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 16, 80, 98),
            ),
          ),
          contentPadding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
