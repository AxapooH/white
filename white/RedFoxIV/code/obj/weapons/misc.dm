/obj/item/gun/breakopen/detonator
	name = "Детонатор"
	desc = "Гарантированный мини-крит по горящим врагам. Погодите-ка..."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "detonator"
	max_ammo = 1

/obj/item/ammo_casing/caseless/detflare
	name = "Заряд для сигнальной ракетницы"
	desc = "\"Слегка\" модифицирован для более \"зрелищного\" результата."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "detonator_casing"
	projectile_type = /obj/projectile/detflare
	caliber = "flare"
/obj/projectile/detflare
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "detonator_projectile"
	damage = 0
	var/firedamage = 10
	var/turf/prev_loc

/obj/projectile/detflare/Move(atom/newloc, direct, glide_size_override)
	//If it works...
	prev_loc = get_turf(src)
	. = ..()
	

/obj/projectile/detflare/on_hit(atom/target, blocked, pierce_hit)
	var/turf/tloc
	//i don't think this works like it should, but i'm actually content with how it works currently.
	//...it ain't stupid.
	if(isclosedturf(target))
		tloc = prev_loc
	else
		tloc = get_turf(src)


	for(var/dir in list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST, 0))
		var/turf/T = get_step(tloc, dir)
		if(isclosedturf(T))
			continue
		new /obj/effect/hotspot(T)
		T.hotspot_expose(600, 50, 1)
		for(var/mob/living/L in T)
			if(L.on_fire)
				L.adjustFireLoss(firedamage*1.5 ) //minicritical shit
			else
				L.adjustFireLoss(firedamage)
			L.adjust_fire_stacks(max(0, 2 - L.fire_stacks)) //sets L.fire_stacks to 2 if it's less than 2, doesn't do anything if L.fire_stacks is 3 or more.
			L.IgniteMob()

	. = ..()

/obj/item/gun/energy/nlaw
	name = "N-LAW"
	desc = "Basically, a big subwoofer with a trigger. Can incapacitate people by throwing into walls, windows, other people, open airlocks, supermatter, disposals, banana peels, AIDS-infected monkeys, lavaland megafauna, lavaland lava, permabrig and, if you're not careful enough, yourself."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "sonic_gun"
	inhand_icon_state = "sonic_gun"
	lefthand_file = 'white/RedFoxIV/icons/obj/weapons/guns_lefthand.dmi'
	righthand_file =  'white/RedFoxIV/icons/obj/weapons/guns_righthand.dmi'
	cell_type = /obj/item/stock_parts/cell/high
	charge_sections = 5
	shaded_charge = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/acoustic)
	modifystate = TRUE

/*
/obj/item/gun/energy/nlaw/garbage
	desc = "A prototype energy weapon. Most people throw it in the trash bin and bug R&D for a better one. Does not support cell changing, overcharged mode, sustained fire, windows 10."
	name = "LAW"
	cell_type = /obj/item/stock_parts/cell/nlaw
	ammo_type = list(/obj/item/ammo_casing/energy/acoustic)
*/

/obj/item/stock_parts/cell/nlaw
	name = "LAW battery"
	desc = "Good job jackass, now try to put it back in without admemes."
	charge = 4000

/obj/item/ammo_casing/energy/acoustic
	projectile_type = /obj/projectile/acoustic_wave
	e_cost = 2000
	select_name = "normal"
	pellets = 3
	caliber = "acoustic"
	variance = 60

/obj/projectile/acoustic_wave
	name = "Acoustic wave"
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "sonic_projectile"
	damage = 0
	range = 4
	speed = 1.6
	buckle_lying = 90
	max_buckled_mobs = 10
	projectile_phasing = PASSMOB
	var/prev_loc

/obj/projectile/acoustic_wave/Move(atom/newloc, direct, glide_size_override)
	prev_loc = get_turf(src)
	/*
	for(var/obj/O in prev_loc)
		if(!O.anchored)
			O.forceMove(get_step(O, angle2dir()))
	*/
	for(var/mob/living/L in prev_loc)
		if(!L.buckled && L != firer)
			//L.forceMove(get_step(L, angle2dir()))
			buckle_mob(L, force = TRUE)
	
	for(var/obj/O in newloc)
		if(istype(O, /obj/structure/table))
			for(var/mob/living/L in buckled_mobs)
				L.Paralyze(25)
			qdel(src)
			return
	. = ..()
	
