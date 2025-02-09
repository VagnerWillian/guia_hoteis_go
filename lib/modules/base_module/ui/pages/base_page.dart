import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

import '../../../../_shared/_shared.dart';
import '../components/_components.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return responsive.ResponsiveScaledBox(
      width: responsive.ResponsiveValue<double>(
        context,
        conditionalValues: [
          const responsive.Condition.between(value: 408, start: 0, end: 580),
          const responsive.Condition.between(value: 720, start: 580, end: 1000),
          const responsive.Condition.between(value: 1300, start: 1000, end: 20000),
        ],
      ).value,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        drawer: const LeftDrawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const SvgIcon(SvgIconData.menu),
              );
            },
          ),
          title: const BubbleNavigationBar(),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const SvgIcon(SvgIconData.search),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size(double.maxFinite, 30),
            child: LocateSelectionBar(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: const RouterOutlet(),
        ),
      ),
    );
  }
}
