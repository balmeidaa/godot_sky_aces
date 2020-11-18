extends Node
const MAX_CAM_ANGLE = 30
var pitch_dir = 0
var thrust = 0.5

func _ready():
    $DebugStats.add_property($Plane, "transform:origin", "round")
    $DebugStats.add_property($Plane, "force", "round")
    $DebugStats.add_property($Plane, "torque", "round")
    $DebugStats.add_property(self, "pitch_dir", "round")
    
func _process(delta):
    if Input.is_action_pressed("p1_fire"):
        $Plane.fire_weapon()
    if Input.is_action_pressed("ui_up"):
        thrust += delta
    if Input.is_action_pressed("ui_down"):
        thrust -= delta
    if Input.is_action_pressed("p1_pitch_up"):
        pitch_dir += delta
    if Input.is_action_pressed("p1_pitch_down"):
        pitch_dir -= delta
    
    thrust = clamp(thrust, 0.2, 1)
    pitch_dir  = clamp(thrust, -1, 1)
    $Plane.calc_force(thrust, pitch_dir)  
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
    

