extends Node
const MAX_CAM_ANGLE = 30
var pitch_dir = 0
var yaw_dir = 0
var roll_dir = 0
var thrust = 0.5
var input = ''
func _ready():
    $DebugStats.add_property($Plane, "transform:origin", "round")
    $DebugStats.add_property($Plane, "force", "round")
    $DebugStats.add_property($Plane, "torque", "round")
    $DebugStats.add_property(self, "pitch_dir", "round")
    $DebugStats.add_property(self, "input", "")

func _physics_process(delta):
    process_inputs(delta)
    process_movement(delta)
    
func process_inputs(delta):
    if Input.is_action_pressed("p1_fire"):
        $Plane.fire_weapon()
        input = 'fire'
    if Input.is_action_pressed("ui_up"):
        thrust += delta
        input = 'accel'
    if Input.is_action_pressed("ui_down"):
        thrust -= delta
        input = 'slow'
    if Input.is_action_pressed("p1_pitch_up"):
        pitch_dir += delta
        input = 'up'
    if Input.is_action_pressed("p1_pitch_down"):
        pitch_dir -= delta
        input = 'down'
     if Input.is_action_pressed("p1_roll_left"):
        roll_dir += delta
        input = 'yaw left'
    if Input.is_action_pressed("p1_roll_right"):
        roll_dir -= delta
        input = 'yaw right'
    if Input.is_action_pressed("p1_yaw_left"):
        yaw_dir += delta
        input = 'yaw left'
    if Input.is_action_pressed("p1_yaw_right"):
        yaw_dir -= delta
        input = 'yaw right'

    if Input.is_action_pressed("ui_quit"):
        get_tree().quit()
    
#TODO Adjust values to make movement more smooth
func process_movement(delta):
     thrust = clamp(thrust, 0.2, 1)
     pitch_dir  = clamp(pitch_dir, -.6, .6)
     yaw_dir  = clamp(yaw_dir, -.6, .6)
     roll_dir  = clamp(roll_dir, -.6, .6)
     $Plane.calc_force(thrust, pitch_dir, roll_dir, yaw_dir)
