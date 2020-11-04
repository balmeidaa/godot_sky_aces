extends KinematicBody

var turn_speed = 1
var speed = 3

func _physics_process(delta):
    if Input.is_action_pressed("W"):
        global_rotate(transform.basis.x, turn_speed * delta)
    if Input.is_action_pressed("S"):
        global_rotate(transform.basis.x, -turn_speed * delta)
    if Input.is_action_pressed("D"):
        global_rotate(transform.basis.y, -turn_speed * delta)
    if Input.is_action_pressed("A"):
        global_rotate(transform.basis.y, turn_speed * delta)
    if Input.is_action_pressed("Q"):
        global_rotate(transform.basis.z, turn_speed * delta)
    if Input.is_action_pressed("E"):
        global_rotate(transform.basis.z, -turn_speed * delta)

    move_and_collide(-global_transform.basis.z * speed * delta)
