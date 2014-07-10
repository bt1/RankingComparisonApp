RankingComparisonApp
====================

An iOS app that calculates two score between 0 to 1 based on the Wilson's score interval and average.  The app takes two inputs: total number of positive ratings and total number of negative ratings. The algorithms are as follows:

Lower bound of Wilson's score interval:
<br>
![ScreenShot](http://wpcontent.answcdn.com/math/8/5/c/85c967101aa9ce063811723aff5d0904.png)

Average:
<br>
(positive)/(positive+negative)
<br>
<br>
I created this app because it's a good way to demonstrate the problems of ranking based on quantity.  Often times, search results on the websites rank items based on their overall rating, never taking into consideration of how many ratings they have. For example, item A has 1 positive rating and 0 negative rating.  Item B has 10000 positive ratings and 100 negative ratings.

Plugging in the values for item A, we get:
<br>
![ScreenShot](https://s3.amazonaws.com/ranking_app/photo+1.PNG)
Plugging in the values for item B, we get:
<br>
![screenshot](https://s3.amazonaws.com/ranking_app/photo+2.PNG)

<br>
For item A, we can see the average score is a 1.0 while the wilson score is a 0.05.  For item B, we can see the two scores are about the same.  The latter score is fine because there are lots of ratings; however, in item A, we can clearly see that the average algorithm does not consider the number of ratings (it would rank item A higher than item B).  In most cases where the quantity and quality of the ratings should come into play, the wilson's score interval should be used instead of average.

<br>
Real world example: <a href="http://officialblog.yelp.com/2011/02/the-most-romantic-city-on-yelp-is.html">http://officialblog.yelp.com/2011/02/the-most-romantic-city-on-yelp-is.html</a>
