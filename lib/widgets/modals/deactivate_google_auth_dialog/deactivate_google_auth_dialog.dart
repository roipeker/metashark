import 'package:flutter/material.dart';
import 'package:metashark/commons.dart';
// part 'deactivate_google_auth_dialog_state.dart';

class DeactivateGoogleAuthDialog extends StatelessWidget {
  const DeactivateGoogleAuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        child: AppCard(
          // color: Colors.white,
          padding: kPad16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deactivation",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 20,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w700,
                ),
              ),
              kGap8,
              Text(
                "Are you sure you want to disable it?\nYour two-factor protection will be disabled until you create a new one.",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),

              kGap32,
              AppElevatedButton.primary(
                extended: true,
                child: Text('Deactivate'),
                onTap: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
