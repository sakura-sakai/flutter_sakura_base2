import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../hook/asset_video_player_controller.hook.dart';
import '../../widgets/stless/assets_gen/assets.gen.dart';

class VideoPage extends HookConsumerWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoController = useAssetVideoController(
      asset: Assets.videos.bigbuckbunny,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(videoController),
        ),
      ),
    );
  }
}
