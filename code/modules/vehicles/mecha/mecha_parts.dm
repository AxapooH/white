/////////////////////////
////// Mecha Parts //////
/////////////////////////

/obj/item/mecha_parts
	name = "mecha part"
	icon = 'icons/mecha/mech_construct.dmi'
	icon_state = "blank"
	w_class = WEIGHT_CLASS_GIGANTIC
	flags_1 = CONDUCT_1

/obj/item/mecha_parts/proc/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M) //For attaching parts to a finished mech
	if(!user.transferItemToLoc(src, M))
		to_chat(user, span_warning("<b>[src.name]</b> решила застрять в моей руке, не могу прикрепить к [M]!"))
		return FALSE
	user.visible_message(span_notice("[user] прикрепляет [src] к [M].") , span_notice("Прикрепляю [src] к [M]."))
	return TRUE

/obj/item/mecha_parts/part/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M)
	return

/obj/item/mecha_parts/chassis
	name = "Mecha Chassis"
	icon_state = "backbone"
	interaction_flags_item = NONE			//Don't pick us up!!
	var/construct_type

/obj/item/mecha_parts/chassis/Initialize()
	. = ..()
	if(construct_type)
		AddComponent(construct_type)

/////////// Ripley

/obj/item/mecha_parts/chassis/ripley
	name = "Ripley chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/ripley

/obj/item/mecha_parts/part/ripley_torso
	name = "Ripley torso"
	desc = "A torso part of Ripley APLU. Contains power unit, processing core and life support systems."
	icon_state = "ripley_harness"

/obj/item/mecha_parts/part/ripley_left_arm
	name = "Ripley left arm"
	desc = "A Ripley APLU left arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "ripley_l_arm"

/obj/item/mecha_parts/part/ripley_right_arm
	name = "Ripley right arm"
	desc = "A Ripley APLU right arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "ripley_r_arm"

/obj/item/mecha_parts/part/ripley_left_leg
	name = "Ripley left leg"
	desc = "A Ripley APLU left leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_l_leg"

/obj/item/mecha_parts/part/ripley_right_leg
	name = "Ripley right leg"
	desc = "A Ripley APLU right leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_r_leg"

///////// Odysseus

/obj/item/mecha_parts/chassis/odysseus
	name = "Odysseus chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/odysseus

/obj/item/mecha_parts/part/odysseus_head
	name = "Odysseus head"
	desc = "An Odysseus head. Contains an integrated medical HUD scanner."
	icon_state = "odysseus_head"

/obj/item/mecha_parts/part/odysseus_torso
	name = "Odysseus torso"
	desc="A torso part of Odysseus. Contains power unit, processing core and life support systems along with an attachment port for a mounted sleeper."
	icon_state = "odysseus_torso"

/obj/item/mecha_parts/part/odysseus_left_arm
	name = "Odysseus left arm"
	desc = "An Odysseus left arm. Data and power sockets are compatible with specialized medical equipment."
	icon_state = "odysseus_l_arm"

/obj/item/mecha_parts/part/odysseus_right_arm
	name = "Odysseus right arm"
	desc = "An Odysseus right arm. Data and power sockets are compatible with specialized medical equipment."
	icon_state = "odysseus_r_arm"

/obj/item/mecha_parts/part/odysseus_left_leg
	name = "Odysseus left leg"
	desc = "An Odysseus left leg. Contains complex servodrives and balance maintaining systems to maintain stability for critical patients."
	icon_state = "odysseus_l_leg"

/obj/item/mecha_parts/part/odysseus_right_leg
	name = "Odysseus right leg"
	desc = "An odysseus right leg. Contains complex servodrives and balance maintaining systems to maintain stability for critical patients."
	icon_state = "odysseus_r_leg"

///////// Gygax

/obj/item/mecha_parts/chassis/gygax
	name = "Gygax chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/gygax

/obj/item/mecha_parts/part/gygax_torso
	name = "Gygax torso"
	desc = "A torso part of Gygax. Contains power unit, processing core and life support systems."
	icon_state = "gygax_harness"

/obj/item/mecha_parts/part/gygax_head
	name = "Gygax head"
	desc = "A Gygax head. Houses advanced surveillance and targeting sensors."
	icon_state = "gygax_head"

/obj/item/mecha_parts/part/gygax_left_arm
	name = "Gygax left arm"
	desc = "A Gygax left arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon_state = "gygax_l_arm"

/obj/item/mecha_parts/part/gygax_right_arm
	name = "Gygax right arm"
	desc = "A Gygax right arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon_state = "gygax_r_arm"

/obj/item/mecha_parts/part/gygax_left_leg
	name = "Gygax left leg"
	desc = "A Gygax left leg. Constructed with advanced servomechanisms and actuators to enable faster speed."
	icon_state = "gygax_l_leg"

/obj/item/mecha_parts/part/gygax_right_leg
	name = "Gygax right leg"
	desc = "A Gygax right leg. Constructed with advanced servomechanisms and actuators to enable faster speed."
	icon_state = "gygax_r_leg"

