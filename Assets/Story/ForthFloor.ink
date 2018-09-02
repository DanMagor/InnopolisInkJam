VAR HP = 100
VAR Intelligence = 0
VAR Strength = 10
VAR Floor = ->ForthFloor
VAR Next = ->FirstFloor
VAR WerewolfHP = 100
"Don't Enter Get Away"
It's not too late to turn around
* [Enter]
TODO: Put some sound
What is it?!
->EnterTower
->DONE
*[Don't Enter]
Why are you even playing the game ? -_-
->Lose
->DONE



===EnterTower===
*[Continue]

//Test 4th floor
~ Strength = 30
~ Intelligence = 50
->ForthFloor

//end of testing
->FirstFloor
->DONE

->DONE



===FirstFloor===
Guardian : You came here to die!
*[Strike with stick]
You Win !
->FirstFloorLevelup
->DONE

->DONE


===FirstFloorLevelup===
*[Take a Sword (+ Strength)]
Strength +10 #Strength_+10
~ Strength = Strength + 10
->DONE
*[Take Intelligence Portion (+ Intelligence)]
Intelligence + 10  #Intelligence_+10
~ Intelligence = Intelligence + 10
->DONE

->ForthFloor
->DONE


===ForthFloor===
~ Floor = ->ForthFloorFight
~ Next = ->FifthFloor
Werewolf : These are the last moments of your life, no one can beat my strength...
->ForthFloorFight
->DONE

===ForthFloorFight===
+[Fire Bolt]
{
 -Intelligence < 20 :
 No Enough Intelligence ! ->LoseHP(10)
 -else:
 Fire Bolt ! 
 "Werewolf is burning"
 ~ Intelligence = Intelligence + 5
 \+5 Intelligence
 ->FifthFloor
 }
->DONE

+[Sword Attack]
My sword will beat you... 
{
-Strength < 30 :
No enough Strength to beat the Werewolf! 
->LoseHP(20)
->ForthFloorFight
-else:
"You attack Werewolf"...
"Werewolf's hp decreases"...

~ WerewolfHP = WerewolfHP - 40 
{
- WerewolfHP < 0:
~Strength = Strength + 5
\+5 Strength
->Win
- else:
"Werewolf attacks you"....
->LoseHP(10)
->ForthFloorFight
}
 ->Win
 ->FifthFloor
 }
->DONE

->DONE










===LoseHP(n)===
~ HP = HP - n
<\n>//migh cause a problem
TODO: Make sure that this doesn't make problems
 \-10 HP
{
-HP <= 0 :
->Lose
-else:
->Floor
}

 
->DONE

===Lose===
Game Over
->END

===Win===
"Congrats ! , You Won!"
->DONE

===FifthFloor===

->DONE
















