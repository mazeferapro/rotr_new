hook.Add( 'DatabaseInitialized', 'DatabaseInitialized2', function() 
    
    MySQLite.query([[
		CREATE TABLE IF NOT EXISTS nextrp_players(
            id int auto_increment not null primary key,
			steam_id varchar(25),
			community_id TEXT,
            discord_id varchar(255),
            char_slots INT,
            referal_code varchar(255),
            referal_code_applied varchar(255)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
	]],function(result)
        print('Пытаемся создать БД для игроков!')
    end,function(err)
		print(err)
	end)
	MySQLite.query([[
		CREATE TABLE IF NOT EXISTS nextrp_characters(
            character_id int auto_increment not null primary key,
			player_id INT,
            rpid varchar(255),
            rankid varchar(255),
            flag TEXT,
            character_name varchar(255),
            character_surname varchar(255),
            character_nickname varchar(255),
            team_id varchar(255),
            model varchar(255),
            money int,
            level INT,
            exp INT,
            inventory TEXT
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
	]],function()
        print('Пытаемся создать БД для персонажей!')
    end,
    function(err)
		print(err)
	end)

    MySQLite.query([[
		CREATE TABLE IF NOT EXISTS nextrp_talent_trees (
            id INT AUTO_INCREMENT PRIMARY KEY,
            job_id VARCHAR(255) NOT NULL,
            talent_tree TEXT NOT NULL,
            UNIQUE KEY (job_id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
	]],function()
        print('Пытаемся создать БД для деревьев талонтов!')
    end,
    function(err)
		print(err)
	end)

    MySQLite.query([[
		CREATE TABLE IF NOT EXISTS nextrp_character_talents (
            id INT AUTO_INCREMENT PRIMARY KEY,
            character_id INT NOT NULL,
            talent_id VARCHAR(255) NOT NULL,
            rank INT DEFAULT 1,
            UNIQUE KEY (character_id, talent_id),
            FOREIGN KEY (character_id) REFERENCES nextrp_characters(character_id) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
	]],function()
        print('Пытаемся создать БД для талантов персонажей!')
    end,
    function(err)
		print(err)
	end)

    MySQLite.query([[
		ALTER TABLE nextrp_characters 
        ADD COLUMN IF NOT EXISTS talent_points INT DEFAULT 0;
	]],function()
        print('Пытаемся добавить в таблицу персонажей очки талонтов!')
    end,
    function(err)
		print(err)
	end)
end)