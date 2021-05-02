# Example-Promela-Spin-Traffic-Light

1. Model in Promela the following system: 

• a traffic light can light up three colors (red, orange, green), and make its display flash.

• on initialization, the light becomes flashing orange, then enters "the standard cycle" of French lights (red then green then orange then red,..).

• at any time, a failure may occur, and the light becomes permanently flashing amber.

2. Add an observer who checks that the colors are chained in the correct order.
