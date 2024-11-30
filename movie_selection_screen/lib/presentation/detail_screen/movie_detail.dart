import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_selection_screen/model.dart';
import 'package:movie_selection_screen/presentation/detail_screen/widgets/button_ticket.dart';
import 'package:movie_selection_screen/presentation/detail_screen/widgets/time_selection.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  const MovieDetail({super.key, required this.movie});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height * 0.61,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Hero(
                tag: widget.movie.title,
                transitionOnUserGestures: true,
                child: Image.network(
                  widget.movie.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: _SliverAppBarBottom(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MovieTitleAndTicketPrice(movie: widget.movie),
                      const SizedBox(height: 20),
                      _MovieDescription(movie: widget.movie),
                      const SizedBox(height: 20),
                      _MovieDetails(movie: widget.movie),
                      const SizedBox(height: 30),
                      const TimeSelection(),
                      const SizedBox(height: 30),
                      const TicketButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarBottom extends StatelessWidget {
  const _SliverAppBarBottom();

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Transform.translate(
        offset: const Offset(0, 1),
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Container(
              width: 65,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MovieTitleAndTicketPrice extends StatelessWidget {
  const _MovieTitleAndTicketPrice({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 5),
                Text(
                  "Director: ${movie.director}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            "Ticket: \$${movie.price}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 500),
      child: Text(
        movie.description,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Genre", movie.genre),
          _buildDetailRow("Release Date", movie.releaseDate),
          _buildDetailRow("Duration", movie.duration),
          _buildDetailRow("Rating", movie.rating),
          _buildDetailRow("Age Restriction", movie.ageRestriction),
          _buildDetailRow("Cast", movie.cast),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
