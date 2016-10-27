# Event Tracker

[Event Tracker - Hosted by Heroku](http://lr-event-tracker.herokuapp.com/)

![Alt text](./public/images/readme_img1.JPG?raw=true "Header IMG")

## The Problem

In today's fast-moving pace with so many things to do it is getting harder and to get and stay organized. There are countless ways to look up data on upcoming events such as the location, time, and how to buy tickets, but how easily accessable is this information? Can it all be found quickly in one place?

No, it always takes multiple clicks and page loads to find even the most basic data, and often times this data can only be found by visiting multiple websites.


## The Solution

My solution to this problem is Event Tracker, a simple app that can be accessable in both web and mobile formats. With one search entry a user is able to access all pertinent info for any performer's upcoming 10 events, including venue, time, ticket availability, lowest remaining ticket price, and a direct link to buy tickets.

This information is all shown on one page in an easy-to-read format. A user is also able to save any event to their profile page, for easy access later.

![Alt text](./public/images/readme_gif.gif?raw=true "Second IMG")

Results shown here are for a search of upcoming San Francisco 49ers events. All relevant info is available right on the same page, and specific ticket info is instantly displayed upon clicking 'Ticket Info' to allow for a cleaner, more readable interface.


### How I did it

This project was completed in my 6th week at Dev Bootcamp, and was built using Sinatra, Ruby, JavaScript (AJAX and JQuery), as well as both the SeatGeek and Giphy APIs.

When a user enters a search term, their input is sent through a parsing algorithm to construct a search URL that can be read by the SeatGeek and Giphy APIs. The response from the APIs is then parsed for only the relevent information, which is sent immidately to the front-end via AJAX where it is displayed in a readable and human-friendly format.