/obj/projectile/acoustic_wave/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	
	if(isclosedturf(target))
		for(var/mob/living/L in buckled_mobs)
			L.Paralyze(rand(30,60))
			L.adjustBruteLoss(rand(10,20))	
	/*
	var/atom/movable/throwdir = angle2dir(Angle)
	var/atom/movable/throwtarget = get_edge_target_turf(target, throwdir)
	if(istype(target, /mob/living) && !target.anchored)
		target.throw_at(throwtarget, knock_dist+1, 4, src.firer, 1, 0, null, move_force)
		return
	if(istype(target,/obj/structure) && !target.anchored)
		target.throw_at(throwtarget, knock_dist/2, 4, src.firer, 1, 0, null, move_force)
		return
	*/

/obj/projectile/acoustic_wave/vol_by_damage()
	return 1


/*
/datum/design/nlaw
	name = "N-LAW"
	desc = "A prototype energy weapon which utilizes powerful acoustic waves to knock people around."
	id = "nlaw"
	build_type = PROTOLATHE
	materials = list(/datum/material/titanium = 14000, /datum/material/plasma = 6000, /datum/material/glass = 10000, /datum/material/gold = 6000 , /datum/material/iron = 25000)
	build_path = /obj/item/gun/energy/nlaw
	category = list("Вооружение")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE //убрать флаг РнД если чрезмерно охуеют
*/

/obj/item/gun/breakopen/doublebarrel
	name = "двухствольный дробовик"
	desc = "Настоящая классика."
	can_be_sawn_off = TRUE
	can_fire_all_rounds_at_once = TRUE

/obj/item/gun/ballistic/stabba_taser
	name = "Стабба тазер"
	desc = "Двухзарядный тазер, стреляющий застревающими в теле электродами."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "ballistic_taser"
	inhand_icon_state = "stabba_taser"
	lefthand_file = 'white/qwaszx000/sprites/stabba_taser_left.dmi'
	righthand_file = 'white/qwaszx000/sprites/stabba_taser_right.dmi'
	pin = /obj/item/firing_pin
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	mag_type = /obj/item/ammo_box/magazine/internal/stabba_taser_magazine
	fire_delay = 5
	internal_magazine = TRUE

/obj/item/ammo_box/magazine/internal/stabba_taser_magazine
	name = "Магазин стабба тазера. Если вы видите это, сообщите администратору."
	icon = null
	icon_state = null
	ammo_type = /obj/item/ammo_casing/stabba
	caliber = "stabba"
	max_ammo = 2
	start_empty = FALSE

/obj/item/ammo_box/magazine/internal/stabba_taser_magazine/give_round(obj/item/ammo_casing/R, replace_spent = 1)
	return ..(R,1)

/obj/item/ammo_casing/stabba
	name = "картридж стабба тазера"
	desc = "Одноразовый картридж."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "ballistic_taser_casing"
	throwforce = 1
	projectile_type = /obj/projectile/bullet/stabba
	firing_effect_type = null
	caliber = "stabba"
	harmful = FALSE
/obj/item/trash/stabba_casing_cover
	name = "Пластиковая оболочка картриджа тазера"
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "bt_trash1"

/obj/item/trash/stabba_casing_cover/Initialize(mapload, cover)
	. = ..()
	icon_state = "bt_trash[cover]"
	pixel_x = base_pixel_x + rand(-6,6)
	pixel_y = base_pixel_y + rand(-6,6)
	transform = matrix().Turn(rand(0,360))
	SpinAnimation(loops = 1)

/obj/item/ammo_casing/stabba/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from, extra_damage, extra_penetration)
	. = ..()
	new /obj/item/trash/stabba_casing_cover(get_turf(src), 1)
	new /obj/item/trash/stabba_casing_cover(get_turf(src), 2)
	

/obj/projectile/bullet/stabba
	name = "Электродик Стаббы"
	desc = "Выглядит остро"
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "ballistic_taser_projectile"
	damage = 0
	nodamage = TRUE
	stamina = 8
	speed = 2
	range = 12
	embedding = list(embed_chance=100, fall_chance=0, pain_stam_pct=8, pain_mult=1, pain_chance=75)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//до фикса проблемы с лимитом файлов эта хуйня будет жить здесь
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/circuitboard/machine/chem_seller
	name = "Chem seller circuitboard"
	build_path = /obj/machinery/chem_seller
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 1
	)

