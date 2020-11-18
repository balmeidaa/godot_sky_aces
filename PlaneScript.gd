extends RigidBody

const v3 = Vector3(0, 0, 0)
const scalar_z = Vector3(0, 0, -1)
var force = v3
var torque = v3
var drag = v3
var lift = v3
var thrust = v3

var bullet_scene = preload("Bullet.tscn")

const MAX_THRUST_TURN = 320
const MAX_THRUST = 200
const MAX_CAM_ANGLE = 30
const DRAG_CONST = 1000

func calc_force(thrust, pitch_dir):
    var speed = MAX_THRUST * (thrust)
    var drag_coef = DRAG_CONST / MAX_THRUST / MAX_THRUST  
    thrust = transform.basis.z * (-speed)
    drag = transform.basis.z * drag_coef
    lift = transform.basis.y * drag_coef
    
    force = thrust + drag + lift
    torque = global_transform.basis.x * pitch_dir * MAX_THRUST_TURN

#    torque = transform.basis.y * w.z * rudder + transform.basis.z * w.z * ailerons - transform.basis.x * w.z * elevator
func _integrate_forces(state):
    add_central_force(force)
    add_torque(torque)

func fire_weapon():
    var clone = bullet_scene.instance()
    var scene_root = get_tree().root.get_children()[0]
    scene_root.add_child(clone)
    
    clone.global_transform = $Gunpoint.global_transform
#    clone.BULLET_DAMAGE = DAMAGE

