---
layout: post
title: "Second Motivation Monday"
subtitle: "Sometimes the solution requires thought."
header-img: "motivation2.jpg"
tag: motivation
collection: "Motivation Monday"
collection-url: "/motivation"
credit: "http://asadchishti.com"
---

With the recent launch of my [projects](/projects) page, I ran into a whole set of problems. The first most obvious one is the lack of mobile support, but I'm working on that. A much more subtle and annoying one is this:
<br>

<div class="img-center">
	<img src="/img/2014Dec/before.png" title="Seriously.">
	<p> Before Mouseover </p>
	<img src="/img/2014Dec/after.png" title="Seriously.">
	<p> After Mouseover </p>
</div>

If you don't see it, look at the portrait of Euler. It gets slightly smaller after mousing over for no real reason. 

This drove me insane. I spent a long time in the "inspect element" portion of chrome trying different things, but then I realized something, what if I'm approaching it all wrong?

First I swapped the positions. I noticed that the first table cell always shrinks, regardless of whats in it. So I came up with a really elegant solution.

I made an empty table cell like this:

{% gist lucasmarcelli/b8eb146408783fd3ddb4 %}

and used the !important tag in the css file to override what gets inherited and make it an invisible cell.

{% gist lucasmarcelli/4cd273b4cee214656d66 %}

This worked perfectly! ..Now for the stretch into a metaphor!

Sometimes the answer requires a lot of creativity. Prepare to deal with problems in a way that you might not expect. It was certainly not my first thought to make an empty cell, but when I came up with the solution it really felt like it should have been staring me in the face. Remember that the tools you use to solve problems are dumb and that often enough, your own creativity that will end up getting you a great solution.

Coming up with creative solutions is really important, especially in programming. We'd still be using bubble sort if no one thought to improve the way we do things creatively. Learning how to program really does teach you to think out of the box, and it can be applied to real life too. Don't give up on any problems, always strive to push forward and come up with better ways to do things.

As always, I love you all. 