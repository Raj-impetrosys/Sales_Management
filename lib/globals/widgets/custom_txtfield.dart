import 'package:flutter/material.dart';

customTxtField(
        {TextEditingController? controller,
        required String? hintText,
        TextInputType? keyboardType,
        bool readOnly = false,
        void Function()? onTap}) =>
    TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'value should not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffC4C4C4)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xffE5E5E5),
          ),
        ),
      ),
    );
