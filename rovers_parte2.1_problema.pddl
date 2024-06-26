(define (problem roverprob1234)
	(:domain Rover)
	(:objects
		general - Lander
		colour high_res low_res - Mode
		rover0 - Rover
		rover0store - Store
		;Se anade una nueva ubicacion como lo indica la cuestion, se crea el waypoint4
		waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 - Waypoint
		camera0 - Camera
		; Luego se crea el objective2
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

		; se anade la visibilidad del waypoint1 desde el waypoint4 para poder incluir al objetivo dentro de las condiciones iniciales
		(visible waypoint4 waypoint1)
		; se anade la visibilidad del waypoint4 desde el waypoint1 poder incluir al objetivo dentro de las condiciones iniciales
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
		(available rover0)
		(store_of rover0store rover0)
		(empty rover0store)
		(equipped_for_soil_analysis rover0)
		(equipped_for_rock_analysis rover0)
		(equipped_for_imaging rover0)
		(can_traverse rover0 waypoint3 waypoint0)
		(can_traverse rover0 waypoint0 waypoint3)
		(can_traverse rover0 waypoint3 waypoint1)
		(can_traverse rover0 waypoint1 waypoint3)
		(can_traverse rover0 waypoint1 waypoint2)
		(can_traverse rover0 waypoint2 waypoint1)

		; se anade la capacidad de moverse del rover0 entre el waypoint4 y el waypoint1
		(can_traverse rover0 waypoint1 waypoint4)

		; se anade la capacidad de moverse del rover0 entre el waypoint1 y el waypoint4
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

		; se anade la visibilidad del objective2 desde el waypoint4
		(visible_from objective2 waypoint4)
	)

	(:goal
		(and
			(communicated_soil_data waypoint2)
			(communicated_rock_data waypoint3)
			(communicated_image_data objective1 high_res)

			; se anade la comunicacion de la imagen de alta resolucion y color del objective2
			(have_image rover0 objective2 high_res)
			(have_image rover0 objective2 colour)
		)
	)
)