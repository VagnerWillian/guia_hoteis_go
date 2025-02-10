import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

import '../../../../_shared/_shared.dart';
import '../../../../core/_core.dart';

class SuiteSlider extends StatelessWidget {
  final List<SuiteMotelEntity> suites;
  const SuiteSlider({required this.suites, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      itemCount: suites.length,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration.zero,
                    imageUrl: suites[index].pictures.first,
                    fit: BoxFit.cover,
                    placeholder: (_,__)=>const CustomRectShimmer(height: 250),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  suites[index].name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...suites[index]
                    .itemsCategory
                    .take(5)
                    .map((cat) => _buildItems(context, cat.icon)),
                Text(
                  'ver\ntodos',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.end,
                ),
                const SizedBox(width: 5),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          Column(
            children: suites[index]
                .periods
                .map(
                  (period) => _buildPrice(
                    context,
                    period.timeFormated,
                    period.price.getFormatToRealBr,
                    period.priceTotal.getFormatToRealBr,
                    period.discount?.discount,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPrice(
    BuildContext context,
    String time,
    String price,
    String priceTotal,
    double? discount,
  ) =>
      Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      time == '12 horas' ? 'Pernoite' : time,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(width: 10),
                    Visibility(
                      visible: discount != null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).textTheme.bodySmall!.color!),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          '${discount?.round()}% off',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: priceTotal,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: discount == null ? null : Colors.grey.withValues(alpha: .5),
                              decoration: discount == null ? null : TextDecoration.lineThrough,
                              decorationColor: Colors.grey.withValues(alpha: .5),
                            ),
                      ),
                      if (discount != null)
                        TextSpan(
                          text: ' $price',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      );

  Widget _buildItems(BuildContext context, String url) {
    return Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(imageUrl: url),
    );
  }
}
