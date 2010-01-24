Feature: fetch band data

   In order to see my fave metal band data
   As a metalhead
   I want to fetch band data
   So that I can see it and improve my metal world knowledge
      
   @curr
   Scenario Outline: existing band
      Given I started the app
      When I ask for "<band_to_search>" band data
      Then band data should be:
	  | <band_name> | <band_genre> | <band_lyrical_themes> | <band_origin> | <band_formed_in> | <band_current_label> | <band_status> |

   Scenarios:
		| band_to_search | band_name | band_genre | band_lyrical_themes | band_origin | band_formed_in | band_current_label | band_status |
		| Trollfest | Trollfest | Folk Metal | Trolls, Drinking | Norway | 2003 | Twilight Vertrieb | Active |
		| Finntroll | Finntroll | Humppa Folk Metal | Trolls, Finnish Legends, Fantasy | Finland | 1997 | Century Media Records | Active | 

Scenario: fetch band discography
      Given I started the app
       When I ask for "Troll Gnet El" band data
       Then it should have the following albums:
        | Troll' Gnet El'          | 2003 |        |
        | Hangoverlainen Juhlat    | 2005 | 40     |
        | Konung Hop               | 2007 | 60     |
        | 1516/Орден Пресветлого & | 2009 |        |
