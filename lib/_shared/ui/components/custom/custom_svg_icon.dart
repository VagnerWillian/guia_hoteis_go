import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgIconData {
  logo('assets/images/logo_white.svg'),
  menu('assets/icons/menu.svg'),
  search('assets/icons/buscar.svg'),
  goNow('assets/icons/ir-agora.svg'),
  goAfter('assets/icons/ir-depois.svg'),
  megafone('assets/icons/megafone.svg'),
  bug('assets/icons/bug.svg'),
  config('assets/icons/configuracoes.svg'),
  help('assets/icons/ajuda.svg'),
  myAccount('assets/icons/minha-conta.svg'),
  hearth('assets/icons/coracao2.svg'),
  reviews('assets/icons/reviews.svg'),
  myReservations('assets/icons/minhas-reservas.svg');

  final String asset;
  const SvgIconData(this.asset);
}

class SvgIcon extends StatelessWidget {
  final SvgIconData svgIconData;
  final Color? color;
  final double? size;
  final EdgeInsets? padding;

  const SvgIcon(
    this.svgIconData, {
    super.key,
    this.color,
    this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SvgPicture.asset(
            svgIconData.asset,
            width: size ?? 18,
            colorFilter: ColorFilter.mode(
              color ?? IconTheme.of(context).color!,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
