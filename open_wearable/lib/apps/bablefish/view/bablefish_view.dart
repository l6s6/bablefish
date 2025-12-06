import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_wearable/apps/bablefish/view/recordings_list_view.dart';
import 'package:open_wearable/apps/bablefish/view/sessions_view.dart';

class BablefishView extends StatefulWidget {
  const BablefishView({super.key});

  @override
  State<BablefishView> createState() => _BablefishViewState();
}

class _BablefishViewState extends State<BablefishView> {
  static final titles = ["Sessions", "Recordings"];

  List<BottomNavigationBarItem> items(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: titles[0],
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: titles[1],
      ),
    ];
  }

  late PlatformTabController _controller;

  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _controller = PlatformTabController(initialIndex: 0);
    _tabs = [
      SessionsPage(),
      RecordingsListPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      tabController: _controller,
      bodyBuilder: (context, index) => IndexedStack(
        index: index,
        children: _tabs,
      ),
      items: items(context),
    );
  }
}
