import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/_core.dart';
import '../../blocs/_blocs.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration.zero,
                  imageUrl: 'https://images.unsplash.com/'
                      'photo-1631049307264-da0ec9d70304?q=80&w=1932&auto=format&fit=crop',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Talismã Motel',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Barueri - São Paulo',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '30% de desconto',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'a partir de R\$ 42,52',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Modular.get<HomeBloc>().add(
                                FailureEvent(
                                  AppFailure(
                                    title: 'Exemplo de Erro',
                                    message: 'Erro criado para mostrar um exemplo de erro',
                                  ),
                                ),
                              );
                            },
                            label: const Text('reservar'),
                            icon: const Icon(Icons.arrow_forward_ios),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00BC8A),
                              foregroundColor: Colors.white,
                              iconColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              minimumSize: const Size(double.maxFinite, 20),
                              fixedSize: const Size(double.maxFinite, 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
