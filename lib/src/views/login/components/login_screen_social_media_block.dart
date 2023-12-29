import 'package:flutter/material.dart';
import 'package:flutter_task_12/core/custom_widgets/blocks/custom_social_media_block.dart';

class LoginScreenSocialMediaBlock extends StatelessWidget {
  final void Function()? onTapFacebook ; 
  final void Function()? onTapGoogle; 
  const LoginScreenSocialMediaBlock({super.key , 
    this.onTapFacebook, 
    this.onTapGoogle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: CustomSocialMediaBlock(
              margin: const EdgeInsets.only(bottom: 50),
              text: 'Or login with social media ',
              onTapFacebook: onTapFacebook,
              onTapGoogle: onTapGoogle,
            ),
          )
        ],
      ),
    );
  }
}
