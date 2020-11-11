extends Node
const MAX_CAM_ANGLE = 30
var rotate = 0
var thrust = 0

func _physics_process(delta):
    if Input.is_action_pressed("fire"):

        $Plane.fire_weapon()
    if Input.is_action_pressed("ui_up"):
        print('Ok')
        thrust += delta
    if Input.is_action_pressed("ui_down"):
        thrust -= delta
    if Input.is_action_pressed("ui_left"):
        rotate -= delta
    if Input.is_action_pressed("ui_right"):
        rotate += delta
    
    thrust = clamp(thrust, 0.1, 1)
    rotate = clamp(rotate, -1, 1)
    $Plane.calc_force(thrust, rotate)  
#	if Input.is_action_pressed("ui_rudder_left"):
#		rudder -= d
#	if Input.is_action_pressed("ui_rudder_right"):
#		rudder += d
#	if Input.is_action_pressed("ui_more_thrust"):
#		thrust += d
#	if Input.is_action_pressed("ui_less_thrust"):
#		thrust -= d
    if Input.is_action_pressed("ui_quit"):
        get_tree().quit()
 

    

