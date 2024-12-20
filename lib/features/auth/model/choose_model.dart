import 'package:jackelieson/gen/assets.gen.dart';

class ChooseModel {
  String icon;
  String title;
  ChooseModel({
    required this.icon,
    required this.title,
  });
}

List<ChooseModel> chooseHabitsList = [
  ChooseModel(
    icon: Assets.icons.workOutIcon,
    title: 'Work out',
  ),
  ChooseModel(
    icon: Assets.icons.dietIcon,
    title: 'Diet',
  ),
  ChooseModel(
    icon: Assets.icons.workOutIcon,
    title: 'Work out',
  ),
  ChooseModel(
    icon: Assets.icons.dietIcon,
    title: 'Diet',
  ),
  ChooseModel(
    icon: Assets.icons.workOutIcon,
    title: 'Work out',
  ),
  ChooseModel(
    icon: Assets.icons.dietIcon,
    title: 'Diet',
  ),
];
