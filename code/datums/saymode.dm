/datum/saymode
	var/key
	var/ru_key
	var/mode

//Return FALSE if you have handled the message. Otherwise, return TRUE and saycode will continue doing saycode things.
//user = whoever said the message
//message = the message
//language = the language.
/datum/saymode/proc/handle_message(mob/living/user, message, datum/language/language)
	return TRUE

/datum/saymode/xeno
	key = "a"
	ru_key = "ф"
	mode = MODE_ALIEN

/datum/saymode/xeno/handle_message(mob/living/user, message, datum/language/language)
	if(user.hivecheck())
		user.alien_talk(message)
	return FALSE


/datum/saymode/vocalcords
	key = MODE_KEY_VOCALCORDS
	ru_key = "ч"
	mode = MODE_VOCALCORDS

/datum/saymode/vocalcords/handle_message(mob/living/user, message, datum/language/language)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/obj/item/organ/vocal_cords/V = C.getorganslot(ORGAN_SLOT_VOICE)
		if(V?.can_speak_with())
			V.handle_speech(message) //message
			V.speak_with(message) //action
	return FALSE


/datum/saymode/binary //everything that uses .b (silicons, drones, swarmers)
	key = MODE_KEY_BINARY
	ru_key = "и"
	mode = MODE_BINARY

/datum/saymode/binary/handle_message(mob/living/user, message, datum/language/language)
	if(isswarmer(user))
		var/mob/living/simple_animal/hostile/swarmer/S = user
		S.swarmer_chat(message)
		return FALSE
	if(isdrone(user))
		var/mob/living/simple_animal/drone/D = user
		D.drone_chat(message)
		return FALSE
	if(user.binarycheck())
		user.robot_talk(message)
		return FALSE
	return FALSE


/datum/saymode/holopad
	key = "h"
	ru_key = "р"
	mode = MODE_HOLOPAD

/datum/saymode/holopad/handle_message(mob/living/user, message, datum/language/language)
	if(isAI(user))
		var/mob/living/silicon/ai/AI = user
		AI.holopad_talk(message, language)
		return FALSE
	return TRUE

/datum/saymode/monkey
	key = "k"
	ru_key = "л"
	mode = MODE_MONKEY

/datum/saymode/monkey/handle_message(mob/living/user, message, datum/language/language)
	var/datum/mind = user.mind
	if(!mind)
		return TRUE
	if(is_monkey_leader(mind) || (ismonkey(user) && is_monkey(mind)))
		user.log_talk(message, LOG_SAY, tag="monkey")
		if(prob(75) && ismonkey(user))
			user.visible_message("<span class='notice'>[user] издаёт странный звук.</span>")
		var/msg = "<span class='[is_monkey_leader(mind) ? "monkeylead" : "monkeyhive"]'><b><font size=2>\[[is_monkey_leader(mind) ? "Лидер обезьян" : "Обезьяна"]\]</font> [user]</b>: [message]</span>"
		for(var/_M in GLOB.mob_list)
			var/mob/M = _M
			if(M in GLOB.dead_mob_list)
				var/link = FOLLOW_LINK(M, user)
				to_chat(M, "[link] [msg]")
			if((is_monkey_leader(M.mind) || ismonkey(M)) && (M.mind in SSticker.mode.ape_infectees))
				to_chat(M, msg)
		return FALSE

/datum/saymode/mafia
	key = "j"
	ru_key = "о"
	mode = MODE_MAFIA

/datum/saymode/mafia/handle_message(mob/living/user, message, datum/language/language)
	var/datum/mafia_controller/MF = GLOB.mafia_game
	var/datum/mafia_role/R = MF.player_role_lookup[user]
	if(!R || R.team != "mafia")
		return TRUE
	MF.send_message("<span class='changeling'><b>[R.body.real_name]:</b> [message]</span>","mafia")
	return FALSE
