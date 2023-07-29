extends Camera3D

@export var move_speed = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var direction = Vector3(0, 0, 0)
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1 
    if Input.is_action_pressed("ui_up"):
        direction.z -= 1  
    if Input.is_action_pressed("ui_down"):
        direction.z += 1
    if Input.is_action_pressed("ui_y_up"):
        direction.y += 1  
    if Input.is_action_pressed("ui_y_down"):
        direction.y -= 1
    var accelerate = 1
    if Input.is_action_pressed("shift"):
        accelerate = 5
    translate(direction*move_speed*accelerate)

var mouse_sens = 0.8

var mouse_sensitivity = 0.005

func _input(event):
    if event is InputEventMouseMotion:
        if event.relative.x != 0:
            var dir = -1
            rotate_object_local(Vector3.UP, dir * event.relative.x * mouse_sensitivity)
        if event.relative.y != 0:
            var dir = -1
            rotate(Vector3.RIGHT, dir * event.relative.y * mouse_sensitivity)
