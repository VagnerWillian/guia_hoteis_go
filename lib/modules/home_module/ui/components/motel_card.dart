import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MotelCard extends StatelessWidget {
  const MotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration.zero,
                            imageUrl: 'https://img.freepik.com/vetores-premium/'
                                'vetor-digitado-de-design-de-logotipo-de-motel-simples_434503-618.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'motel talismã',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  height: 1,
                                ),
                          ),
                          Text(
                            'barueri - sp',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orangeAccent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                    Text(
                                      '4.8',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(
                                    '537 avaliações',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontSize: 15),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, size: 15),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.grey.shade400,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
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
                      imageUrl: 'https://images.unsplash.com/photo-1535312800630-1c173409799a',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Suíte Dubai',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    _buildItems(context, 'assets/images/garagem-privativa.svg'),
                    _buildItems(context, 'assets/images/frigobar.svg'),
                    _buildItems(context, 'assets/images/cadeira-erotica.svg'),
                    _buildItems(context, 'assets/images/hidro.svg'),
                    _buildItems(context, 'assets/images/pole-dance.svg'),
                    _buildItems(context, 'assets/images/piscina.svg'),
                    Row(
                      children: [
                        Text(
                          'ver\ntodos',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                _buildPrice(context, '2 horas', 'R\$ 149,00'),
                _buildPrice(context, '4 horas', 'R\$ 199,00'),
                _buildPrice(context, 'Pernoite', 'R\$ 249,00'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context, String time, String price) => Container(
        height: 85,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                Text(
                  time,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.headlineSmall,
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

  Widget _buildItems(BuildContext context, String asset) {
    return Container(
      width: 55,
      height: 55,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        asset,
        width: 25,
        colorFilter: ColorFilter.mode(
          Colors.grey.withValues(alpha: .5),
          BlendMode.dstIn,
        ),
      ),
    );
  }
}
