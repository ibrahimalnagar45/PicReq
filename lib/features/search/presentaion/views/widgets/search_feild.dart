import 'package:picreqapplication/features/home/presentaion/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class Searchfeild extends StatelessWidget {
  const Searchfeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? type;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(kPrimaryPadding)),
      child: TextField(
        onSubmitted: (data) {
          type = data;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeView(
                  type: type ?? 'general',
                );
              },
            ),
          );
        },
        enableSuggestions: true,
        autofocus: true,
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeView(
                      type: type ?? 'general',
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/**  BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchEnabled) {
                return TextField(
                  enabled: state.enabled,
                  onSubmitted: (data) {
                    BlocProvider.of<SearchCubit>(context).disable();
                    type = data;
                    type == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const GeneralView();
                              },
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return GeneralView(
                                  type: type!,
                                );
                              },
                            ),
                          );
                  },
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        type == null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const GeneralView();
                                  },
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GeneralView(
                                      type: type!,
                                    );
                                  },
                                ),
                              );
                      },
                      icon: const Icon(Icons.search),
                      color: Colors.black,
                    ),
                    contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                    border: InputBorder.none,
                  ),
                );
              } else if (state is SearchDisabled) {
                return TextField(
                  enabled: state.enabled,
                  onSubmitted: (data) {
                    BlocProvider.of<SearchCubit>(context).disable();
                    type = data;
                    type == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const GeneralView();
                              },
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return GeneralView(
                                  type: type!,
                                );
                              },
                            ),
                          );
                  },
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        type == null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const GeneralView();
                                  },
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GeneralView(
                                      type: type!,
                                    );
                                  },
                                ),
                              );
                      },
                      icon: const Icon(Icons.search),
                      color: Colors.black,
                    ),
                    contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                    border: InputBorder.none,
                  ),
                );
              } else {
                return TextField(
                  enabled: false,
                  onSubmitted: (data) {
                    BlocProvider.of<SearchCubit>(context).disable();
                    type = data;
                    type == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const GeneralView();
                              },
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return GeneralView(
                                  type: type!,
                                );
                              },
                            ),
                          );
                  },
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        type == null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const GeneralView();
                                  },
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return GeneralView(
                                      type: type!,
                                    );
                                  },
                                ),
                              );
                      },
                      icon: const Icon(Icons.search),
                      color: Colors.black,
                    ),
                    contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                    border: InputBorder.none,
                  ),
                );
              }
            },
          ), */
