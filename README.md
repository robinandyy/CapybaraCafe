# CapybaraCafe
A capybara cafe PDDL model, where the cafe only succeeds if the capybaras are treated very well. 

This PDDL domain models a capybara café where employees make and serve coffee to customers, help customers play with capybaras, and receive payments from customers. The goal of the problem is for each customer to have paid an employee, which represents a full and successful service cycle.

# Goal: 
The goal is to have each customer pay and employee, meaning they have had had coffee, played with a capybara, and paid for the experience.

# Actions:

## Move human
Humans can move from room to room independently

## Move capybara
Capbaras need to switch rooms with the help of an employee. Depending on what the capybara needs (ex: food, a nap, play with a customer), it needs to be in the right room.

## Enter customer
A customer enters the building and now wants coffee

## Make coffee
Both an employee and customer must be in the cafe for the employee to make a customer coffee.

## Serve coffee
Once the coffee is made, it can be served to a customer, and the employee must make more coffee if another customer wants coffee.

## Play with capybaras
If a capybara is bathed, well-rested, and well-fed, it can be played with. The customer must be in the play-room and have already had coffee.

## Bathe capybara 
Bathe a capybara so it is no longer dirty. The capybara must be in the bathroom to get washed and with an employee.

## Feed capybara
Feed a capybara so it is no longer hungry. The capybara must be in the back-room to have food.

## Nap capybara
Give the capybara a nap to make sure they are well rested. Naps must happen in the back-room as well. 
