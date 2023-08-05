/mob/living/simple_animal/hostile/abnormality/redblooded
	name = "Red Blooded American"
	desc = "A bright red demon with oversized arms and long, sharp tusks. It is keeping its eyes focused on you."
	icon = 'ModularTegustation/Teguicons/32x32.dmi'
	icon_state = "doomsday_doll"
	icon_living = "doomsday_doll"
	var/icon_aggro = "firstfold"
	var/icon_furious = "doomsday_doll_dead"
	del_on_death = TRUE
	maxHealth = 750
	health = 750
	rapid_melee = 1
	melee_queue_distance = 2
	move_to_delay = 4
	attack_sound = 'sound/weapons/slash.ogg'
	attack_verb_continuous = "slams"
	attack_verb_simple = "slam"
	melee_damage_type = RED_DAMAGE
	stat_attack = HARD_CRIT
	ranged = TRUE
	ranged_cooldown_time = 4 SECONDS
	casingtype = /obj/item/ammo_casing/caseless/true_patriot
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'
	damage_coeff = list(BRUTE = 1, RED_DAMAGE = 0.8, WHITE_DAMAGE = 1.5, BLACK_DAMAGE = 1, PALE_DAMAGE = 2)
	melee_damage_lower = 10
	melee_damage_upper = 15
	faction = list("hostile")
	speak_emote = list("snarls")
	can_breach = TRUE
	threat_level = TETH_LEVEL
	start_qliphoth = 3
	work_chances = list(
						ABNORMALITY_WORK_INSTINCT = 45,
						ABNORMALITY_WORK_INSIGHT = 30,
						ABNORMALITY_WORK_ATTACHMENT = 0,
						ABNORMALITY_WORK_REPRESSION = list(55,55,55,60,60)
						)
	max_boxes = 14
	work_damage_amount = 6
	work_damage_type = RED_DAMAGE

	ego_list = list(
		  /datum/ego_datum/weapon/patriot,
		  /datum/ego_datum/armor/patriot
	)
	//gift_type = /datum/ego_gifts/patriot
	abnormality_origin = ABNORMALITY_ORIGIN_ORIGINAL

	var/bloodlust = 0 //more you do repression, more damage it deals. decreases on other works.

/mob/living/simple_animal/hostile/abnormality/redblooded/AttemptWork(mob/living/carbon/human/user, work_type)
	work_damage_amount = 6 + bloodlust
	if(work_type == ABNORMALITY_WORK_REPRESSION)
		say(pick("Go ahead, freakshit! Do your best!", "Pft. Go ahead and try, freakshit.", "Good, something fun for one. Go ahead, freakshit.", "One of you finally has some balls.", "Pathetic. You're too weak for this, you know?"))
		bloodlust +=2
	if(bloodlust >= 6)
		icon_state = icon_furious
	else
		icon_state = "doomsday_doll"
	return ..()

/mob/living/simple_animal/hostile/abnormality/redblooded/NeutralEffect(mob/living/carbon/human/user, work_type, pe)
	if(prob(50)) //slightly higher than other TETHs, given that the counter can be raised
		datum_reference.qliphoth_change(-1)
	return

/mob/living/simple_animal/hostile/abnormality/redblooded/FailureEffect(mob/living/carbon/human/user, work_type, pe)
	datum_reference.qliphoth_change(-1)
	return

/mob/living/simple_animal/hostile/abnormality/redblooded/PostWorkEffect(mob/living/carbon/human/user, work_type, pe)
	if(work_type == ABNORMALITY_WORK_REPRESSION)
		datum_reference.qliphoth_change(1)
	if(work_type != ABNORMALITY_WORK_REPRESSION)
		if(bloodlust > 0)
			bloodlust -= 1
		if(bloodlust == 0)
			say(pick("Boring. C'mon, we both know a little roughhousing would be better.", "Aw, what a wimp. Alright, you do your thing, pansy.", "Yawn. Damn, you freakshits are lame."))
	return ..()

/mob/living/simple_animal/hostile/abnormality/redblooded/ZeroQliphoth(mob/living/carbon/human/user)
	say(pick("Time to wipe you freakshits out!", "HA! It's over for you freaks!" , "You're outmatched. Just drop dead and save me time already!"))
	BreachEffect()
	return

/mob/living/simple_animal/hostile/abnormality/redblooded/BreachEffect(mob/living/carbon/human/user)
	..()
	icon_state = icon_aggro
	GiveTarget(user)

/mob/living/simple_animal/hostile/abnormality/redblooded/MoveToTarget(list/possible_targets)
	if(ranged_cooldown <= world.time)
		OpenFire(target)
	return ..()

/mob/living/simple_animal/hostile/abnormality/redblooded/OpenFire(atom/A)
	if(get_dist(src, A) <= 2)
		return FALSE
	return ..()
