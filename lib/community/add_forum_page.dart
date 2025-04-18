import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddForumPage extends ConsumerStatefulWidget {
  const AddForumPage({super.key});

  @override
  ConsumerState<AddForumPage> createState() => _AddForumPageState();
}

class _AddForumPageState extends ConsumerState<AddForumPage> {
  late TextEditingController _forumNameController;

  @override
  void initState() {
    super.initState();
    _forumNameController = TextEditingController();
  }

  @override
  void dispose() {
    _forumNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}