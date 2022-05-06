import 'package:flutter/material.dart';
import 'package:medicos_app/core/constants/image_constant.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../container/icon_container.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, this.imageUrl, this.isShop = false, this.onTap})
      : super(key: key);

  final String? imageUrl;
  final bool isShop;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.goodMorning.locale,
            style: context.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.primary)),
        isShop
            ? IconContainer(
                iconName: ImageConstants.instance.shoppingIconImage.toIconPng)
            : _profileAvatar(context)
      ],
    );
  }

  Widget _profileAvatar(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: context.height * 0.05,
          width: context.width * 0.1,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: imageUrl != null
              ? Image.network(imageUrl!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                      ImageConstants.instance.profileImage.toImagePng,
                      fit: BoxFit.fill))
              : Image.asset(ImageConstants.instance.profileImage.toImagePng,
                  fit: BoxFit.fill),
        ),
      ),
    );
  }
}
