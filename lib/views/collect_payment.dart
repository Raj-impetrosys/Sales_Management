import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/widgets/custom_btn.dart';

class CollectPayment extends StatelessWidget {
  const CollectPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _amountController = TextEditingController();
    TextEditingController _collectMoneyController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.clear))),
          const Text(
            'Total Due Amount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: const InputDecoration(
              hintText: "\$10000.00",
              hintStyle: TextStyle(color: Color(0xffC4C4C4)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Color(0xffE5E5E5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Collect Money',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            // keyboardType: TextInputType.number,
            controller: _collectMoneyController,
            decoration: const InputDecoration(
              hintText: "Enter Your Collect Money",
              hintStyle: TextStyle(color: Color(0xffC4C4C4)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Color(0xffE5E5E5),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          customBtn(text: 'Collect Payment', onTap: () {})
        ],
      ),
    );
  }
}
