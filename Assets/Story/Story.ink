VAR health = 100
VAR mana = 0
VAR strength = 10
VAR agility = 0

"Don't Enter Get Away"
It's not too late to turn around
* [Enter]
What is it? #SOUND
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
*[RunAway]
->END

->DONE


===FirstFloorLevelup===
*[Take a Sword (+ Strength)]
Strength +10 #S_+10
~strength = strength + 10
->SecondFloor
->DONE
*[Take Mana Potion (+ Mana)]
Mana + 10  #M_+10
->SecondFloor
->DONE

->SecondFloor
->DONE


===SecondFloor===
Hahaha
{ strength > 10:
    ->ThirdFloor
 -else:
    ->DEAD
}
->DONE

==ThirdFloor==
ThirdFloor
->DONE

==DEAD==
You dead
->DONE




