///recievedPacked(buffer);
var buffer = argument[0];
var msgid = buffer_read(buffer, buffer_u8);

switch(msgid){

	case networkEvents.ping:
		#region
		var time = buffer_read(buffer, buffer_u32);
		Ping = current_time - time;
	break;
		#endregion
	case networkEvents.input:
			#region
		var client = buffer_read(buffer, buffer_u16);
		var key = buffer_read(buffer, buffer_u8);
		var pressed = buffer_read(buffer, buffer_bool);
		
		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
				with clientObject {
					movement_inputs[key] = pressed;
				}

			
			}else{
				var l = instance_create_layer(xx, yy, "Instances_1", objEnemy);
				clientmap[? string(client)] =l;
			}
	break;
		#endregion
	case networkEvents.position:
			#region
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		
		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
			
			with clientObject{
				x =  xx;
				y = yy;
			}
		}
		
		break;
			#endregion
	case networkEvents.rubberband:
			#region
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		var distance = buffer_read(buffer, buffer_u8);

		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
			
			with clientObject{
				if distance_to_point(xx,yy) > distance{ // server determines the distance 
					clientObject.x = xx;
					clientObject.y = yy;
					//increase_distance();
				}
			}
			
		}
			
	break;
		#endregion
	case networkEvents.shoot:
		#region
		var client = buffer_read(buffer, buffer_u16);
		var xx = buffer_read(buffer, buffer_u16);
		var yy = buffer_read(buffer, buffer_u16);
		var pointx = buffer_read(buffer, buffer_u16);
		var pointy = buffer_read(buffer, buffer_u16);
		var bullet = buffer_read(buffer, buffer_u16);

		var bulletSpeed = objBread.bulletSpeed;
		var move_speed_this_frame = bulletSpeed*global.seconds_passed;
		var character = clientmap[? string(client)];
		
		var slug = instance_create_layer(xx,yy,"Instances_1",objButterBullet);
		
		if client == objClient.MyID {
			objCamera.shooting = true;
			objCamera.alarm[2] = 10;
		}
		
		with slug{
			image_angle = point_direction(xx, yy, pointx, pointy);
			move_towards_point(pointx,pointy,move_speed_this_frame)
			ID = character;
			bulletID = bullet;
			ShootParticle(pointx,pointy);
		}
		
	break;
		#endregion
	case networkEvents.hit:
		#region
		var client = buffer_read(buffer, buffer_u16);
		var travelDirection = buffer_read(buffer, buffer_u16);
		var knockBack = buffer_read(buffer, buffer_u8);
		var stunned = buffer_read(buffer, buffer_bool);
		
		var character = clientmap[? string(client)];
		with character{
			move_contact_solid(travelDirection,knockBack);
			if stunned{
				self.stunned = stunned;
				alarm[2] = 180;
			}
		}
		
	break;
		#endregion
	case networkEvents.bullet:
		#region
		var bullet = buffer_read(buffer, buffer_u16);
		with objButterBullet{
			if bulletID = bullet{
				instance_destroy();
			}
		}
		
	break;
		#endregion
	case networkEvents.stunned:
		#region
		var client = buffer_read(buffer, buffer_u8);
		var stunned = buffer_read(buffer, buffer_bool);
		
		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
				clientObject.stunned = stunned;
				instance_create_layer(clientObject.x, clientObject.y, "Instances_1", objBlackHole);
		}
	
	break;
		#endregion
	case networkEvents.building:
		#region
		var buildingType = buffer_read(buffer, buffer_u8); //Building type (building.Generic)
		var x_pos = buffer_read(buffer, buffer_u16);
		var y_pos = buffer_read(buffer, buffer_u16);
		var bldingID = buffer_read(buffer, buffer_u16);
		
		blding = BuildingPicker(buildingType); //find the type of building that was placed
		
		var building = instance_create_layer(x_pos,y_pos,"Buildings",blding);
		building.buildingID = bldingID
		
	break;
		#endregion
	case networkEvents.buildingDestroy:
		#region
		/*
		var bldingID = buffer_read(buffer, buffer_u16);
		with objBuilding {
			if buildingID = bldingID{
				instance_destroy(self);	
			}
		}
	*/
	
	//you connected
	break;
		#endregion
	case networkEvents.highscore:
		#region
		var highScoreMap = json_decode(buffer_read(buffer, buffer_string));
		
		
		
	break;
		#endregion
	case networkEvents.lookingDirection:
		#region
		var client = buffer_read(buffer, buffer_u16);
		var Dir = buffer_read(buffer, buffer_u8);
		
		if(ds_map_exists(clientmap, string(client))){
			var clientObject = clientmap[? string(client)];
			with clientObject{
				image_index = Dir;
			}
		}
	break;
		#endregion
	case networkEvents.name:
		#region
		var client = buffer_read(buffer, buffer_u16);
		var name = buffer_read(buffer, buffer_string);
		
		if(ds_map_exists(clientmap, string(client))){
		var clientObject = clientmap[? string(client)];
			clientObject.name = name;
		}
		#endregion
	break;

	case networkEvents.initialConnect:
		#region
		var 
		client = buffer_read(buffer, buffer_u16),
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16);
		
			var l = instance_create_layer(startx, starty, "Instances_1", objBread);
			l.CharacterID = client;
			clientmap[? string(client)] =l;
			MyID = client;
			instance_create_layer(0,0,"Instances", objCamera);
	//Send Name
		buffer_seek(self.buffer, buffer_seek_start, 0);
		buffer_write(self.buffer, buffer_u8, networkEvents.name); //message ID
		buffer_write(self.buffer, buffer_string, objClient.playerName); //Name
		
		network_send_packet(socket, self.buffer, buffer_tell(self.buffer));
		break;
		#endregion
//Someone connected	
	case networkEvents.connect:
		#region
		var 
		client = buffer_read(buffer, buffer_u16),
		startx = buffer_read(buffer, buffer_u16),
		starty = buffer_read(buffer, buffer_u16);
		
			var l = instance_create_layer(startx, starty, "Instances_1", objEnemy);
			l.CharacterID = client;
			clientmap[? string(client)] =l;
			
	break;
		#endregion
	
//Client Disconnect
	case networkEvents.disconnect: 
		#region
		var client = buffer_read(buffer, buffer_u16);
		var clientObject = clientmap[? string(client)];
		
		if clientObject != undefined && instance_exists(clientObject) {
			instance_destroy(clientObject);
			ds_map_delete(clientmap, string(client));
		}
	
	break;
		#endregion
}
