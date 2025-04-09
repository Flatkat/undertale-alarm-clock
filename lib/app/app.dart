import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'tabs/tabs.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabs = const <Widget>[
    AlarmTab(),
    StopwatchTab(),
    ClocksTab(),
  ];

  final List<String> _tabsName = const <String>['Alarm', 'Stopwatch', 'Clock'];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: _currentIndex, length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index != _currentIndex &&
          !_tabController.indexIsChanging) {
        setState(() => _currentIndex = _tabController.index);
      }
    });
  }

  void _onTap(int index) {
    if (_currentIndex != index) {
      setState(() => _currentIndex = index);
      _tabController.animateTo(
        index,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const AppDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            )
          ],
          bottom: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              controller: _tabController,
              onTap: _onTap,
              tabs: _tabsName
                  .asMap()
                  .map<int, Tab>(
                      (int index, String tabName) => MapEntry<int, Tab>(
                            index,
                            Tab(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _currentIndex == index
                                      ? const Color.fromARGB(220, 220, 220, 220)
                                      : null,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    tabName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                            color: _currentIndex == index
                                                ? const Color.fromARGB(
                                                    255, 43, 43, 43)
                                                : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ))
                  .values
                  .toList()),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabs,
        ));
  }
}
