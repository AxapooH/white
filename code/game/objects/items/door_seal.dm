/obj/item/door_seal
	name = "пневматический замок"
	desc = "Скоба, используемая для герметизации и укрепления воздушного шлюза. Полезно для того, чтобы сделать области недоступными для не гуманоидов или тех, у кого нет противопоставленных больших пальцев."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "pneumatic_seal"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	flags_1 = CONDUCT_1
	resistance_flags = FIRE_PROOF | ACID_PROOF
	force = 5
	throwforce = 5
	throw_speed = 2
	throw_range = 1
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron=5000,/datum/material/plasma=500)
	/// how long the seal takes to place on the door
	var/seal_time = 3 SECONDS
	/// how long it takes to remove the seal from a door
	var/unseal_time = 2 SECONDS

/obj/item/door_seal/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] is sealing [user.ru_na()]self off from the world with [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	playsound(src, 'sound/items/jaws_pry.ogg', 30, TRUE)
	return(BRUTELOSS)

