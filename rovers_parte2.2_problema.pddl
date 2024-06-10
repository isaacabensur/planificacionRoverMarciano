(define (problem roverprob1234)
	(:domain Rover)
	(:objects
		general - Lander
		colour high_res low_res - Mode

		; se crea el rover1
		rover0 rover1 - Rover
		rover0store - Store
		waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 - Waypoint
		camera0 - Camera
		objective0 objective1 objective2 - Objective
	)
	(:init
		(visible waypoint1 waypoint0)
		(visible waypoint0 waypoint1)
		(visible waypoint2 waypoint0)
		(visible waypoint0 waypoint2)
		(visible waypoint2 waypoint1)
		(visible waypoint1 waypoint2)
		(visible waypoint3 waypoint0)
		(visible waypoint0 waypoint3)
		(visible waypoint3 waypoint1)
		(visible waypoint1 waypoint3)
		(visible waypoint3 waypoint2)
		(visible waypoint2 waypoint3)
		(visible waypoint4 waypoint1)
		(visible waypoint1 waypoint4)
		(at_soil_sample waypoint0)
		(at_rock_sample waypoint1)
		(at_soil_sample waypoint2)
		(at_rock_sample waypoint2)
		(at_soil_sample waypoint3)
		(at_rock_sample waypoint3)
		(at_lander general waypoint0)
		(channel_free general)
		(at rover0 waypoint3)

		; se le da la ubicacion adecuada al rover1
		(at rover1 waypoint2)
		(available rover0)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)

		; se le da la capacidad de imagenes al rover1
		(equipped_for_imaging rover1)

		(can_traverse rover0 waypoint3 waypoint0)
		(can_traverse rover0 waypoint0 waypoint3)
		(can_traverse rover0 waypoint3 waypoint1)
		(can_traverse rover0 waypoint1 waypoint3)
		(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover0 waypoint2 waypoint1)
		(can_traverse rover0 waypoint1 waypoint4)
		(can_traverse rover0 waypoint4 waypoint1)
		(on_board camera0 rover0)
		(calibration_target camera0 objective1)
		(supports camera0 colour)
		(supports camera0 high_res)
		(visible_from objective0 waypoint0)
		(visible_from objective0 waypoint1)
		(visible_from objective0 waypoint2)
		(visible_from objective0 waypoint3)
		(visible_from objective1 waypoint0)
		(visible_from objective1 waypoint1)
		(visible_from objective1 waypoint2)
		(visible_from objective1 waypoint3)
		(visible_from objective2 waypoint4)
	)

	(:goal
		(and
			(communicated_soil_data waypoint2)
			(communicated_rock_data waypoint3)
			(communicated_image_data objective1 high_res)
			(have_image rover0 objective2 high_res)
			(have_image rover0 objective2 colour)
		)
	)
)