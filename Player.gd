extends KinematicBody2D

var velocity = Vector2.ZERO #Movimentação no eixo X e Y
var move_speed = 480 #Velocidade de movimento
var gravity = 1200 #Gravidade
var jump_force = -720 #Força de pulo

func _physics_process(delta: float) -> void:
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")) #move_right é positivo  e move_left é negativo e aqui existe uma comparação, assim que pressionar a tecla ele compara e vai
	velocity.x = move_speed * move_direction #a movimentação do eixo x é igual a velocidade de movimento vezes a direção
	
	velocity.y += gravity * delta
	if Input.is_action_pressed("jump"): # Se inserir a tecla jump o player irá pular.
		velocity.y = jump_force/2 #dividir o pulo por 2 para diminuir a força do salto
		
	
	
	
	move_and_slide(velocity) # o nó Knamticbody2d precisa dessa função para movimentar
