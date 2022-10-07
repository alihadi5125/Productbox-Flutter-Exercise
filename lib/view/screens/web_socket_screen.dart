import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/controller/cubits/web_socket_cubit/web_socket_chat_cubit.dart';
import 'package:productbox_flutter_exercise/controller/web_socket_controller.dart';

class WebSocketScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebSocketScreenState();
}

class WebSocketScreenState extends State<WebSocketScreen> {
  @override
  void initState() {
    WebSocket.messages.clear();
    context.read<WebSocketChatCubit>().enableStream();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose!');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("SchedulerBinding");
      if (!mounted) return;
      context.read<WebSocketChatCubit>().dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff293462),
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff0CB2BE),
        title: const Text("WebSocket Chat"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 70.sp,
              left: 0,
              right: 0,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                child: BlocBuilder<WebSocketChatCubit, WebSocketChatState>(
                  builder: (context, state) {
                    if (state is WebSocketChatLoaded ||
                        state is WebSocketChatLoading) {
                      return ListView.builder(
                        itemCount: WebSocket.messages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 300.sp,
                            margin: EdgeInsets.only(
                              left: WebSocket.messages[index].isMe ? 40.sp : 0,
                              right: WebSocket.messages[index].isMe
                                  ? 0
                                  : 40.sp, //else margin at right
                            ),
                            child: Card(
                              color: WebSocket.messages[index].isMe
                                  ? const Color(0xff008089)
                                  : const Color(0xff226582),
                              //if its my message then, blue background else red background
                              child: Container(
                                width: double.infinity,
                                height: 100.sp,
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        child: Text(
                                          WebSocket.messages[index].isMe
                                              ? "ID: ME"
                                              : "ID: ${WebSocket.messages[index].userid}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 10.sp, bottom: 10.sp),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                              "Message: ${WebSocket.messages[index].message}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17.sp,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Connect to server.. Please Wait",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 18.sp),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 70.sp,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: TextField(
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                              controller: WebSocket.messageEditingController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.white),
                                ),
                                hintText: "Enter your Message",
                                hintStyle:
                                    const TextStyle(color: Colors.white60),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          context.read<WebSocketChatCubit>().sendMessage(
                              customMessage: WebSocket
                                  .messageEditingController.text
                                  .trim());
                          WebSocket.messageEditingController.clear();
                          if (WebSocket.messageEditingController.text != "") {}
                        },
                        icon: Icon(Icons.send),
                        color: Colors.white,
                        iconSize: 33.sp,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
