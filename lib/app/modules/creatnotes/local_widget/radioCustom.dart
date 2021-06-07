import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../dependency_injection.dart';
import '../creatnotes_controller.dart';

Widget RadioCustom(
    {Size size, int index, CreatNotesController creatNotesController}) {
  return InkWell(
    onTap: () {
      creatNotesController.radioClick(index);
    },
    child: Container(
      height: size.width * 0.06,
      width: size.width * 0.06,
      decoration: BoxDecoration(
        color: index == creatNotesController.isSelected
            ? Color(int.parse(DependencyInjection.colors[index]))
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(int.parse(DependencyInjection.colors[index])),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
  );
}
