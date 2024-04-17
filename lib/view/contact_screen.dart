import 'package:contact_app60/cubit/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'builder_item.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        return ListContactItem(
          listItem: ContactCubit
            .get(context)
            .contactsList,
          contactType: 'noFavorite',
          noContacts: 'No Contacts',



        );
      },
    );
  }
}
