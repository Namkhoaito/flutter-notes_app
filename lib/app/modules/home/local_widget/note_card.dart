import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/app/data/model/notes.dart';
import 'package:note_app/app/dependency_injection.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key key, this.notes, this.size, this.onClick, this.onSwipe})
      : super(key: key);
  final Notes notes;
  final Size size;
  final Function onClick;
  final Function onSwipe;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(notes),
      onDismissed: (_) {
        onSwipe();
      },
      child: InkWell(
        onTap: onClick,
        child: Card(
          color: Color(int.parse(DependencyInjection.colors[notes.colorIndex])),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            height: size.height * 0.15,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notes.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Expanded(
                  child: Text(
                    notes.content,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(DateFormat('HH:mm   dd/MM/yyyy').format(notes.dateTime))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
