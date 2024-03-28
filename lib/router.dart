import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/di/di_setup.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:note_app/presentation/notes/notes_screen.dart';
import 'package:note_app/presentation/notes/notes_viewmodel.dart';
import 'package:provider/provider.dart';

import 'domain/model/note.dart';
import 'domain/respository/note_repository.dart';

final GoRouter router = GoRouter(
  initialLocation: '/notes',
  routes: <RouteBase>[
    GoRoute(
      path: '/notes',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<NotesViewModel>(),
          child: const NotesScreen(),
        );
      },
    ),
    GoRoute(
      path: '/add_note',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<AddEditNoteViewModel>(),
          child: const AddEditNoteScreen(),
        );
      },
    ),
    GoRoute(
      path: '/edit_note',
      builder: (context, state) {
        final Note note =
            Note.fromJson(jsonDecode(state.uri.queryParameters['note']!));

        return ChangeNotifierProvider(
          create: (_) => getIt<AddEditNoteViewModel>(),
          child: AddEditNoteScreen(note: note),
        );

        return const AddEditNoteScreen();
      },
    ),
  ],
);
