import 'package:contact_app60/cubit/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'builder_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListContactItem(
        listItem: ContactCubit
        .get(context)
        .favoriteList,
    contactType: 'Favorite',
    noContacts: 'No Favorite');
  }
}
