import 'package:flutter/material.dart';

import '../constant_ui.dart';

Widget customBtnIcon({
  required BuildContext context,
  required String label,
  required Widget icon,
  required Function() onClick,
}) {
  return Expanded(
    child: TextButton.icon(
      onPressed: onClick,
      icon: icon,
      label: customTextInfo(
        context: context,
        text: label,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildImageProfile({
  required String url,
  required Function() onClick,
  bool state = false,
}) {
  return InkWell(
    onTap: onClick,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(url),
        ),
        if (state)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade50, width: 2),
            ),
          ),
      ],
    ),
  );
}

Widget customTextTitle({
  required BuildContext context,
  required String text,
  Color? textColor,
  FontWeight? fontWeight,
  double? lineHeight,
}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: textColor,
          fontWeight: fontWeight,
          height: lineHeight,
        ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
  );
}

Widget customTextInfo({
  required BuildContext context,
  required String text,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontWeight: fontWeight,
        ),
    textAlign: TextAlign.start,
  );
}

Widget customTextField({
  required String hintText,
}) {
  return TextField(
    decoration: InputDecoration(
      fillColor: backgroundColor,
      contentPadding: const EdgeInsets.only(left: 12),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      filled: true,
    ),
  );
}

Widget customCircleIcon({required IconData icon, required Function() onClick}) {
  return InkWell(
    onTap: onClick,
    child: CircleAvatar(
      radius: 18,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    ),
  );
}
