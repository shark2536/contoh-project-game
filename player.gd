extends CharacterBody2D

const KECEPATAN = 300
var arah = "kanan" 

func _physics_process(delta):
	gerak_player(delta)
	gerak_animasi() 
	move_and_slide()

func gerak_player(delta):
	if Input.is_key_pressed(KEY_D):
		arah = "kanan" 
		velocity.x = KECEPATAN
		velocity.y = 0
	elif Input.is_key_pressed(KEY_A):
		arah = "kiri"
		velocity.x = -KECEPATAN
		velocity.y = 0
	elif Input.is_key_pressed(KEY_S):
		velocity.x = 0
		velocity.y = KECEPATAN
	elif Input.is_key_pressed(KEY_W):
		velocity.x = 0
		velocity.y = -KECEPATAN	
	else:
		velocity.x = 0
		velocity.y = 0

func gerak_animasi(): 
	var animasi = $AnimatedSprite2D
	var sedang_bergerak = (velocity.x != 0 or velocity.y != 0)
	
	if arah == "kanan":
		animasi.flip_h = false
		if sedang_bergerak:
			animasi.play("jalan_kanan") 
		else:
			animasi.play("diam")
	elif arah == "kiri":
		animasi.flip_h = true 
		if sedang_bergerak:
			animasi.play("jalan_kanan")
		else:
			animasi.play("diam")
