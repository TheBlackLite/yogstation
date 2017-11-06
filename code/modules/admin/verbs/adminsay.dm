/client/proc/cmd_admin_say(msg as text)
	set category = "Special Verbs"
	set name = "Asay" //Gave this shit a shorter name so you only have to time out "asay" rather than "admin say" to use it --NeoFite
	set hidden = 1
	if(!check_rights(0))
		return

	msg = copytext(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return

	log_adminsay("[key_name(src)] : [msg]")
	webhook_send_asay(key_name(src), msg)
	msg = keywords_lookup(msg)
	if(check_rights(R_ADMIN,0))
		msg = "<span class='adminobserver'><span class='prefix'>ADMIN:</span> <EM>[key_name(usr, 1)]</EM> (<a href='?_src_=holder;adminplayerobservefollow=\ref[mob]'>FLW</A>): <span class='message'>[msg]</span></span>"
		to_chat(admins, msg)
	else
		msg = "<span class='adminobserver'><span class='prefix'>OBSERVER:</span> <EM>[key_name(usr, 1)]:</EM> <span class='message'>[msg]</span></span>"
		to_chat(admins, msg)

	feedback_add_details("admin_verb","M") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/asay_popup(message as text)
	set name = "asay"
	set category = "Admin"
	set hidden = 1
	src.cmd_admin_say(message)
