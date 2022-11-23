// Transfer vote stuff

#define CHOICE_TRANSFER "Commence Crew Transfer"
#define CHOICE_CONTINUE_PLAYING "Continue Shift"

/datum/vote/transfer_vote
	name = "Crew Transfer"
	default_choices = list(
		CHOICE_TRANSFER,
		CHOICE_CONTINUE_PLAYING,
	)

/datum/vote/transfer_vote/toggle_votable(mob/toggler)
	if(!toggler)
		CRASH("[type] wasn't passed a \"toggler\" mob to toggle_votable.")
	if(!check_rights_for(toggler.client, R_ADMIN))
		return FALSE

	CONFIG_SET(flag/allow_vote_transfer, !CONFIG_GET(flag/allow_vote_transfer))
	return TRUE

/datum/vote/transfer_vote/is_config_enabled()
	return CONFIG_GET(flag/allow_vote_transfer)

/datum/vote/transfer_vote/can_be_initiated(mob/by_who, forced)
	. = ..()
	if(!.)
		return FALSE

	if(!forced && !CONFIG_GET(flag/allow_vote_transfer))
		if(by_who)
			to_chat(by_who, span_warning("Transfer voting is disabled."))
		return FALSE

	return TRUE

/datum/vote/transfer_vote/tiebreaker(list/winners)
	return pick(winners)

/datum/vote/transfer_vote/finalize_vote(winning_option)
	if(winning_option == CHOICE_CONTINUE_PLAYING)
		return

	if(winning_option == CHOICE_TRANSFER)
		SScrewtransfer.initiate_crew_transfer()

#undef CHOICE_TRANSFER
#undef CHOICE_CONTINUE_PLAYING
