import 'package:flutter/material.dart';
import 'package:petgogu/utils/my_utils.dart';

class ProfileTile extends StatelessWidget {
  final String tileName;
  final IconData tileIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(
                  0,
                  1,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  tileIcon,
                  color: MyUtils().randomColour,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    tileName,
                    style: const TextStyle(
                      color: Color(0xFF57636C),
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.9, 0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF57636C),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  const ProfileTile({
    super.key,
    required this.tileName,
    required this.tileIcon,
    required this.onTap,
  });
}
