import 'dart:io';

import 'package:file_fetcher/file_fetcher.dart';
import 'package:file_fetcher/models/file_property.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _fileFetcherPlugin = FileFetcher();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: _fileFetcherPlugin.getAllImages(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        final fileResult = snapshot.data;
                        if (fileResult?.results != null) {
                          if (fileResult!.results!.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: fileResult.results!.length,
                                itemBuilder: (context, index) {
                                  return Image.file(
                                      File(fileResult.results![index].path!));
                                });
                          } else {
                            return const Center(
                              child: Text("results is empty"),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text("results received null response"),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text("snapshot has no data"),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text("snapshot has error"),
                      );
                    }
                  }),
              FutureBuilder(
                  future: _fileFetcherPlugin.getAllVideos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        final fileResult = snapshot.data;
                        if (fileResult?.results != null) {
                          if (fileResult!.results!.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: fileResult.results!.length,
                                itemBuilder: (context, index) {
                                  FileProperty file =
                                      fileResult.results![index];
                                  return Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                              Icons.video_camera_back_rounded),
                                          Text(file.name ?? "")
                                        ],
                                      ));
                                });
                          } else {
                            return const Center(
                              child: Text("results is empty"),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text("results received null response"),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text("snapshot has no data"),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text("snapshot has error"),
                      );
                    }
                  }),
              FutureBuilder(
                  future: _fileFetcherPlugin.getAllAudios(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        final fileResult = snapshot.data;
                        if (fileResult?.results != null) {
                          if (fileResult!.results!.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: fileResult.results!.length,
                                itemBuilder: (context, index) {
                                  FileProperty file =
                                      fileResult.results![index];
                                  return Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.music_note),
                                          Text(file.name ?? "")
                                        ],
                                      ));
                                });
                          } else {
                            return const Center(
                              child: Text("results is empty"),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text("results received null response"),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text("snapshot has no data"),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text("snapshot has error"),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
