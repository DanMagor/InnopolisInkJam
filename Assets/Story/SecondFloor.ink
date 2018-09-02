VAR STRENGTH = 10
VAR INTELLIGENCE = 10
VAR HP = 100

-> SECOND_FLOOR

=== SECOND_FLOOR === 

You see stairs leading upwards. 

* [I am ready!]
    -> MoveUp
->DONE

* [Look around]
    You decided to look around, but haven't found anything usefull.
    -> MoveUp
->DONE

=== MoveUp === 
    You've made first steps upwards.
    "...SQUEAK..."
    You: Ok, the stairs are very old. I should be more carefull.
    
    After each step it becomes darker. After last step you understood that you don't see anything. 
    
    -> CORRIDOR


->DONE


=== CORRIDOR === 
    "Wander here at absolute darkness is not a good idea", - you thought
    
    * [Conjure the fire]
    Fire appears in your hand
    {INTELLIGENCE >= 10:
        ~INTELLIGENCE = INTELLIGENCE + 10
        You have increased your INTELLIGENCE by 10 and it is {INTELLIGENCE}.
        The light illuminates the entire corridor
        -> SKELETON
    -else:
        Fire becomes more and more powerful and you can't cope with it. You are burned down.
        ->END
    }
    -> DONE
    
    * [At least I won't see monsters]
        You are rushing straightly waving with the sword. You do not pay attention to sounds.
        You have increased your STRENTHG by 10 and it is {STRENGTH}.
        ~STRENGTH = STRENGTH + 10
        Finally you see light. You went towards that light.
        -> HALL
    -> DONE
    === SKELETON === 
        You see in front of you skeleton. 
        
        Skeleton: "Grrghhhh..."
        
        * [Beat him]
            Skeleton destroyed.But after several seconds its bones construct another two skeletons. Skeleton attacks you.
            -> RunFromSkeletons
        ->DONE
        * [Wait]
            Skeleton attacks you.
            ->RunFromSkeletons
        ->DONE
    
    === RunFromSkeletons ===
    * [RUN!]
    You are ran away.
    Now you need to understand where are you. You see light. You went towards light.
    ->HALL
    ->DONE
    
    * [FIGHT!]
    After each your strike count of skeletons are doubled. You can't cope with all of them.  They kill you :(
    ->END
    
    === HALL ===
        You've entered the large hall 
        
        At the oposite side of hall there is a throne with someone on it. 
        You came closer and see that it is an enormous skeleton.
        
        King Skeleton: "Hrggrrr... Aghr...."
        
        He stood up. 
        
        "It will be hard battle", - you've thought
        
        -> FinalBattle
        
    
    === FinalBattle ===
        King summons a lot of skeletons. They attacks you.
        ~HP = HP - 20
        You lost 20 HP and it is {HP}
        {HP <= 0:
            -> END
        }
        + [Attack the king]
        -> AttackKing
        ->DONE
        + [Firstly skeletons]
        -> AttackSkeletons
        ->DONE
    
    === AttackKing ===
        + [Fireball]
        { INTELLIGENCE >=  50:
            Your fireball burned king down. All summoned skeletons disappears.
            ->END
        -else:
            Your fireball didn't affect to king. He strikes back and kills you. 
            -> END
        }
        + [Sword]
        { STRENGTH >=  50:
            After your strike, the bones of the King fly all over the hall. All summoned skeletons disappears.
            ->END
        -else:
            Your strike didn't affect to king. He strikes back and kills you. 
            -> END
        }
        
    === AttackSkeletons ===
        + [Fireball]
            You kill all summoned skeletons.
            ~INTELLIGENCE = INTELLIGENCE + 10
            Your INTELLIGENCE has increased by 10 and it is {INTELLIGENCE}
            -> FinalBattle
            ->DONE
        + [Sword]
            You kill all summoned skeletons.
            ~STRENGTH = STRENGTH + 10
            Your STRENTHG has increased by 10 and it is {STRENGTH}
            -> FinalBattle
            ->DONE
        
-> DONE

















