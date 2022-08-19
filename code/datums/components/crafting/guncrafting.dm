//Gun crafting parts til they can be moved elsewhere

// PARTS //

/obj/item/weaponcrafting/receiver
	name = "модульный приёмник"
	desc = "Прототип модульного приёмника, который может послужить как спусковой крючок для огнестрела."
	icon = 'icons/obj/improvised.dmi'
	icon_state = "receiver"

/obj/item/weaponcrafting/stock
	name = "приклад"
	desc = "Классический приклад от винтовки, так же служит как ручка. Грубо выструган из дерева."
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 6)
	icon = 'icons/obj/improvised.dmi'
	icon_state = "riflestock"

///These gun kits are printed from the security protolathe to then be used in making new weapons

// GUN PART KIT //

/obj/item/weaponcrafting/gunkit/
	name = "стандартный комплект оружейных деталей для винтовки"
	desc = "Это пустой контейнер для деталей оружия! Зачем тебе это?"
	icon = 'icons/obj/improvised.dmi'
	icon_state = "kitsuitcase"

/obj/item/weaponcrafting/gunkit/nuclear
	name = "компоненты продвинутой энергетической винтовки"
	desc = "Кейс, содержащий необходимые детали винтовки для преобразования стандартной энергетической винтовки в продвиную энергетическую винтовку."

/obj/item/weaponcrafting/gunkit/tesla
	name = "комплект деталей пушки тесла"
	desc = "Кейс, содержащий необходимые детали для создания пушки тесла вокруг энергетической аномалии. Применять с соблюдением техники безопасности."

/obj/item/weaponcrafting/gunkit/xray
	name = "комплект деталей рентгеновского лазерного винтовки"
	desc = "Кейс с необходимыми деталями для преобразования лазерной винтовки в рентгеновскую лазерную винтовку. ВНИМАНИЕ! РАДИОАКТИВНО! Избегать близкого контакта кейса с паховой областью во время работы!"

/obj/item/weaponcrafting/gunkit/ion
	name = "стандартный комплект оружейных деталей для винтовки"
	desc = "Кейс с необходимыми деталями для превращения стандартной лазерной винтовки в ионный карабин."

/obj/item/weaponcrafting/gunkit/temperature
	name = "комплект деталей для температурного винтовки"
	desc = "Кейс, содержащий необходимые детали винтовки для преобразования стандартной энергетической винтовки в температурный винтовку. Незаменим при противодействии быстро двигающимся противникам и существам чувствительным к перепадам температур."

/obj/item/weaponcrafting/gunkit/beam_rifle
	name = "комплект деталей винтовки для ускорения частиц"
	desc = "Переворот в изготовлении оружия. В этом кейсе находится высокоэкспериментальная установка для винтовки ускорения частиц. Требуется энергетическая пушка, стабилизированная энергетическая аномалия и стабилизированная гравитационная аномалия."

/obj/item/weaponcrafting/gunkit/decloner
	name = "комплект деталей деклонера"
	desc = "Комплект деталей для преобразования лазерной пушки в деклонер."

/obj/item/weaponcrafting/gunkit/ebow
	name = "комплект деталей энергетического арбалета"
	desc = "Нелегальный набор для модификации оружия. Позволяет модифицировать стандартный протокинетический ускоритель для создания подобия энергетического арбалета. Почти как настоящий!"

/obj/item/weaponcrafting/gunkit/hellgun
	name = "комплект для создания винтовки \"Адское пламя\""
	desc = "Возьмите идеально работающую лазерную винтовку . Разделайте внутреннюю часть винтовки, чтобы она пылала. Теперь у вас есть винтовка \"Адское пламя\". Ты чудовище."
