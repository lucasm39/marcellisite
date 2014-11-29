---
layout: post
title: "Generating the Kitty Page"
subtitle: "That was an interesting exercise."
header-img: "bitty1.jpg"
tag: code
collection: "Coding and Technology"
collection-url: "/coding"
---

[I really like my cat.](/kitty)

I wanted to make a page where I could drop photos of my cat and they would automagically populate the page, but since I'm using [Jekyll](http://jekyllrb.com/) that made it a bit complicated. 

My initial idea was to simply use a liquid for loop to loop through a folder of cleverly named photos (1.jpg, 2.jpg etc) like so:

{% raw %}
`{% for i in (1..5) %}` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<img src="/img/bitty/{{ i }}.jpg">` <br>
`{% endfor %}`
{% endraw %}

Which is actually a pretty elegant solution, but it has some problems. For one, every time I put a new photo in, I would have to come and increase the counter manually. There is also no way to for me to include a little blurb underneath each photo.

I knew that Jekyll wouldn't give me anything like this out of the box, so it'd have to be some sort of plugin. I knew that I couldn't be the only person who wants something like this, so I did a google search and found [this](https://github.com/sillylogger/jekyll-directory/blob/master/_plugins/directory_tag.rb).

This plugin generates a directory list according to the sames rules as `ls` on unix systems. I realized that by naming my pictures what I want the blurb to be, I could append it underneath using the `slug` attribute it creates for me. However, the files would be listed in alphabetical order, when what I wanted was chronological order, with the newest at the top.

It was almost perfect! I just added one little line of code:

`slug.gsub!(/\d+/, '')`

This removed any numbers from the slug, which means I could prepend numbers to my filenames to make them showup in the order I wanted. I chose to prepend them with 3 digits, effectivley giving me 899 photos on the page before I have to figure out a better way. 

Once I did that, it was a simple matter of writing a little for loop like so:

{% raw %}
`<div class="img-center">` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`{% directory path: img/bitty reverse: true %}` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<img src="{{ file.url }}"` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`alt="{{ file.name }}"` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`datetime="{{ file.date | date_to_xmlschema }}"/>` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<p>{{ file.slug }}</p>` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`{% enddirectory %}` <br>
`</div>` <br>
{% endraw %}

With the `img-center` class looking like so:

`.img-center {` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`text-align: center;` <br>
`}` <br>
`.img-center img {` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`max-width: 100%;` <br>
`}` <br>
`.img-center p {` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`font-size: 18px;` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`margin-top: 10px;` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`font-style: italic;` <br>
`}`

And then it worked like magic!