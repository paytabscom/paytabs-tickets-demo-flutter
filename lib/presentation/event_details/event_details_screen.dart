import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/presentation/router/router_names.dart';
import 'package:ticket_app/presentation/widgets/organizer_item.dart';
import '../../domain/models/event.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  final Event event;

  const EventDetailsScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  final ScrollController controller = ScrollController();

  final PageStorageBucket appBucket = PageStorageBucket();

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: Material(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetImages.eventDetails),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black,
                          AppColors.black.withOpacity(0.1),
                          AppColors.black.withOpacity(0.0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(top: 24, left: 4),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new),
                        color: AppColors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: AppColors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.title,
                            style: lightTicketDetailsTitle,
                          ),
                          const SizedBox(height: 24),
                          NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return false;
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    widget.event.date,
                                    style: lightTicketDetailsSubTitle,
                                  ),
                                  const SizedBox(width: 14),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.event.time,
                                    style: lightTicketDetailsSubTitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 12),
                              Column(children: [
                                Text(
                                  widget.event.location[0],
                                  style: lightTicketDetailsSubTitle,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  widget.event.location[1],
                                  style: lightTicketDetailsMinorText,
                                ),
                              ]),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AssetImages.musicIcon,
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                widget.event.genre,
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage(AssetImages.ticketsActive),
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Є${widget.event.prices[0]} - ${widget.event.prices[widget.event.prices.length - 1]}',
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage(AssetImages.organizer),
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                widget.event.organizer.name,
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 26,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 8),
                          Consumer(
                            builder: (context, ref, child) => Text(
                              widget.event.details,
                              style: lightTicketsSubtitle,
                              textAlign: TextAlign.justify,
                              maxLines: ref.showMore ? null : 2,
                              overflow:
                                  ref.showMore ? null : TextOverflow.ellipsis,
                            ),
                          ),
                          widget.event.details.willTextOverflow(
                                  lightTicketsSubtitle,
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 32)
                              ? Consumer(
                                  builder: (context, ref, child) => TextButton(
                                    onPressed: () => ref.toggleShowMore(),
                                    child: Text(
                                      ref.showMore ? 'Show Less' : 'Show more',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Updates',
                                style: lightTicketDetailsWhitePartTitle,
                              ),
                              Consumer(
                                builder: (context, ref, child) => Material(
                                  color: AppColors.transparent,
                                  child: InkWell(
                                    onTap: () => ref.toggleUpdateNotification(),
                                    child: Icon(
                                      ref.updateNotification
                                          ? Icons.notifications_active
                                          : Icons.notifications_none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          widget.event.updates.isNotEmpty
                              ? Consumer(
                                  builder: (context, ref, child) =>
                                      ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.event.updates[index].date,
                                          style: TextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          widget.event.updates[index].contents,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: AppColors.grey,
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLines: (ref.updatesReadMore ||
                                                  widget.event.updates.length ==
                                                      1)
                                              ? null
                                              : 2,
                                          overflow: (ref.updatesReadMore ||
                                                  widget.event.updates.length ==
                                                      1)
                                              ? null
                                              : TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 16),
                                        if (index == 0 &&
                                            !ref.updatesReadMore &&
                                            widget.event.updates.length > 1)
                                          TextButton(
                                            onPressed: () =>
                                                ref.toggleUpdatesReadMore(),
                                            child: const Text(
                                              'Show more',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ),
                                        if (index ==
                                                widget.event.updates.length -
                                                    1 &&
                                            ref.updatesReadMore)
                                          TextButton(
                                            onPressed: () =>
                                                ref.toggleUpdatesReadMore(),
                                            child: const Text(
                                              'Show less',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                    itemCount: ref.updatesReadMore
                                        ? widget.event.updates.length
                                        : 1,
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    'No updates yet',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 40),
                          Text(
                            'Location',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            child: Image(
                              image: AssetImage(AssetImages.map),
                            ),
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.event.location[0],
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.black.withOpacity(0.75),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.event.location[1],
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Organizers',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 24),
                          OrganizerItem(organizer: widget.event.organizer),
                          const SizedBox(height: 30),
                          Container(
                            color: AppColors.grey,
                            height: 1,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Є${widget.event.prices[0]} - Є${widget.event.prices[widget.event.prices.length - 1]}',
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      widget.event.title,
                                      style: const TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref.alreadyPurchased(widget.event)
                                        ? null
                                        : Navigator.pushNamed(
                                            context,
                                            RouterNames.paymentRoute,
                                            arguments: widget.event,
                                          );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      ref.alreadyPurchased(widget.event)
                                          ? AppColors.grey
                                          : AppColors.red,
                                    ),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 32)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    ref.alreadyPurchased(widget.event)
                                        ? 'Purchased'
                                        : 'Buy Tickets',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