/obj/item/mecha_parts/part/gygax_armor
	gender = PLURAL
	name = "Gygax armor plates"
	desc = "A set of armor plates designed for the Gygax. Designed to effectively deflect damage with a lightweight construction."
	icon_state = "gygax_armor"


//////////// Durand

/obj/item/mecha_parts/chassis/durand
	name = "Durand chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/durand

/obj/item/mecha_parts/part/durand_torso
	name = "Durand torso"
	desc = "A torso part of Durand. Contains power unit, processing core and life support systems within a robust protective frame."
	icon_state = "durand_harness"

/obj/item/mecha_parts/part/durand_head
	name = "Durand head"
	desc = "A Durand head. Houses advanced surveillance and targeting sensors."
	icon_state = "durand_head"

/obj/item/mecha_parts/part/durand_left_arm
	name = "Durand left arm"
	desc = "A Durand left arm. Data and power sockets are compatible with most exosuit tools and weapons. Packs a really mean punch as well."
	icon_state = "durand_l_arm"

/obj/item/mecha_parts/part/durand_right_arm
	name = "Durand right arm"
	desc = "A Durand right arm. Data and power sockets are compatible with most exosuit tools and weapons. Packs a really mean punch as well."
	icon_state = "durand_r_arm"

/obj/item/mecha_parts/part/durand_left_leg
	name = "Durand left leg"
	desc = "A Durand left leg. Built particularly sturdy to support the Durand's heavy weight and defensive needs."
	icon_state = "durand_l_leg"

/obj/item/mecha_parts/part/durand_right_leg
	name = "Durand right leg"
	desc = "A Durand right leg. Built particularly sturdy to support the Durand's heavy weight and defensive needs."
	icon_state = "durand_r_leg"

/obj/item/mecha_parts/part/durand_armor
	gender = PLURAL
	name = "Durand armor plates"
	desc = "A set of armor plates for the Durand. Built heavy to resist an incredible amount of brute force."
	icon_state = "durand_armor"

////////// Clarke

/obj/item/mecha_parts/chassis/clarke
	name = "Clarke chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/clarke

/obj/item/mecha_parts/part/clarke_torso
	name = "Clarke torso"
	desc = "A torso part of Clarke. Contains power unit, processing core and life support systems."
	icon_state = "clarke_harness"

/obj/item/mecha_parts/part/clarke_head
	name = "Clarke head"
	desc = "A Clarke head. Contains an integrated diagnostic HUD scanner."
	icon_state = "clarke_head"

/obj/item/mecha_parts/part/clarke_left_arm
	name = "Clarke left arm"
	desc = "A Clarke left arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "clarke_l_arm"

/obj/item/mecha_parts/part/clarke_right_arm
	name = "Clarke right arm"
	desc = "A Clarke right arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "clarke_r_arm"

////////// HONK

/obj/item/mecha_parts/chassis/honker
	name = "H.O.N.K chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/honker

/obj/item/mecha_parts/part/honker_torso
	name = "H.O.N.K torso"
	desc = "A torso part of H.O.N.K. Contains chuckle unit, bananium core and honk support systems."
	icon_state = "honker_harness"

/obj/item/mecha_parts/part/honker_head
	name = "H.O.N.K head"
	desc = "A H.O.N.K head. Appears to lack a face plate."
	icon_state = "honker_head"

/obj/item/mecha_parts/part/honker_left_arm
	name = "H.O.N.K left arm"
	desc = "A H.O.N.K left arm. With unique sockets that accept odd weaponry designed by clown scientists."
	icon_state = "honker_l_arm"

/obj/item/mecha_parts/part/honker_right_arm
	name = "H.O.N.K right arm"
	desc = "A H.O.N.K right arm. With unique sockets that accept odd weaponry designed by clown scientists."
	icon_state = "honker_r_arm"

/obj/item/mecha_parts/part/honker_left_leg
	name = "H.O.N.K left leg"
	desc = "A H.O.N.K left leg. The foot appears just large enough to fully accommodate a clown shoe."
	icon_state = "honker_l_leg"

/obj/item/mecha_parts/part/honker_right_leg
	name = "H.O.N.K right leg"
	desc = "A H.O.N.K right leg. The foot appears just large enough to fully accommodate a clown shoe."
	icon_state = "honker_r_leg"


////////// Phazon

/obj/item/mecha_parts/chassis/phazon
	name = "Phazon chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/phazon

/obj/item/mecha_parts/chassis/phazon/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/assembly/signaler/anomaly) && !istype(I, /obj/item/assembly/signaler/anomaly/bluespace))
		to_chat(user, "The anomaly core socket only accepts bluespace anomaly cores!")

/obj/item/mecha_parts/part/phazon_torso
	name="Phazon torso"
	desc="A Phazon torso part. The socket for the bluespace core that powers the exosuit's unique phase drives is located in the middle."
	icon_state = "phazon_harness"

/obj/item/mecha_parts/part/phazon_head
	name="Phazon head"
	desc="A Phazon head. Its sensors are carefully calibrated to provide vision and data even when the exosuit is phasing."
	icon_state = "phazon_head"

