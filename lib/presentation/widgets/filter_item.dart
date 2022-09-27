import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';
import '../../domain/models/filter.dart';

class FilterItem extends StatelessWidget {
  final Filter filter;
  final bool selected;
  final Function()? onTap;
  const FilterItem({
    Key? key,
    required this.filter,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: selected ? filter.color : AppColors.grey.withOpacity(0.8),
              spreadRadius: selected ? 2 : 0.5, //extend the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: filter.color.withOpacity(0.1),
                child: SvgPicture.asset(
                  filter.image,
                  height: 18,
                  color: filter.color,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                filter.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: filter.color,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
