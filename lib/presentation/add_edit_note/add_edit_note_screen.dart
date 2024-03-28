import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  StreamSubscription? _streamSubscription;

  final List<Color> noteColors = [
    roseBud,
    primeRose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _titleCtrl.text = widget.note!.title;
      _contentCtrl.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        switch(event) {
          case SavedNote():
            Navigator.pop(context, true);
          case ShowSnackBar():
            final snackBar = SnackBar(content: Text(event.msg));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();

    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(viewModel.color),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(AddEditNoteEvent.saveNote(
            widget.note?.id,
            _titleCtrl.text,
            _contentCtrl.text,
          ));
        },
        child: const Icon(Icons.save),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(16),
          color: Color(viewModel.color),
          duration: const Duration(milliseconds: 500),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (color) => GestureDetector(
                        child: _buildBackColor(
                            color: color,
                            selected: (viewModel.color == color.value)),
                        onTap: () {
                          viewModel.onEvent(
                              AddEditNoteEvent.changeColor(color.value));
                        },
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _titleCtrl,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: darkGray),
                decoration: InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: darkGray),
                ),
              ),
              TextField(
                controller: _contentCtrl,
                maxLines: null,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: darkGray),
                decoration: InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: darkGray),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackColor({required Color color, required bool selected}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10.0,
                spreadRadius: 1.0)
          ],
          border:
              selected ? Border.all(color: Colors.black, width: 3.0) : null),
    );
  }
}
