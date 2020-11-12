extends Node
const MAX_CAM_ANGLE = 30
var pitch = 0
var thrust = 0.5

func _physics_process(delta):
    if Input.is_action_pressed("p1_fire"):
        $Plane.fire_weapon()
    if Input.is_action_pressed("ui_up"):
        thrust += delta
    if Input.is_action_pressed("ui_down"):
        thrust -= delta
    if Input.is_action_pressed("p1_pìtch_up"):
        pitch += delta
    if Input.is_action_pressed("p1_pitch_down"):
        pitch -= delta
    
    thrust = clamp(thrust, 0.2, 1)
    $Plane.calc_force(thrust, pitch)  
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
 

    

