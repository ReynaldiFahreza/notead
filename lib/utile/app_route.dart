import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notead/models/note.dart';
import 'package:notead/pages/add_note_page.dart';
import 'package:notead/pages/home_page.dart';

class AppRoutes {
  static const home = "Home";
  static const addNote = "add-note";
  static const editNote = "edit-note";

  static Page _homePageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MaterialPage(child: Homepage());
  }

  static Page _editNotePageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: AddNotePage(
        note: state.extra as Note,
    ));
  }

  static Page _addNotePageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MaterialPage(child: AddNotePage());
  }

  static GoRouter goRoute = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: home,
        path: "/",
        pageBuilder: _homePageBuilder,
        routes: [
          GoRoute(
            name: addNote,
            path: "add-note",
            pageBuilder: _addNotePageBuilder,
          ),
          GoRoute(
            name: editNote,
            path: "edit-note",
            pageBuilder: _editNotePageBuilder,
          ),
        ],
      ),
    ],
  );
}
