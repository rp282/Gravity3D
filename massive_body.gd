class_name MassiveBody
extends Node3D


@export var mass : float
@export var glow_factor = 0.0001
var color : Color
var radius : float
var mesh : MeshInstance3D
var joinable : bool
var velocity : Vector3
var universe : Universe
var fixed : bool = false

func _process(delta):
    if not fixed:
        position += velocity
    

func initialize(u: Universe, m: float, diameter: float, pos: Vector3, c: Color, v: Vector3 = Vector3(0, 0, 0), f: bool = false):
    mass = m
    var sphere = SphereMesh.new()
    sphere.radius = diameter / 2
    sphere.height = diameter
    sphere.radial_segments = 64
    sphere.rings = 32
    position = pos
    var material = StandardMaterial3D.new()
    color = c
    material.albedo_color = color
    sphere.surface_set_material(0, material)
    velocity = v
    universe = u
    $Mesh.mesh = sphere
    fixed = f
