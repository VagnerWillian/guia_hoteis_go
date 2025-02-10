import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../_shared/_shared.dart';
import '../../../../core/_core.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 500),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgIcon(
                    SvgIconData.goNow,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'ir agora',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildDescription(context, 'veja as suites livres em tempo real'),
              _buildDescription(context, 'garanta a sua suíte antes de chegar lá'),
              _buildDescription(context, 'ganhe descontos especiais*'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Modular.to.pushNamed(AppRoutes.locationRoute),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text('QUERO IR AGORA'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, String description) => Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      );
}
