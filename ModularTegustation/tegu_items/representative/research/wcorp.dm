
//-----W_CORP-----
//W-Corp has movement technology, and upgraded weapons.

/datum/data/lc13research/w_corp_typea
	research_name = "W Corp Type A Weapons"
	research_desc = "W Corp will let you purchase their Type-A weapons, at a pretty steep cost."
	cost = AVERAGE_RESEARCH_PRICE
	corp = W_CORP_REP

/datum/data/lc13research/w_corp_typea/ResearchEffect(obj/structure/representative_console/caller)
	ItemUnlock(caller.order_list, "W Corp Type A Fist ",	/obj/item/ego_weapon/city/charge/wcorp/fist, 1000)
	ItemUnlock(caller.order_list, "W Corp Type A Axe ",		/obj/item/ego_weapon/city/charge/wcorp/axe, 1000)
	ItemUnlock(caller.order_list, "W Corp Type A Spear ",	/obj/item/ego_weapon/city/charge/wcorp/spear, 1000)
	ItemUnlock(caller.order_list, "W Corp Type A Dagger ",	/obj/item/ego_weapon/city/charge/wcorp/dagger, 1000)
	ItemUnlock(caller.order_list, "W Corp Type A Hammer ",	/obj/item/ego_weapon/city/charge/wcorp/hammer, 1000)
	ItemUnlock(caller.order_list, "W Corp Type A Hatchet ",	/obj/item/ego_weapon/city/charge/wcorp/hatchet, 1000)
	..()

/datum/data/lc13research/mobspawner/wcorp
	research_name = "W-Corp L1 Cleanup Team"
	research_desc = "The nearby intern staff are looking for easy training. <br>We can ship them to you but they won't be that effective."
	cost = LOW_RESEARCH_PRICE
	corp = W_CORP_REP
	mobspawner_type = /obj/effect/mob_spawn/human/supplypod/r_corp/wcorp_call

/datum/data/lc13research/mobspawner/wcorpl2
	research_name = "W-Corp L2 Cleanup Team"
	research_desc = "The nearby L2 staff are looking for their monthly bonus. <br>They're at the ready should you need them."
	cost = AVERAGE_RESEARCH_PRICE
	corp = W_CORP_REP
	mobspawner_type = /obj/effect/mob_spawn/human/supplypod/r_corp/wcorp_call
	required_research = /obj/effect/mob_spawn/human/supplypod/r_corp/wcorp_call/level2

//Teleporters
/datum/data/lc13research/teleporter
	research_name = "Prototype Quantum Pads"
	research_desc = "Our cleanup crew found one half of these pads and a <br>instruction manual in one of our trains. Our researchers managed to reverse engineer <br>a replica with a copy of the book. We would like you to test <br>these pads in the facility your currently working in and <br>report back if its function threatens our buisness."
	cost = AVERAGE_RESEARCH_PRICE
	corp = W_CORP_REP

/datum/data/lc13research/teleporter/ResearchEffect(obj/structure/representative_console/caller)
	var/place_to_place = get_turf(src)
	//two keycards for both quantum pads.
	new /obj/item/quantum_keycard(place_to_place)
	new /obj/item/quantum_keycard(place_to_place)
	//a outdated guide
	new /obj/item/paper/guides/quantumpad(place_to_place)
	//and a box with 2 quantum pads
	new /obj/item/package_quantumpad(place_to_place)
	..()

/datum/data/lc13research/teleporter/setb
	research_name = "Prototype Quantum Pads II"
	research_desc = "We've decided to ship out more of those Quantum Pads. You can have this set for the same price."
	required_research = /datum/data/lc13research/teleporter

