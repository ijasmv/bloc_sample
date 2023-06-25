import 'package:bloc_sample/application/downloads/downloads_bloc.dart';
import 'package:bloc_sample/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<DownloadsBloc>(context)
            .add(const DownloadsEvent.getDownloadImages());
      },
    );
    return Scaffold(
      body: SafeArea(child: BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          return state.isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Container(
                      height: 200,
                      width: 70,
                      child: Image.network(
                          imageBaseUrl + state.downloads[0].posterPath!),
                    ),
                    Container(
                      height: 200,
                      width: 70,
                      child: Image.network(
                          imageBaseUrl + state.downloads[1].posterPath!),
                    ),
                    Container(
                      height: 200,
                      width: 70,
                      child: Image.network(
                          imageBaseUrl + state.downloads[2].posterPath!),
                    ),
                  ],
                );
        },
      )),
    );
  }
}
