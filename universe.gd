class_name Universe
extends WorldEnvironment


@export var gravity: float = 0.00006
@export var massive_body : PackedScene

var massive_objects : Array[MassiveBody] = []
var x_spawn_max = 50
var y_spawn_max = 50
var z_spawn_max = 50

var velocity = Vector2.ZERO

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    ## Sun
    for i in 1:
        var generated_mass = 100000
        var random_position = Vector3(0, 0, 0)
        var body : MassiveBody = massive_body.instantiate()
        body.initialize(self, generated_mass, 50, random_position, Color(1,0,0, 1), Vector3(0, 0, 0), false)
#        var body = MassiveBody.new(generated_mass, random_position, Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 1))
        massive_objects.push_back(body)
        add_child(body)
    ## Large bodies
    for i in 0:
        var generated_mass = randf_range(100,500)
        var random_position = Vector3(randf_range(-x_spawn_max, x_spawn_max), randf_range(-y_spawn_max, y_spawn_max), randf_range(-z_spawn_max, z_spawn_max))
        var body : MassiveBody = massive_body.instantiate()
        body.initialize(self, generated_mass, generated_mass, random_position, Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 1))
#        var body = MassiveBody.new(generated_mass, random_position, Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 1))
        massive_objects.push_back(body)
        add_child(body)
    ## Small bodies
    for i in 5:
        var generated_mass = randf_range(5,25)
        var random_position = Vector3(randf_range(-x_spawn_max, x_spawn_max), randf_range(-y_spawn_max, y_spawn_max), randf_range(-z_spawn_max, z_spawn_max))
        var body : MassiveBody = massive_body.instantiate()
        body.initialize(self, generated_mass, generated_mass, random_position, Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 1))
#        var body = MassiveBody.new(generated_mass, random_position, Color(randf_range(0,1), randf_range(0,1), randf_range(0,1), 1))
        massive_objects.push_back(body)
        add_child(body)
    print(massive_objects )


func _process(delta):
    for body in massive_objects:
        var velocity = Vector3(0, 0, 0)
        for other_body in massive_objects:
            if other_body == body:
                continue
            var f = gravity * body.mass * other_body.mass / body.position.distance_squared_to(other_body.position)
            var direction = (other_body.position - body.position).normalized()
            velocity += f * direction
        body.velocity += velocity
    pass
