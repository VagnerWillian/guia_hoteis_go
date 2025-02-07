import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../_shared/_shared.dart';
import '../../../../core/_core.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.2,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFF4B38),
                              Color(0xFFFF014A),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading:
                                  const SvgIcon(SvgIconData.goAfter, size: 25, color: Colors.white),
                              title: FittedBox(
                                child: Text(
                                  'go fidelidade',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_circle_right,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'amucule selinhos e troque por reservas grátis.\n'
                              'vale em todos os motéis e horários!',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildMenuItem(icon: SvgIconData.myAccount, name: 'minha conta'),
                            _buildMenuItem(
                              icon: SvgIconData.myReservations,
                              name: 'minhas reservas',
                            ),
                            _buildMenuItem(icon: SvgIconData.reviews, name: 'minhas avaliações'),
                            _buildMenuItem(icon: SvgIconData.hearth, name: 'meus motéis'),
                            _buildMenuItem(icon: SvgIconData.help, name: 'ajuda'),
                            _buildMenuItem(icon: SvgIconData.config, name: 'configurações'),
                            _buildMenuItem(icon: SvgIconData.bug, name: 'comunicar problema'),
                            _buildMenuItem(
                              icon: SvgIconData.megafone,
                              name: 'tem um motel? faça parte',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'versão 2.0.087',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuItem({required SvgIconData icon, required String name}) => Container(
        height: 60,
        color: Theme.of(context).colorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: Center(
          child: ListTile(
            onTap: () => Modular.to.pushNamed(
              AppRoutes.genericRoute(name: name),
              arguments: name,
            ),
            leading: SvgIcon(
              icon,
              size: 20,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
            title: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ),
      );
}
