import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Timmer extends StatelessWidget {
  const Timmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Today",
              style: TextStyle(fontSize: 35),
            ),
            Consumer<int>(
              builder: (context, counter, child) {
                DateTime current = DateTime.now();
                current = current.add(const Duration(seconds: 1));
                return Text(
                  DateFormat.jms().format(current).toString(),
                  style: const TextStyle(fontSize: 35),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CheckinCheckout()
          ],
        ),
      ),
    );
  }
}

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({
    super.key,
  });

  @override
  State<CheckinCheckout> createState() => _CheckinCheckoutState();
}

class _CheckinCheckoutState extends State<CheckinCheckout> {
  bool isLoading = false;
  void _changeStatus() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? IconButton(
            padding: const EdgeInsets.all(15),
            style: IconButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: _changeStatus,
            icon: const Icon(
              Icons.check,
              size: 50,
              color: Colors.white,
            ),
          )
        : const CircularProgressIndicator.adaptive();
  }
}
