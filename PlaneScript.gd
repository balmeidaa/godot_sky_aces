extends RigidBody

const v3 = Vector3(0, 0, 0)
const scalar_z = Vector3(0, 0, -1)
var force = v3
var drag = v3
var lift = v3
var thrust = v3

var bullet_scene = preload("Bullet.tscn")


const MAX_THRUST = 500
const MAX_CAM_ANGLE = 30
const DRAG_CONST = 1000

func calc_force(thrust, rotate):
    var speed = MAX_THRUST * (thrust)
    var drag_coef = DRAG_CONST / speed / speed 
    thrust = transform.basis.z * (-speed)
    drag = transform.basis.z * drag_coef
    lift = transform.basis.y * drag_coef
    
    force = thrust + drag + lift
    add_central_force(force)

func fire_weapon():
    var clone = bullet_scene.instance()
    var scene_root = get_tree().root.get_children()[0]
    scene_root.add_child(clone)
    
    clone.global_transform = $Gunpoint.global_transform
#    clone.BULLET_DAMAGE = DAMAGE

