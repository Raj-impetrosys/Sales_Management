import 'package:flutter/material.dart';
import 'package:saletrackhing/globals/functions/image_picker.dart';
import 'package:saletrackhing/globals/widgets/custom_btn.dart';
import 'package:saletrackhing/globals/widgets/custom_txtfield.dart';
import 'package:saletrackhing/views/collect_payment.dart';

class AddNewClient extends StatelessWidget {
  const AddNewClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _imageController = TextEditingController();
    TextEditingController _companyNameController = TextEditingController();
    TextEditingController _clientNameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _destributorController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    header() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add New Client',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear))
          ],
        );
    return Container(
      height: 600,
      width: 500,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            header(),
            customTxtField(
                controller: _imageController,
                hintText: 'Select image',
                readOnly: true,
                onTap: () {
                  pickImage()
                      .then((image) => _imageController.text = image!.name);
                }),
            customTxtField(
                controller: _companyNameController,
                hintText: 'Enter company name'),
            customTxtField(
                controller: _clientNameController,
                hintText: 'Enter client name'),
            customTxtField(
                controller: _phoneController,
                hintText: 'Enter phone number',
                keyboardType: TextInputType.phone),
            customTxtField(
                controller: _destributorController, hintText: 'Destributor'),
            customBtn(
                text: 'Collect Payment',
                margin: const EdgeInsets.only(top: 20),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const CollectPayment());
                    // Navigator.of(context).pushNamed('/collect_payment');
                  }
                })
          ],
        ),
      ),
    );
  }
}
