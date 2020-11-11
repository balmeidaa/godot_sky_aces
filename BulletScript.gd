extends Spatial

var BULLET_SPEED = 1800
var BULLET_DAMAGE = 1

const KILL_TIMER = 10
var timer = 0

var hit_something = false

func _ready():
    $Area.connect("body_entered", self, "collided")


func _physics_process(delta):
    var forward_dir = global_transform.basis.z.normalized()
    global_translate(-forward_dir * BULLET_SPEED * delta)

    timer += delta
    if timer >= KILL_TIMER:
        queue_free()


func collided(body):
    if hit_something == false:
        if body.has_method("bullet_hit"):
            body.bullet_hit(BULLET_DAMAGE, global_transform)

    hit_something = true
    queue_free()
