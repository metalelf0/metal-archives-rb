Feature: fetch band data

   In order to see my fave metal band data
   As a metalhead
   I want to fetch band data
   So that I can see it and improve my metal world knowledge
      
   Scenario: existing band
      Given I started the app
      When I ask for "Trollfest" band data
      Then band name should be "Trollfest"

   Scenario: fetch band discography
      Given I started the app
       When I ask for "Troll Gnet El" band data
       Then it should have the following albums:
        | Troll' Gnet El'          | 2003 |        |
        | Hangoverlainen Juhlat    | 2005 | 40     |
        | Konung Hop               | 2007 | 60     |
        | 1516/Орден Пресветлого & | 2009 |        |
