import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class ConditionTagListTile extends StatelessWidget {
  const ConditionTagListTile({Key? key, required this.tag, required this.value, this.onChanged, this.enabled}) : super(key: key);
  final ProductTag tag;
  final bool value;
  final void Function(bool?)? onChanged;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    return CheckboxListTile(
      enabled: enabled,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(tag.value ?? '', style: mediumTextStyle),
      value: value,
      onChanged: onChanged,
    );
  }
}
