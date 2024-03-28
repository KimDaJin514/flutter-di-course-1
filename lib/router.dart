import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:note_app/presentation/notes/notes_screen.dart';
import 'package:provider/provider.dart';

import 'domain/model/note.dart';
import 'domain/respository/note_repository.dart';

final GoRouter router = GoRouter(
  initialLocation: '/notes',
  routes: <RouteBase>[
    GoRoute(
      path: '/notes',
      builder: (context, state) => const NotesScreen(),
    ),
    GoRoute(
      path: '/add_note',
      builder: (context, state) {
        final repository = context.read<NoteRepository>();
        final viewModel = AddEditNoteViewModel(repository);

        return ChangeNotifierProvider(
          create: (_) => viewModel,
          child: const AddEditNoteScreen(),
        );
      },
    ),
    GoRoute(
      path: '/edit_note',
      builder: (context, state) {
        final Note note = Note.fromJson(jsonDecode(state.uri.queryParameters['note']!));

        final repository = context.read<NoteRepository>();
        final viewModel = AddEditNoteViewModel(repository);

        return ChangeNotifierProvider(
          create: (_) => viewModel,
          child: AddEditNoteScreen(note: note,),
        );

        return const AddEditNoteScreen();
      },
    ),
  ],
);