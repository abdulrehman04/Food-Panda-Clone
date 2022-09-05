import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reasa/Services/LocationService/location_service.dart';
import 'package:reasa/UI/Dashboard/Checkout/Checkout%20Components/checkout_card_top.dart';
import 'package:reasa/widgets.dart';

checkoutDeliveryAddressCard() {
  LocationService location = Get.find<LocationService>();

  return Card(
    margin: const EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: checkoutCardTop(
            Icons.account_balance_wallet_outlined,
            "Delivery address",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: 100,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  location.currentLocation.value.latitude,
                  location.currentLocation.value.longitude,
                ),
                zoom: 15,
              ),
              myLocationEnabled: true,
              liteModeEnabled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: poppinsText(
            location.currentAddress,
            align: TextAlign.start,
          ),
        ),
      ],
    ),
  );
}
