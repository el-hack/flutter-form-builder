import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

import '../functions.dart';


class DateField extends StatefulWidget {
  const DateField(
      {Key? key,
      required this.dateController,
      required this.hintText,
      this.ishiddenTextHint = false})
      : super(key: key);
  final TextEditingController dateController;
  final String hintText;
  final bool? ishiddenTextHint;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime initialDate = DateTime(
    DateTime.now().year,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.dateController.text != "" && widget.ishiddenTextHint == true)
          Text(
            widget.hintText,
          ),
        GestureDetector(
          onTap: () async {
            var datePicked = await DatePicker.showSimpleDatePicker(
              context,
              initialDate: initialDate,
              firstDate: DateTime(
                DateTime.now().year - 70,
              ),
              lastDate: DateTime(
                DateTime.now().year + 70,
              ),
              dateFormat: "yyyy-MMMM-dd",
              locale: DateTimePickerLocale.fr,
              looping: true,
              cancelText: "Annuler",
              confirmText: "Valider",
              titleText: "Selectionner la date",
            );
            setState(() {
              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              if (datePicked != null) {
                final String formatted = formatter.format(datePicked);
                widget.dateController.text = formatted.toString();
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            color: Colors.grey.withOpacity(
              0.1,
            ),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                if (widget.dateController.text != "")
                  Text(
                    convertDate(widget.dateController.text),
                    style:TextStyle(
                        color: Colors.black, fontSize: 14),
                  ),
                if (widget.dateController.text == "")
                  Text(
                    widget.hintText,
                    style: TextStyle(
                        color: Colors.grey, fontSize: 14),
                  ),
                const Spacer(),
                Icon(
                  Icons.date_range,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
