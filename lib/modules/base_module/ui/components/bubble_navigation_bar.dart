import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../_shared/_shared.dart';

class BubbleNavigationBar extends StatefulWidget {
  const BubbleNavigationBar({super.key});

  @override
  State<BubbleNavigationBar> createState() => _BubbleNavigationBarState();
}

class _BubbleNavigationBarState extends State<BubbleNavigationBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabLabelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
        );
    var height = 35.0;

    return Container(
      height: height,
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Theme.of(context).colorScheme.surfaceBright,
        labelStyle: tabLabelStyle,
        indicator: BubbleTabIndicator(
          indicatorHeight: height,
          indicatorColor: Colors.white,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
        ),
        dividerHeight: 0.0,
        tabs: [
          _buildTab(
            text: 'ir agora',
            icon: const SvgIcon(SvgIconData.goNow),
          ),
          _buildTab(
            text: 'ir outro dia',
            icon: const SvgIcon(SvgIconData.goAfter),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({required String text, required Widget icon}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Expanded(child: Text(text, overflow: TextOverflow.fade)),
        ],
      );
}