/obj/machinery/chem_seller
	name = "синтезатор медикаментов"
	desc = "Синтезирует медикаменты и прочие реагенты за кредиты. В отличии от обычного химика, не потратит 30 минут на приготовление мультивера."
	icon = 'white/RedFoxIV/icons/obj/weapons/misc.dmi'
	icon_state = "chem_seller"
	density = TRUE		
	var/icon_work = "chem_seller_work"
	var/icon_deny = "chem_seller_deny"
	var/icon_nopower = "chem_seller_nopower"
	use_power = IDLE_POWER_USE
	idle_power_usage = 50
	var/dispense_power_usage = 250
	var/global/list/users_interacted = list() //сбор данных гуглом

	var/last_shopper
	//to track the cooldown on messages
	var/last_say_time = 0
	//how long the cooldown for messages lasts
	var/obj/item/reagent_containers/beaker = null
	var/currently_selected
	var/list/available_chems = list(
		/datum/reagent/medicine/c2/libital = 0.25,
		/datum/reagent/medicine/c2/aiuri = 0.25,
		/datum/reagent/medicine/c2/hercuri = 0.25,
		/datum/reagent/medicine/c2/convermol = 0.25,
		/datum/reagent/medicine/c2/multiver = 0.25,
		/datum/reagent/medicine/c2/synthflesh = 0.25,
		/datum/reagent/medicine/sal_acid = 0.33,
		/datum/reagent/medicine/oxandrolone = 0.33,
		/datum/reagent/medicine/cryoxadone = 0.2,
		/datum/reagent/medicine/c2/penthrite = 5,
		//misc//
		/datum/reagent/medicine/leporazine = 1
	)
/obj/machinery/chem_seller/Initialize()
	. = ..()
	currently_selected = available_chems[1]
	update_icon() //for subtypes which use overlays to look different

/obj/machinery/chem_seller/process() //wtf

/obj/machinery/chem_seller/proc/get_price(chem_typepath)
	var/price = available_chems[chem_typepath]
	return price < 1 ? 1 : price

/obj/machinery/chem_seller/proc/get_price_text(chem_typepath)
	var/price = available_chems[chem_typepath]
	return "[price < 1 ? "[round(1/price, 1)]u/1cr" : "1u/[price]cr"]"

/obj/machinery/chem_seller/proc/get_dispense_amount()
	if(!beaker)
		return
	var/datum/reagents/R = beaker.reagents
	var/free = R.maximum_volume - R.total_volume
	var/unit = available_chems[currently_selected] //for now it holds the price per unit from available_chems list
	unit = unit < 1 ? round(1/unit, 1) : 1 //and here it turns into actual unit measurement
	return min(free, unit)

/obj/machinery/chem_seller/attackby(obj/item/I, mob/user, params)
	if(default_unfasten_wrench(user, I))
		return
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, I))
		update_icon()
		return
	if(default_deconstruction_crowbar(I))
		return
	if(istype(I, /obj/item/reagent_containers) && !(I.item_flags & ABSTRACT) && I.is_open_container())
		var/obj/item/reagent_containers/B = I
		. = TRUE //no afterattack
		if(!user.transferItemToLoc(B, src))
			return
		replace_beaker(user, B)
		to_chat(user, "<span class='notice'>Добавил [B] в [src].</span>")
		updateUsrDialog()
	else if(user.a_intent != INTENT_HARM && !istype(I, /obj/item/card/emag))
		to_chat(user, "<span class='warning'>Не могу загрузить [I] в [src]!</span>")
		return ..()
	else
		return ..()

