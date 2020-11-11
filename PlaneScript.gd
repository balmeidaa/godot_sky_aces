extends RigidBody

const v3 = Vector3(0, 0, 0)
const scalar_z = Vector3(0, 0, -1)
var force = v3
var bullet_scene = preload("Bullet.tscn")


const MAX_THRUST = 900
const MAX_CAM_ANGLE = 30

func calc_force(thrust, rotate):
    force = transform.basis.z + (scalar_z * (MAX_THRUST * thrust))
    add_central_force(force)

func fire_weapon():
    var clone = bullet_scene.instance()
    var scene_root = get_tree().root.get_children()[0]
    scene_root.add_child(clone)
    
    clone.global_transform = $Gunpoint.global_transform
#    clone.BULLET_DAMAGE = DAMAGE

