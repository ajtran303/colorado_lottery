### Iteration 4

- Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
- All of the setup remains the same, make sure you have registered and charged contestants for all of the games.


- The #draw_winners method returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants

- Because the array for #winners will be populated randomly, we cannot guarantee its contents, but we can guarantee that it will be an array of hashes that is the same length as the number of games we have. An example, based on our setup, the return value could be:

<code>
[{"Winston Churchill"=>"Cash 5"},
{"Frederick Douglas"=>"Mega Millions"},
{"Grace Hopper"=>"Pick 4"}]
</code>

- To test the #announce_winner method, you will need to stub the return value of #winners.

```ruby

pry(main)> lottery.draw_winners
#=> "2020-04-07"

pry(main)> lottery.winners.class
#=> Array

pry(main)> lottery.winners.first.class
#=> Hash

pry(main)> lottery.winners.last.class
#=> Hash

pry(main)> lottery.winners.length
#=> 3

# Based on the example return value of #winners above in the iteration 4 directions, the announce_winner method would then return the following:

pry(main)> lottery.announce_winner("Pick 4")
#=> "Grace Hopper won the Pick 4 on 04/07"

pry(main)> lottery.announce_winner("Cash 5")
#=> "Winston Churchill won the Cash 5 on 04/07"

pry(main)> lottery.announce_winner("Mega Millions")
#=> "Frederick Douglas won the Mega Millions on 04/07"
```
