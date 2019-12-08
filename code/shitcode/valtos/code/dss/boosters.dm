/obj/item/reagent_containers/pill/viagra
	name = "таблетка виагры"
	desc = "Заставит вкусившего получить немного силы."
	icon_state = "pill16"
	list_reagents = list(/datum/reagent/viagra = 5)

/datum/reagent/viagra
	name = "Viagra"
	description = "Жидкость, которая делает из мальчика мужчину."
	color = "#FF00FF"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	overdose_threshold = 8

/datum/reagent/viagra/on_mob_life(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/N = L
		N.dstats[MOB_STR] = N.dstats[MOB_STR] + volume * 2
		N.dstats[MOB_INT] = N.dstats[MOB_INT] - volume
		to_chat(M, "<span class='notice'>ЧУВСТВУЮ СИЛУ И БЕЗЗАБОТСТВО!</span>")
		N.recalculate_stats()
	. = ..()

/datum/reagent/viagra/overdose_process(mob/living/M)
	if(ishuman(M))
		var/mob/living/carbon/human/N = M
		N.visible_message("<span class='suicide'><b>[N.name]</b> разлетается на куски!</span>")
		N.gib()
		return
	..()

/datum/chemical_reaction/viagra
	name = /datum/reagent/viagra
	id = /datum/reagent/viagra
	results = list(/datum/reagent/viagra = 1)
	required_reagents = list(/datum/reagent/drug/crank = 1, /datum/reagent/drug/methamphetamine = 1, /datum/reagent/drug/bath_salts = 1, /datum/reagent/drug/krokodil = 1)
	required_temp = 500

/obj/item/reagent_containers/pill/askorbinka
	name = "аскорбинка"
	desc = "Говорят такими раньше пытали людей."
	icon_state = "pill15"
	list_reagents = list(/datum/reagent/askorbinka = 5)

/datum/reagent/askorbinka
	name = "Askorbinka"
	description = "Ммм, на вкус как уран."
	color = "#FFFFFF"
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	overdose_threshold = 8

/datum/reagent/askorbinka/on_mob_life(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/N = L
		N.dstats[MOB_STR] = N.dstats[MOB_STR] - volume
		N.dstats[MOB_INT] = N.dstats[MOB_INT] + volume * 2
		N.dstats[MOB_DEX] = N.dstats[MOB_DEX] + volume
		to_chat(M, "<span class='notice'>Ням!</span>")
		N.recalculate_stats()

/datum/reagent/askorbinka/overdose_process(mob/living/M)
	if(ishuman(M))
		var/mob/living/carbon/human/N = M
		var/obj/item/organ/brain/B = N.getorganslot(ORGAN_SLOT_BRAIN)
		var/turf/T = get_turf(N)
		var/turf/target = get_ranged_target_turf(N, turn(dir, 180), 1)
		B.Remove(N)
		B.forceMove(T)
		var/datum/callback/gibspawner = CALLBACK(GLOBAL_PROC, /proc/spawn_atom_to_turf, /obj/effect/gibspawner/generic, B, 1, FALSE, N)
		B.throw_at(target, 1, 1, callback=gibspawner)
		N.visible_message("<span class='suicide'>Мозги <b>[sklonenie(N.name, VINITELNI, N.gender)]</b> вырываются из черепной коробки!</span>")
		return
	..()

/datum/chemical_reaction/askorbinka
	name = /datum/reagent/askorbinka
	id = /datum/reagent/askorbinka
	results = list(/datum/reagent/askorbinka = 1)
	required_reagents = list(/datum/reagent/drug/pumpup= 1, /datum/reagent/drug/happiness = 1, /datum/reagent/drug/aranesp = 1, /datum/reagent/drug/methamphetamine = 1)
	required_temp = 500