/obj/machinery/chem_seller/AltClick(mob/living/user)
	. = ..()
	if(!can_interact(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	replace_beaker(user)

/obj/machinery/chem_seller/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(!user)
		return FALSE
	if(beaker)
		try_put_in_hand(beaker, user)
		beaker = null
	if(new_beaker)
		beaker = new_beaker
	update_icon()
	return TRUE

/obj/machinery/chem_seller/update_icon_state()
	icon_state = "[!powered() ? icon_nopower : initial(icon_state)]"

/obj/machinery/chem_seller/update_overlays()
	. = ..()
	if(panel_open)
		. += mutable_appearance(icon, "[initial(icon_state)]_panel-o")

	if(beaker)
		var/mutable_appearance/b_o = mutable_appearance('icons/obj/chemical.dmi', "disp_beaker")
		b_o.pixel_y = -4
		b_o.pixel_x = -9
		. += b_o

/obj/machinery/chem_seller/ui_interact(mob/user, datum/tgui/ui)
	if(!(user in users_interacted)) //google analytics
		users_interacted.Add(user)
		to_chat(user,"<span class='notice'>hurr durr early access, work in progress, alpha build и так далее. Человек, который работал над этим аппаратом не шарит во внутриигровой экономике, поэтому выставил цены от балды. Убедительная просьба написать в дискорд канале #suggestions, стоит ли их повысить/занизить/оставить, как есть и почему. Заранее спасибо[prob(20) ? ", ебать!" : "!"]</span>")
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemSeller")
		ui.open()

/obj/machinery/chem_seller/ui_data(mob/user)
	var/list/data = list()

	var/chemicals[0]
	for(var/ass in available_chems)
		var/datum/reagent/chemical = GLOB.chemical_reagents_list[ass]
		chemicals.Add(list(list("title" = chemical.name, "price" = get_price_text(ass),  "typepath" = "[chemical.type]" )))
	data["chemicals"] = chemicals
	
	var/selected[0] //do i have to do this?
	var/datum/reagent/temp = GLOB.chemical_reagents_list[currently_selected]
	selected.Add(list(list("title" = temp.name, "desc" = temp.description, "price" = get_price_text(currently_selected), "typepath" = "[temp.type]" )))
	data["selected"] = selected
	/*
	data["energy"] = cell.charge ? cell.charge * powerefficiency : "0" //To prevent NaN in the UI.
	data["maxEnergy"] = cell.maxcharge * powerefficiency
	*/
	data["isBeakerLoaded"] = beaker ? 1 : 0
	//if no beaker is inserted, these two don't get updated and will be passed like that to the tgui. this is fine.
	data["beakerReagentAmount"] = 0
	data["beakerVolume"] = 1
	if(beaker)
		var/total_volume = 0
		for(var/datum/reagent/R in beaker.reagents.reagent_list)
			total_volume += R.volume
		data["beakerReagentAmount"] = total_volume
		data["beakerVolume"] = beaker.volume
	return data

/obj/machinery/chem_seller/ui_act(action, params)
	. = ..()
	if(.)
		return
	if(!is_operational)
		return FALSE
	switch(action)
		if("dispense")
			if(currently_selected in available_chems) //if this fails, either an admin fucked with it or something has gone terribly wrong. 
				return try_dispense()
			else
				message_admins("[ADMIN_LOOKUPFLW(usr)] tried to dispense a chemical in [src.name] that is not in the list of selectable chemicals. Possible exploit fuckery?")
				return FALSE

		if("select")
			var/typepath = text2path(params["reagent"])
			if(!typepath)
				return FALSE
			if(typepath in available_chems)
				currently_selected = typepath
				return TRUE
			else
				message_admins("[ADMIN_LOOKUPFLW(usr)] tried to select a chemical in [src.name] that is not in the list of selectable chemicals. Possible exploit fuckery?")
				return FALSE
		if("eject")
			replace_beaker(usr)
			return TRUE

/obj/machinery/chem_seller/proc/try_dispense()
	. = FALSE
	if(!beaker)
		return
	if(!verify())
		return
	var/disp = get_dispense_amount()
	if(!disp)
		cd_say("Beaker is full!", 1 SECONDS)
		flick(icon_deny, src) 
		return
	flick(icon_work, src)
	use_power(dispense_power_usage)
	beaker.reagents.add_reagent(currently_selected, disp, DEFAULT_REAGENT_TEMPERATURE)
	return TRUE

/obj/machinery/chem_seller/proc/verify()
	var/obj/item/card/id/C 
	if(isliving(usr))
		var/mob/living/L = usr
		C = L.get_idcard(TRUE)
	if(!C)
		cd_say("Sorry, you don't seem to have a card on you!", 3 SECONDS)
		flick(icon_deny, src)
		return
	else if (!C.registered_account)
		cd_say("No account found associated with your card. How interesting!", 3 SECONDS)
		flick(icon_deny, src)
		return
	else if(!C.registered_account.account_job)
		cd_say("I am sorry, but departamental accounts were blacklisted from personal expenses!", 3 SECONDS)
		flick(icon_deny, src)
		return

	var/datum/bank_account/account = C.registered_account
	var/price_to_use = get_price(currently_selected)
	if(price_to_use && !account.adjust_money(-price_to_use))
		cd_say("I am so sorry, but you do not have enough funds!", 3 SECONDS)
		flick(icon_deny, src)
		return
	SSblackbox.record_feedback("amount", "vending_spent", price_to_use)
	var/datum/reagent/chemical = GLOB.chemical_reagents_list[currently_selected]
	log_econ("[price_to_use] credits were inserted into [name] by [account] to buy [get_dispense_amount()]u [chemical.enname ? "[chemical.enname]" : "[chemical.name]"].")
	if(last_shopper != usr)
		cd_say("Thank you for your patronage!", 10 SECONDS)
		last_shopper = usr
	return TRUE

/obj/machinery/chem_seller/proc/cd_say(message, cooldown = 1 SECONDS)
	if(last_say_time < world.time)
		say(message)
		last_say_time = world.time + cooldown


/obj/item/circuitboard/machine/chem_seller/engineering
	name = "Engineering chem seller circuitboard"
	build_path = /obj/machinery/chem_seller/engineering
/obj/machinery/chem_seller/engineering
	name = "Раздатчик WD-40"
	desc = "Транспортирует чудодейственную кровь богов прямо к тебе в стакан. Не за спасибо, разумеется. Так же воспроизводит некоторые другие химикаты, полезные в работе инженера."
	circuit = /obj/item/circuitboard/machine/chem_seller/engineering
	available_chems = list(
		/datum/reagent/fuel/oil/wd40 = 146,
		/datum/reagent/medicine/c2/aiuri = 0.25,
		/datum/reagent/medicine/potass_iodide = 0.11, // 1/0.11 ~= 9
		/datum/reagent/consumable/ethanol/screwdrivercocktail = 0.066
	)

/obj/machinery/chem_seller/engineering/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "[initial(icon_state)]_engineering")
/datum/reagent/fuel/oil/wd40
	name = "ВД-40"
	enname = "WD-40"
	description = "Количество применений этого вещества стремится к бесконечности. Достаточно лишь одной единицы, чтобы произошло чудо. Например, улучшение работы компонентов различных устройств."
	burning_temperature = 2400
	burning_volume = 0.15

/datum/reagent/fuel/oil/wd40/expose_obj(obj/exposed_obj, reac_volume)
	//maybe another time
	/*
	if(istype(exposed_obj, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/cell = exposed_obj
		var/ratio = 1 + (initial(cell.maxcharge) * round(reac_volume) / cell.maxcharge)
		switch(ratio) //plug "1 + 1/x" into desmos (where n is reac_volume) if you really want to.
			if( to INFINITY)
				ass = ""
			if(2) //meh
				ass = "заметно"
			if(2.1 to 2.2) //2.1(6)
				ass = "немного"
			if(2.25)
				ass = "чуть-чуть"
			else
				ass = "почти никак не"
		cell.visible_message("<span class='hypnophrase'>Чудодейственное вещество проникает в щели и отверстия [cell.name], [ass] увеличивая энергоёмкость батареи.</span>")
		cell.desc = initial(cell.desc) + " Обладаёт лёгким и неописуемым ароматом."
		return ..()
	*/
	if(istype(exposed_obj, /obj/item/stock_parts))
		var/obj/item/stock_parts/SP = exposed_obj
		var/new_rating = min(SP.rating + round(reac_volume), 8)
		if(SP.rating !=new_rating)
			var/ass = ""
			switch(new_rating - SP.rating)
				if(2)
					ass = "двукратно"
				if(3)
					ass = "троекратно"
				if(4 to INFINITY)
					ass = "<i>многократно</i>"
			SP.rating = new_rating
			SP.visible_message("<span class='hypnophrase'>Чудодейственное вещество проникает в щели и отверстия [SP.name], [ass] оптимизируя и улучшая его работу! </span>")
		SP.desc = initial(SP.desc) + " Обладаёт лёгким и неописуемым ароматом."
		return ..()