/obj/item/mecha_parts/part/phazon_left_arm
	name="Phazon left arm"
	desc="A Phazon left arm. Several microtool arrays are located under the armor plating, which can be adjusted to the situation at hand."
	icon_state = "phazon_l_arm"

/obj/item/mecha_parts/part/phazon_right_arm
	name="Phazon right arm"
	desc="A Phazon right arm. Several microtool arrays are located under the armor plating, which can be adjusted to the situation at hand."
	icon_state = "phazon_r_arm"

/obj/item/mecha_parts/part/phazon_left_leg
	name="Phazon left leg"
	desc="A Phazon left leg. It contains the unique phase drives that allow the exosuit to phase through solid matter when engaged."
	icon_state = "phazon_l_leg"

/obj/item/mecha_parts/part/phazon_right_leg
	name="Phazon right leg"
	desc="A Phazon right leg. It contains the unique phase drives that allow the exosuit to phase through solid matter when engaged."
	icon_state = "phazon_r_leg"

/obj/item/mecha_parts/part/phazon_armor
	name="Phazon armor"
	desc="Phazon armor plates. They are layered with plasma to protect the pilot from the stress of phasing and have unusual properties."
	icon_state = "phazon_armor"

// Savannah-Ivanov

/obj/item/mecha_parts/chassis/savannah_ivanov
	name = "Savannah-Ivanov chassis"
	construct_type = /datum/component/construction/unordered/mecha_chassis/savannah_ivanov

/obj/item/mecha_parts/part/savannah_ivanov_torso
	name="Savannah-Ivanov torso"
	desc="A Savannah-Ivanov torso part. It's missing a huge chunk of space..."
	icon_state = "savannah_ivanov_harness"

/obj/item/mecha_parts/part/savannah_ivanov_head
	name="Savannah-Ivanov head"
	desc="A Savannah-Ivanov head. It's sensors have been adjusted to support graceful landings."
	icon_state = "savannah_ivanov_head"

/obj/item/mecha_parts/part/savannah_ivanov_left_arm
	name="Savannah-Ivanov left arm"
	desc="A Savannah-Ivanov left arm. Hidden rocket fabrication included in the wrists."
	icon_state = "savannah_ivanov_l_arm"

/obj/item/mecha_parts/part/savannah_ivanov_right_arm
	name="Savannah-Ivanov right arm"
	desc="A Savannah-Ivanov left arm. Hidden rocket fabrication included in the wrists."
	icon_state = "savannah_ivanov_r_arm"

/obj/item/mecha_parts/part/savannah_ivanov_left_leg
	name="Savannah-Ivanov left leg"
	desc="A Savannah-Ivanov left leg. In production they were designed to carry more than two passengers, so the leaping functionality was added as to not waste potential."
	icon_state = "savannah_ivanov_l_leg"

/obj/item/mecha_parts/part/savannah_ivanov_right_leg
	name="Savannah-Ivanov right leg"
	desc="A Savannah-Ivanov left leg. In production they were designed to carry more than two passengers, so the leaping functionality was added as to not waste potential."
	icon_state = "savannah_ivanov_r_leg"

/obj/item/mecha_parts/part/savannah_ivanov_armor
	name="Savannah-Ivanov armor"
	desc="Savannah-Ivanov armor plates. They are uniquely shaped and reinforced to deal with the stresses of two pilots, grandiose leaps, and missiles."
	icon_state = "savannah_ivanov_armor"

///////// Circuitboards

/obj/item/circuitboard/mecha
	name = "exosuit circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 7

/obj/item/circuitboard/mecha/ripley/peripherals
	name = "Ripley Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/ripley/main
	name = "Ripley Central Control module (Exosuit Board)"
	icon_state = "mainboard"


/obj/item/circuitboard/mecha/gygax/peripherals
	name = "Gygax Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/targeting
	name = "Gygax Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/main
	name = "Gygax Central Control module (Exosuit Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/durand/peripherals
	name = "Durand Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/targeting
	name = "Durand Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/main
	name = "Durand Central Control module (Exosuit Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/honker/peripherals
	name = "H.O.N.K Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/targeting
	name = "H.O.N.K Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/main
	name = "H.O.N.K Central Control module (Exosuit Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/odysseus/peripherals
	name = "Odysseus Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/odysseus/main
	name = "Odysseus Central Control module (Exosuit Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/phazon/peripherals
	name = "Phazon Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/targeting
	name = "Phazon Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/main
	name = "Phazon Central Control module (Exosuit Board)"

/obj/item/circuitboard/mecha/clarke/peripherals
	name = "Clarke Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/clarke/main
	name = "Clarke Central Control module (Exosuit Board)"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/savannah_ivanov/peripherals
	name = "Savannah Peripherals Control module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/targeting
	name = "Ivanov Weapon Control and Targeting module (Exosuit Board)"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/main
	name = "Savannah-Ivanov Combination Control Lock module (Exosuit Board)"
	icon_state = "mainboard"
