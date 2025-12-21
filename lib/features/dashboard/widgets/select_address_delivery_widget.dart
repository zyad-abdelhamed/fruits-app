import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/app_colors.dart';
import 'package:fruits_app/core/utils/extentions/theme_extention.dart';

class SelectAddressDeliveryWidget extends StatelessWidget {
  const SelectAddressDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = [
      DeliveryAddress(
        name: "Address 1",
        person: "John Doe",
        phone: "+000-11-1234567",
        details:
            "Room #1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates",
        isSelected: true,
      ),
    ];

    return Column(
      children: [
        /// Add New Address
        _AddNewAddressButton(),

        const SizedBox(height: 16),

        /// Address List
        Expanded(
          child: ListView.separated(
            itemCount: addresses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return AddressCard(address: addresses[index]);
            },
          ),
        ),
      ],
    );
  }
}

/// ================= ADD NEW ADDRESS =================
class _AddNewAddressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Text(
              "Add New Address",
              style: context.headlineSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.add, size: 22),
          ],
        ),
      ),
    );
  }
}

/// ================= ADDRESS CARD =================
class AddressCard extends StatelessWidget {
  final DeliveryAddress address;

  const AddressCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: address.isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Location Icon
            Icon(Icons.location_on_outlined, color: Colors.grey.shade600),

            const SizedBox(width: 12),

            /// Address Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(address.person, style: context.bodyLarge),
                  const SizedBox(height: 2),
                  Text(address.phone, style: context.bodyLarge),
                  const SizedBox(height: 6),
                  Text(address.details, style: context.bodyLarge),
                ],
              ),
            ),

            /// Selected Icon
            if (address.isSelected)
              const Icon(Icons.check_circle, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}

/// ================= MODEL =================
class DeliveryAddress {
  final String name;
  final String person;
  final String phone;
  final String details;
  final bool isSelected;

  DeliveryAddress({
    required this.name,
    required this.person,
    required this.phone,
    required this.details,
    required this.isSelected,
  });
}
