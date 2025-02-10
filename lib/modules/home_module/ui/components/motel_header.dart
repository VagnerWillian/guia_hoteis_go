import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/_core.dart';

class MotelHeader extends StatelessWidget {
  final MotelEntity motel;
  const MotelHeader({required this.motel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    imageUrl: motel.logo,
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
                    motel.fantasy,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          height: 1,
                        ),
                  ),
                  Text(
                    motel.district,
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
                              '${motel.reviewsAverage}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            '${motel.reviewsQuantity} avaliações',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
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
    );
  }
}
