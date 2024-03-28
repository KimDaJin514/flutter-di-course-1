import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/colors.dart';

import '../../../domain/model/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? onDeleteTap;

  const NoteItem({
    super.key,
    required this.note,
    this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: darkGray).apply(
                    color: darkGray
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  note.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: darkGray),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: (){
                onDeleteTap?.call();
              },
              child: const Icon(
                Icons.delete,
                color: darkGray,
              ),
            ),
          )
        ],
      ),
    );
  }
}
