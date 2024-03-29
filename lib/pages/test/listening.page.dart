import 'package:flutter/material.dart';
import 'package:oyna/app/background_audio.controller.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_widgets.dart';
import 'package:oyna/model/listening_card.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/pages/test/audio.widget.dart';
import 'package:oyna/pages/test/success.page.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ListeningPage extends StatefulWidget {
  const ListeningPage({Key? key, required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  State<ListeningPage> createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  bool isRead = true;
  late VideoPlayerController _controller;
  bool isPlaying = false;
  List<ListeningTest> _listeningTestSelected = [];
  int count = 0;
  @override
  void initState() {
    if (widget.oneOfFour.listeningCards!.first.video != null)
      _controller = VideoPlayerController.asset(
          widget.oneOfFour.listeningCards!.first.video!)
        ..initialize().then((_) {
          setState(() {});
        });
    super.initState();
  }

  bool isSelected(ListeningTest t) {
    if (_listeningTestSelected.length == count + 1 &&
        _listeningTestSelected[count] == t) return true;
    return false;
  }

  @override
  void didUpdateWidget(covariant ListeningPage oldWidget) {
    _controller.pause();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    var provider = Provider.of<BackgroundAudio>(context, listen: false);

    provider.start();
    _controller.pause();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.oneOfFour.listeningCards!.first.video != null)
          _controller.pause();
        Provider.of<BackgroundAudio>(context, listen: false).start();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'Тыңдалым',
            style: AppTheme.of(context).title1.override(
                  fontFamily: 'Outfit',
                  color: AppTheme.of(context).secondaryBackground,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: AppTheme.of(context).primaryBackground,
        body: isRead
            ? _buildIsRead(widget.oneOfFour)
            : _buildTask(widget.oneOfFour),
      ),
    );
  }

  Widget _buildIsRead(OneOfFour oneOfFour) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.oneOfFour.listeningCards!.first.audio == null &&
                    _controller.value.isInitialized
                ? InkWell(
                    onTap: () {
                      print('fdsaf');
                      if (!isPlaying) {
                        _controller.play();

                        Provider.of<BackgroundAudio>(context, listen: false)
                            .stop();

                        isPlaying = true;
                      } else {
                        _controller.pause();
                        Provider.of<BackgroundAudio>(context, listen: false)
                            .start();
                        isPlaying = false;
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio * 1,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : AudioWidget(
                    audio: widget.oneOfFour.listeningCards!.first.audio!),
            oneOfFour.listeningCards![count].textRu != ''
                ? Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.of(context).primaryColor!),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Субтитры',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          oneOfFour.listeningCards![count].textRu,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                if (widget.oneOfFour.listeningCards!.first.audio == null)
                  _controller.pause();
                Provider.of<BackgroundAudio>(context, listen: false).start();
                setState(() {
                  isRead = false;
                });
              },
              child: FilledButtonWidget(text: 'Приступить к заданию'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTask(OneOfFour oneOfFour) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Задание на понимание текста:',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              oneOfFour.topic,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              oneOfFour.listeningCards![count].question,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.oneOfFour.listeningCards?[count].test.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_listeningTestSelected.length < count + 1) {
                          _listeningTestSelected.add(widget
                              .oneOfFour.listeningCards![count].test[index]);
                        } else {
                          _listeningTestSelected[count] = widget
                              .oneOfFour.listeningCards![count].test[index];
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isSelected(widget
                                .oneOfFour.listeningCards![count].test[index])
                            ? AppTheme.of(context).primaryColor!
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppTheme.of(context).primaryColor!,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            widget.oneOfFour.listeningCards?[count].test[index]
                                    .text ??
                                '',
                            style: AppTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: isSelected(widget.oneOfFour
                                          .listeningCards![count].test[index])
                                      ? AppTheme.of(context).secondaryBackground
                                      : AppTheme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (_listeningTestSelected != [])
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: AppButtonWidget(
                      onPressed: () async {
                        int points = 0;
                        if (count + 1 == oneOfFour.listeningCards!.length) {
                          for (var element in _listeningTestSelected) {
                            if (element.isCorrect) {
                              points++;
                            } else {
                              points--;
                            }
                          }
                          await currentUserReference!.update(
                              createUserRecordData(
                                  description: currentUserDocument?.description,
                                  age: currentUserDocument?.age,
                                  displayName: currentUserDocument?.displayName,
                                  gender: currentUserDocument?.gender,
                                  photoUrl: currentUserDocument?.photoUrl,
                                  points: currentUserDocument?.points != null
                                      ? currentUserDocument!.points! + 1
                                      : 1));
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage(
                                        points: points,
                                      )));
                        } else {
                          setState(() {
                            count++;
                          });
                        }
                      },
                      text: count + 1 == oneOfFour.listeningCards!.length
                          ? 'Получить награду'
                          : 'Следующий вопрос',
                      options: AppButtonOptions(
                        width: 300,
                        height: 50,
                        color: Color(0xFF4B39EF),
                        textStyle: AppTheme.of(context).subtitle2.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
