(define (problem capy-cafe1)

    (:domain capy-cafe)

    (:objects
        
        ; capybara names 
        baby-bara silly-bara sinister-bara - capybara
        
        ;employee names 
        jim-ployee lyn-ployee - employee
        
        ; highly normal customer names
        allouicious severus magnolia - customer
        
        ; rooms
        cafe bathroom playroom reception back-room - room

    )

    (:init
    
        ; baby-bara information
        (in playroom baby-bara)
        (hungry baby-bara)
        (sleepy baby-bara)
        
        ; silly-bara information
        (in playroom silly-bara)
        (sleepy silly-bara)
        (well-fed silly-bara)
        
        ; sinister-bara information
        (in back-room sinister-bara)
        (hungry sinister-bara)
        (well-rested sinister-bara)
        
        ; employee locations - they are both in the cafe 
        (in cafe jim-ployee)
        (in cafe lyn-ployee)
        
        ; all customer start in reception
        (in reception allouicious) 
        (in reception severus)
        (in reception magnolia)

    )

    (:goal
        (and
            ; each of the customers have paid an employee, meaning they have been served
            ; and played with a capybara
            (paid allouicious jim-ployee)
            (paid severus lyn-ployee)
            (paid magnolia jim-ployee)
            
        )

    )

)