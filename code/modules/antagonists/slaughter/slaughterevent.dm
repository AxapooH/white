/datum/round_event_control/slaughter
	name = "Создать Демона Бойни"
	typepath = /datum/round_event/ghost_role/slaughter
	weight = 1 //Very rare
	max_occurrences = 1
	earliest_start = 1 HOURS
	min_players = 20
	dynamic_should_hijack = TRUE

/datum/round_event/ghost_role/slaughter
	minimum_required = 1
	role_name = "slaughter demon"

/datum/round_event/ghost_role/slaughter/spawn_role()
	var/list/candidates = get_candidates(ROLE_ALIEN, null, ROLE_ALIEN)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick_n_take(candidates)

	var/datum/mind/player_mind = new /datum/mind(selected.key)
	player_mind.active = TRUE

	var/list/spawn_locs = list()
	for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
		if(isturf(L.loc))
			spawn_locs += L.loc

	if(!spawn_locs)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/obj/effect/dummy/phased_mob/holder = new /obj/effect/dummy/phased_mob((pick(spawn_locs)))
	var/mob/living/simple_animal/hostile/imp/slaughter/S = new (holder)
	player_mind.transfer_to(S)
	player_mind.assigned_role = "Slaughter Demon"
	player_mind.special_role = "Slaughter Demon"
	player_mind.add_antag_datum(/datum/antagonist/slaughter)
	to_chat(S, S.playstyle_string)
	to_chat(S, "<B>На данный момент я не на том же плане существования, где находится станция. Используйте ползанье крови на кровяной луже чтобы появиться.</B>")
	SEND_SOUND(S, 'sound/magic/demon_dies.ogg')
	message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a slaughter demon by an event.")
	log_game("[key_name(S)] was spawned as a slaughter demon by an event.")
	spawned_mobs += S
	return SUCCESSFUL_SPAWN
