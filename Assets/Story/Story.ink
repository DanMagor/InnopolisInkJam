VAR intelegence = 0
VAR strength = 10
VAR agility = 0
VAR HP = 100
VAR Intelligence = 10
VAR Floor = ->FourthFloor
VAR Next = ->FirstFloor
VAR WerewolfHP = 100


"Don't Enter Get Away"
->Begin
==Begin==
It's not too late to turn around
+[Enter]
What is it?
->FirstFloor
->DONE
*Don't Enter
Why do you even play the game ? -_-
->END
->DONE



===FirstFloor===
Guardian : You came here to die!
*[Strike with stick]
You Win !
->FirstFloorLevelup
->DONE
+[RunAway]
->Begin

->DONE


===FirstFloorLevelup===
*[Take a Sword (+ Strength)]
Strength +10
~strength = strength + 10
->ThirdFloor
->DONE
*[Take Mana Potion (+ Mana)]
intelegence + 10
~intelegence = intelegence + 10
->ThirdFloor
->DONE

->ThirdFloor
->DONE


===ThirdFloor===
You go up to the second floor. The room is immersed in intimate dark red light. On the wall there is a lot of stuff, which is looks like torture tools. Whips, saws, ropes, some oblong subjects...
"What is that?!" You whispered.
*[Next]
->ThirdFloor_01

==ThirdFloor_01==
Suddenly you notice the movement under the ceiling. With a sound like the rustle of bat wings, some creature lands in front of you folding her wings. She looks like beatiful and hot woman... but with suprise in the form of huge membranous wings. And this was not only suprise.
*[Next]
->ThirdFloor_02

==ThirdFloor_02==
"Succubus. The creature of carnal love and lust" said you.
She smirks. "Oh, you're so smart traveler. You know who I am." told she with sweety voice. "Do you wanna play with me?"
What is your choice traveler?
*[Sure I am!(try to seduce her)]
{ intelegence >= 10:
    ->ThirdFloor_SuccubusSeducingSuccess
  -else:
    ->ThirdFloor_SuccubusSeducingFail
}
->DONE
*[I am here to fight!]
->ThirdFloor_SuccubusFight
->DONE

==ThirdFloor_SuccubusFight==
What you are going to do traveler? Succubus are creatures of magic. Sword or magic?
*[Magic]
Bad choice. You even have no time to cast spell. She is too fast. You feeled it better when she took whips. Sadly death... 
->END
*[Sword]
{ strength>=15:
    That was really hard fight. Succubus are fast creatures and have fire resists, good for you that you power enough to work with sword. Strength + 5. Let's go on Fourth Floor.
    ~strength = strength + 5
    ->FourthFloor
    -else:
    You tryed to pick up your sword, but it was too heavy for you. You are wimp. You even noticed how Succubus comes to your back and pulled something in your... Oh...
    ->END
    
}


==ThirdFloor_SuccubusSeducingSuccess==
-"Sure I am", replyed you. You feels like this girl is victum of circumstances, but deep inside she is very vulnerable and kind person. And That she just want to be loved. And that what you told her. Even Succubus can't resists your intelegence and pick-up skills. 
-Intelegence +5!
~intelegence = intelegence + 5
*[Next]
->ThirdFloor_SuccubusSeducingSuccess_01

==ThirdFloor_SuccubusSeducingSuccess_01==
She swallowed that! Now is your chance to kill her! But she looks really good...
*[Ok, I will kill her later]
{  strength > 20:
    ->ThirdFloor_SuccubusRapingSuccess
    -else:
    ->ThirdFloor_SuccubusRapingFail
}
*[Freeze her!]
->ThirdFloor_SuccubusFreeze


==ThirdFloor_SuccubusRapingSuccess==
SHIT! You did! You raped succubus, you had enough Strength for that. As reward she gave you one of her oblong objects! It looks much harder and bigger than your weapon. This is not the story that you could tell your grandchildren.
Strength +15!
Let's go in the Third Floor
~strength = strength + 15
->FourthFloor

==ThirdFloor_SuccubusRapingFail==
Really?! Have you seen yourself in the mirror? You tryed to rape succubus with this sickly body? Hey! Succubus is creature of sex! You're not so smart, actually.
You dead because of exhaustion.
->END

==ThirdFloor_SuccubusSeducingFail==
You pitty attempts to say that she is beatiful and sexual look awful. Even the lonely girl in the world wouldn't notice you. But for some reasons she comes and kiss you...
And just in moment you was tieded on some table. She took one of this oblong object from the wall and...
So it was interesting journey with tragic and slowly death. So, at least it was funny end...
->END

==ThirdFloor_SuccubusFreeze==
When she was relaxed you freezed her with spell. She still was alive... and she was ready for that.
*[Well, she is fixated. Why not? ]
->ThirdFloor_SuccubusFreezedRape

*[Let's just kill her. Fireball]
Really?! You freezed her and the unfreezed with fireball? You know nothing about magic. Succubus like fire! So...
And just in moment you was tieded on some table. She took one of this oblong object from the wall and...
So it was interesting journey with tragic and slowly death. So, at least it was funny end... with fire in your ass.
->END

==ThirdFloor_SuccubusFreezedRape==
So you did you best and succubus liked it! She told you to take one of her Whips. You choose the most long of them. Really good enchanted weapon!
Intelegence +15
~intelegence = intelegence +15
Let's go on the fourth floor

->FourthFloor


===FourthFloor===
~ Floor = ->FourthFloorFight
~ Next = ->FifthFloor
Werewolf : These are the last moments of your life, no one can beat my strength...
->FourthFloorFight
->DONE

===FourthFloorFight===
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
-strength < 30 :
No enough Strength to beat the Werewolf! 
->LoseHP(20)
->FourthFloorFight
-else:
"You attack Werewolf"...
"Werewolf's hp decreases"...

~ WerewolfHP = WerewolfHP - 40 
{
- WerewolfHP < 0:
~strength = strength + 5
\+5 Strength
->Win
- else:
"Werewolf attacks you"....
->LoseHP(10)
->FourthFloorFight
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




