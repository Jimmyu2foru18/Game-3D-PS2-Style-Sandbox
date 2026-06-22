extends Area3D
class_name AcrobatDetector3D

func get_best_anchor() -> AcrobatAnchor3D:
	var overlapping_areas = get_overlapping_areas()
	var best_anchor: AcrobatAnchor3D = null
	var min_distance = INF
	
	for area in overlapping_areas:
		if area is AcrobatAnchor3D:
			var distance = global_position.distance_to(area.global_position)
			if distance < min_distance:
				min_distance = distance
				best_anchor = area
				
	return best_anchor
