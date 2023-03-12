/// Generic Tajaran celebrated on Mar 2nd, a memorable day in Tajaran history.
/datum/holiday/Solljarm
	name = "Solljarm"
	begin_month = MARCH
	begin_day = 2

/datum/holiday/Solljarm/greet()
	return "On this day, the Tajarans celebrate Solljarm, also known as 'The Day the Sun Finally Rose'. A long, 10 years of Snefald battered \
			Kalt, only for the suns warmth to finally break through the clouds."

/// Kristne, celebrated Aug 11th, the day Tajarans were merged into code (#1859)
/datum/holiday/kristne
	name = "Kristne"
	begin_month = AUGUST
	begin_day = 11

/datum/holiday/kristne/greet()
	return "O Great Kristne, may your days be remembered, as you had blessed the hearts of many Tajarans, filling us with warmth, love and hope."

/datum/holiday/kristne/getStationPrefix()
	return pick("Tajara", "Krist")
