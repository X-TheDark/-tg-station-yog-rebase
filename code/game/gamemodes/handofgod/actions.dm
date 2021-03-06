/* Prophet's innate godspeak */
/datum/action/innate/godspeak
	name = "Godspeak"
	button_icon_state = "godspeak"
	check_flags = AB_CHECK_CONSCIOUS
	var/mob/camera/god/god = null

/datum/action/innate/godspeak/IsAvailable()
	if(..())
		if(god)
			return 1
		return 0

/datum/action/innate/godspeak/Activate()
	var/msg = stripped_input(owner,"Speak to your god","Godspeak","")
	if(!msg)
		return
	var/rendered = "<font color='[god.side]'><span class='game say'><i>Prophet [owner]:</i> <span class='message'>[msg]</span></span>"
	to_chat(god, rendered)
	to_chat(owner, rendered)
	for(var/mob/M in mob_list)
		if(isobserver(M))
			var/link = FOLLOW_LINK(M, owner)
			to_chat(M, "[link] [rendered]")

/datum/action/innate/godspeak/Destroy()
	god = null
	return ..()
