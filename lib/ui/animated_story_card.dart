// 1. Basic Story Card with Animation
import 'package:flutter/material.dart';
import 'package:hacker_news_app/domain/entity/story.dart';
import 'package:hacker_news_app/ui/stories/view_model/state/story_list_state.dart';
import 'package:hacker_news_app/ui/stories/view_model/story_list_view_model.dart';
import 'package:provider/provider.dart';

class AnimatedStoryCard extends StatefulWidget {
  final Story story;
  final int index;
  final AnimationType animationType;

  const AnimatedStoryCard({
    super.key,
    required this.story,
    required this.index,
    required this.animationType,
  });

  @override
  State<AnimatedStoryCard> createState() => _AnimatedStoryCardState();
}

class _AnimatedStoryCardState extends State<AnimatedStoryCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    // Different animations based on type
    _setupAnimations();

    // Start animation with delay based on index
    Future.delayed(Duration(milliseconds: widget.index * 150), () {
      if (mounted) _controller.forward();
    });
  }

  void _setupAnimations() {
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    switch (widget.animationType) {
      case AnimationType.slideIn:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curve);
        break;

      case AnimationType.stackDrop:
        _slideAnimation = Tween<Offset>(
          begin: Offset(0.0, -0.5),
          end: Offset.zero,
        ).animate(curve);
        _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(curve);
        _rotationAnimation = Tween<double>(
          begin: (widget.index % 2 == 0 ? 0.1 : -0.1),
          end: (widget.index % 2 == 0 ? 0.02 : -0.02),
        ).animate(curve);
        break;

      case AnimationType.cascade:
        _slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.8),
          end: Offset.zero,
        ).animate(curve);
        break;

      case AnimationType.flipIn:
        _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
        _rotationAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(curve);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Add perspective for 3D effects
            ..translate(
              widget.animationType == AnimationType.slideIn ? _slideAnimation.value.dx * 300 : 0.0,
              widget.animationType == AnimationType.cascade ||
                      widget.animationType == AnimationType.stackDrop
                  ? _slideAnimation.value.dy * 100
                  : 0.0,
            )
            ..scale(
              widget.animationType == AnimationType.stackDrop ||
                      widget.animationType == AnimationType.flipIn
                  ? _scaleAnimation.value
                  : 1.0,
            )
            ..rotateZ(
              widget.animationType == AnimationType.stackDrop ? _rotationAnimation.value : 0.0,
            )
            ..rotateY(
              widget.animationType == AnimationType.flipIn
                  ? _rotationAnimation.value * 3.14159
                  : 0.0,
            ),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              margin: EdgeInsets.only(
                bottom: 12,
                top: widget.animationType == AnimationType.stackDrop ? widget.index * 2.0 : 0,
              ),
              child: Card(
                elevation: 4 + (widget.index * 0.5), // Stack effect
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey.shade50,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.story.title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.person, size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 4),
                          Text(
                            widget.story.createdBy,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_upward, size: 16, color: Colors.orange),
                          const SizedBox(width: 4),
                          Text(
                            widget.story.score.toString(),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 2. Animation Types Enum
enum AnimationType {
  slideIn,
  stackDrop,
  cascade,
  flipIn,
}

// 3. Enhanced Story List Screen with Animations
class StoryListScreen extends StatefulWidget {
  const StoryListScreen({super.key});

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> with TickerProviderStateMixin {
  AnimationType currentAnimation = AnimationType.cascade;
  late AnimationController _loadMoreController;
  late Animation<double> _loadMoreAnimation;

  @override
  void initState() {
    super.initState();
    _loadMoreController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _loadMoreAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _loadMoreController, curve: Curves.elasticOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StoryListViewModel>(
        builder: (context, viewModel, child) {
          return switch (viewModel.state) {
            StoryListLoading() => _buildLoadingAnimation(),

            StoryListSuccess(storyList: final stories) => _buildStoryList(
              context,
              viewModel,
              stories,
              isLoadingMore: false,
            ),

            StoryListLoadingMore(storyList: final stories) => _buildStoryList(
              context,
              viewModel,
              stories,
              isLoadingMore: true,
            ),

            StoryListError(errorMessage: final message) => _buildErrorState(
              context,
              viewModel,
              message,
            ),

            StoryListLoadingMore(storyList: final stories) => _buildStoryList(
              context,
              viewModel,
              stories,
              isLoadingMore: false,
            ),
            StoryListLoadingMoreError() => throw UnimplementedError(),
          };
        },
      ),
    );
  }

  Widget _buildLoadingAnimation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Rotating background circles
              for (int i = 0; i < 3; i++)
                TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 1500 + (i * 200)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.rotate(
                      angle: value * 2 * 3.14159 * (i % 2 == 0 ? 1 : -1),
                      child: Container(
                        width: 60.0 + (i * 20),
                        height: 60.0 + (i * 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue.shade300.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),

              // Center icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.auto_stories,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Loading Stories...',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryList(
    BuildContext context,
    StoryListViewModel viewModel,
    List<Story> stories, {
    bool isLoadingMore = false,
    String? loadMoreError,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: stories.length + (viewModel.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == stories.length) {
          return _buildLoadMoreIndicator(viewModel, isLoadingMore, loadMoreError);
        }
    
        // Trigger load more when near the end
        if (index == stories.length - 3 && viewModel.hasMore && !isLoadingMore) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            viewModel.loadTopStories();
            _loadMoreController.forward().then((_) {
              _loadMoreController.reset();
            });
          });
        }
    
        return AnimatedStoryCard(
          story: stories[index],
          index: index,
          animationType: currentAnimation,
        );
      },
    );
  }

  Widget _buildLoadMoreIndicator(
    StoryListViewModel viewModel,
    bool isLoadingMore,
    String? loadMoreError,
  ) {
    if (loadMoreError != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Error loading more: $loadMoreError'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: viewModel.loadTopStories,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (isLoadingMore) {
      return AnimatedBuilder(
        animation: _loadMoreAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: 0.8 + (_loadMoreAnimation.value * 0.2),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.blue.shade600),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Loading more stories...',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildErrorState(
    BuildContext context,
    StoryListViewModel viewModel,
    String message,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loadMoreController.dispose();
    super.dispose();
  }
}
