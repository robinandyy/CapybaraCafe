(define (domain capy-cafe)

    (:requirements
        :typing
        :strips
    )

    (:types
        object
        room - object
        locateable - object
        locatablehuman - locateable
        locatableanimal - locateable
        customer employee - locatablehuman
        capybara - locatableanimal

    )

    (:predicates
        (in ?r - room ?l - locatable)
        (bathed ?capy - capybara)
        (coffee-made ?e - employee)
        (played ?c - customer ?capy - capybara)
        (wants-coffee ?c - customer)
        (served-coffee ?c - customer)
        (paid ?c - customer ?e - employee)
        (hungry ?capy - capybara)
        (well-fed ?capy - capybara)
        (sleepy ?capy - capybara)
        (well-rested ?capy - capybara)

    )


    ; move a human to a different room
    (:action move

        :parameters (?lh - locatablehuman ?r1 ?r2 - room)

        :precondition (in ?r1 ?lh)

        :effect (and (in ?r2 ?lh)
                     (not (in ?r1 ?lh)))

    )
    
    ; capybaras must be moved to another room with the help of an employee
    (:action move-capybara

        :parameters (?e - employee ?capy - capybara  ?r1 ?r2 - room)

        :precondition (and (in ?r1 ?e)(in ?r1 ?capy))

        :effect (and (in ?r2 ?e)(in ?r2 ?capy)
                     (not (in ?r1 ?e))(not (in ?r1 ?capy)))

    )
    
    
    ; capybara needs to be bathed before it can play with people
    (:action bathe-capybara
        :parameters (?capy - capybara ?e - employee)
        :precondition (and (in bathroom ?capy)(in bathroom ?e))
        :effect (bathed ?capy)
    
    )
    
    
    ; capybara must be hungry and in the back-room to feed it
    (:action feed-capybara
        :parameters (?capy - capybara)
        :precondition (and (hungry ?capy)(in back-room ?capy))
        :effect (and (not (hungry ?capy))(well-fed ?capy))
    )
    
    ; capybara must be sleepy and in the back-room to nap
    (:action nap-capybara
        :parameters (?capy - capybara)
        :precondition (and (sleepy ?capy)(in back-room ?capy))
        :effect (and (not (sleepy ?capy))(well-rested ?capy))
    )
    
    
    ; customer enters coffee shop, they are craving coffee!
    (:action enter-customer 
        :parameters (?c - customer)
        :precondition (in reception ?c)
        :effect (wants-coffee ?c)
    )
    
    
    ; employee makes customer a coffee if the customer wants a coffee
    (:action make-coffee
        :parameters (?e - employee ?c - customer)
        :precondition (and (in cafe ?e)(in cafe ?c)(wants-coffee ?c))
        :effect (coffee-made ?e)
    )
    
    ; employee serves the coffee to the customer, and they now need to make coffee again if more people want some
    ; customer no longer wants coffee
    (:action serve-coffee
        :parameters (?e - employee ?c - customer)
        :precondition (and 
            (in cafe ?e)
            (in cafe ?c)
            (coffee-made ?e)
            (wants-coffee ?c))
        :effect (and 
            (not (coffee-made ?e))
            (not (wants-coffee ?c))
            (served-coffee ?c))
    )
    
    
    ; once customer has had coffee, they can play with the capybara
    ; to play, capybara must be well-rested, well-fed, and bathed
    (:action play-with-capybaras
        :parameters (?e - employee ?c - customer ?capy - capybara)
        :precondition (and 
                            (in playroom ?e)
                            (in playroom ?capy)
                            (in playroom ?c)
                            (bathed ?capy)
                            (well-rested ?capy)
                            (well-fed ?capy)
                            (served-coffee ?c)) 
                            
        ; after playing capybara wants food and sleep
        :effect (and 
                    (played ?c ?capy)
                    (not (well-fed ?capy))
                    (not (well-rested ?capy)))
    )
    
    
    ; customer pays in reception once they have had coffee and played with a capybara
    (:action pay-for-play
        :parameters (?c - customer ?e - employee ?capy - capybara)
        :precondition (and 
                (in reception ?c)
                (in reception ?e)
                (played ?c ?capy))
            
        :effect (paid ?c ?e)
    )
    

)