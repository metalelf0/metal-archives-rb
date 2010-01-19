Feature: fetch band data

   In order to see my fave metal band data
   As a metalhead
   I want to fetch band data
   So that I can see it and improve my metal world knowledge
      
   Scenario: existing band
      Given I started the app
      When I ask for "Trollfest" band data
      Then band name should be "Trollfest"
