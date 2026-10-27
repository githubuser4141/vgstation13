/mob/living/silicon/examine(mob/user) //Diplay's a silicon's Laws to ghosts
	if(laws && isobserver(user) && !istype(user,/mob/dead/observer/deafmute)) //Fuck off phantom mask users
		var/mob/dead/observer/sausag = user
		if(!isAdminGhost(sausag) && sausag.mind && sausag.mind.current)
			if(sausag.mind.isScrying || sausag.mind.current.ajourn) //Scrying or astral travel, fuck them.
				return
		to_chat(sausag, "<b>[src] has the following laws:</b>")
		laws.show_laws(sausag)
		investigation_log(I_GHOST, "|| had its laws checked by [key_name(sausag)][sausag.locked_to ? ", who was haunting [sausag.locked_to]" : ""]")
