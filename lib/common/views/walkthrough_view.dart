import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalkthroughView extends ConsumerStatefulWidget {
  const WalkthroughView({super.key});

  static const routeName = '/walkthrough';

  @override
  ConsumerState<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends ConsumerState<WalkthroughView> {
  PageController controller = PageController();
  PageController subController = PageController();
  bool isLastPage = false;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
