-- gamemode/modules/autoevents/sh_config.lua

NextRP = NextRP or {}
NextRP.AutoEvents = NextRP.AutoEvents or {}

NextRP.AutoEvents.Config = {
    -- Карты и их настройки
    Maps = {
        ["rp_dotrmm"] = {
            name = "Основная карта",
            is_main = true,
            description = "Основная карта для ролевой игры",
            reward_xp = 5000,
        },
        
        ["rp_naboo_city_v2_3"] = {
            name = "Оборона города (Набу)",
            is_main = false,
            event_type = "defense", 
            description = "Защищайте базу от волн врагов!",
            duration = 1800, -- 15 минут
            defense_radius = 3879,
            reward_xp = 5000,
            
            -- Настройки обороны
            reinforcement_points = 50, -- Очки подкрепления
            
            droppods = {
                -- 1-я волна
                {
                    spawn_delay = 0,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 2-я волна
                {
                    spawn_delay = 300,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 3-я волна
                {
                    spawn_delay = 600,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 4-я волна
                {
                    spawn_delay = 900,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 5-я волна
                {
                    spawn_delay = 1200,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 6-я волна
                {
                    spawn_delay = 1500,
                    drop_position = Vector(1823.1453857422, 3424.9597167969, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(1746.0297851563, 1998.9768066406, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(1759.3996582031, -845.97662353516, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(3437.7644042969, 1469.9851074219, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(4242.0107421875, 1405.9736328125, -511.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
            },

            vehicles = {
                -- 1-я волна
                {
                    spawn_delay = 0,
                    spawn_position = Vector(2535.408691, 6967.977539, -159.368256), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(8190.653320, 1803.982056, -331.325989),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 15,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 30,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 3-я волна
                {
                    spawn_delay = 600,
                    spawn_position = Vector(2535.408691, 6967.977539, -159.368256), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(8190.653320, 1803.982056, -331.325989),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 615,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 630,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 6-я волна
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(2535.408691, 6967.977539, -159.368256), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(8190.653320, 1803.982056, -331.325989),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1515,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1530,
                    spawn_position = Vector(8209.154297, 7857.237305, 2596.658936),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
            },

            -- Волны атакующих NPC
            attack_waves = {
                {
                    wave_number = 1,
                    delay = 0, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 2,
                    delay = 150, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 3,
                    delay = 300, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 4,
                    delay = 420, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 5,
                    delay = 600, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 6,
                    delay = 750, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 7,
                    delay = 900, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 8,
                    delay = 1050, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 9,
                    delay = 1200, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 10,
                    delay = 1350, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 10, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 11,
                    delay = 1500, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
                {
                    wave_number = 12,
                    delay = 1650, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
            }
        },

        ["rp_desert_conflict"] = {
            name = "Захват территории (Desert)", 
            is_main = false,
            event_type = "capture",
            description = "Отбейте все точки от NPC врагов!",
            duration = 1800, -- 20 минут
            reward_xp = 5000,
            
            -- Настройки захвата
            capture_points = 4,
            reinforcement_points = 40, -- Очки подкрепления
            
            droppods = {
                -- атака на спавн
                {
                    spawn_delay = 0,
                    drop_position = Vector(9837.6875, -1933.3649902344, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(9789.625, -2579.1574707031, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(9486.234375, -3183.341796875, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(8947.3212890625, -3055.7087402344, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(9093.6064453125, -2270.8498535156, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 300,
                    drop_position = Vector(3516.8701171875, -6322.0952148438, -516.53570556641), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(3754.2861328125, -5891.1005859375, -512), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(-7252.1943359375, -4695.6303710938, -519.65728759766), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(-6655.072265625, -4410.1323242188, -507.55908203125), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(-8604.4296875, -4873.369140625, -540.75646972656), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 600,
                    drop_position = Vector(-9890.3095703125, 772.19665527344, -495.96878051758), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-9853.005859375, 1440.5076904297, -495.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-9861.8115234375, 1598.0954589844, -495.96875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-11519.30859375, -7001.5219726563, -512), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-11347.696289063, -7416.5063476563, -512), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 900,
                    drop_position = Vector(-9866.4970703125, -11926.384765625, -503.48504638672), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-9927.763671875, -10608.833984375, -512), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-9892.1142578125, -11229.975585938, -512), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-11120.625, -12612.439453125, -512.00012207031), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-12292.5390625, -12718.491210938, -511.99993896484), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
            },

            vehicles = {
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 15, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(8521.674805, -5083.527832, 3670.937012), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 15, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(8521.674805, -5083.527832, 3670.937012), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },

                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(7877.770508, -5562.620605, -380.404083), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(12790.608398, -6484.088867, 732.285583), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 15, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(7877.770508, -5562.620605, -380.404083), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                -- 5 минута
                {
                    spawn_delay = 300, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 315, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },{
                    spawn_delay = 330, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 310, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-3730.555176, -9337.451172, -330.514160), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 325, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-3730.555176, -9337.451172, -330.514160), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                -- 15 минута
                {
                    spawn_delay = 900, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 915, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },{
                    spawn_delay = 930, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2011.532104, -1829.759277, 3551.425781), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 910, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-11841.627930, -905.282227, -305.484375), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 925, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-11841.627930, -905.282227, -305.484375), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
            },

            -- NPC защитники точек
            defenders = {
                count_per_point = 3, -- NPC на каждой точке
                spawn_waves = 0, -- Количество волн подкрепления NPC
                wave_interval = 300000, -- Интервал между волнами NPC (3 минуты)
                
                npc_types = {
                    {class = "npc_summe_bx", health = 500, weapon = "default"},
                }
            }
        },

        ["geonosis"] = {
            name = "Захват территории (Geonosis)", 
            is_main = false,
            event_type = "capture",
            description = "Отбейте все точки от NPC врагов!",
            duration = 1200, -- 20 минут
            reward_xp = 5000,

            -- Настройки захвата
            capture_points = 3,
            reinforcement_points = 40, -- Очки подкрепления
            
            droppods = {
                -- атака на спавн
                {
                    spawn_delay = 0,
                    drop_position = Vector(-7691.4555664063, -9751.88671875, 0), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(-7998.2895507813, -8709.34765625, -7.62939453125e-06), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(-8584.8095703125, -8696.59375, 3.0517578125e-05), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(-8530.4541015625, -9310.3525390625, 0), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(-8347.305664, -9219.142578, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 300,
                    drop_position = Vector(-3395.6450195313, -3954.9738769531, 376.19775390625), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(-3395.6450195313, -3954.9738769531, 376.19775390625), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(-1757.0139160156, -4128.1396484375, 397.89849853516), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(1206.2700195313, -3584.4108886719, 391.18310546875), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(1050.9024658203, -4054.0615234375, 437.08999633789), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 600,
                    drop_position = Vector(-1643.0552978516, 3162.5009765625, -4.1396484375), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-2280.486328125, 3094.8969726563, -4.8634033203125), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-3046.55078125, 3049.3857421875, -6.0684814453125), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-2911.7683105469, 4003.1506347656, 7.7357177734375), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(-1994.2653808594, 3963.4777832031, 0.0001220703125), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
                -- подкрепления на точки
                {
                    spawn_delay = 900,
                    drop_position = Vector(-3702.5024414063, 6937.6254882813, -3.0517578125e-05), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-4020.1057128906, 6497.4096679688, 29.333953857422), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-4382.5537109375, 6049.9838867188, 87.215911865234), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-4736.962890625, 6410.51171875, 54.114410400391), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(-4315.0849609375, 6994.0356445313, 6.103515625e-05), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 5000, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                    }
                },
            },

            vehicles = {
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-3911.968506, -8822.458008, 2616.841309), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-4640.720703, -6234.956543, 2505.651367), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(8521.674805, -5083.527832, 3670.937012), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-6057.093262, -8890.333984, 262.214569), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(12790.608398, -6484.088867, 732.285583), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-6724.588379, -7993.616699, 211.886627), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },

                -- 15 минута
                {
                    spawn_delay = 300, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(2172.447266, 77.542526, 2918.799805), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5227.957031, -8239.655273, 3761.996094), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 300, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-377.560486, 1757.923218, 3714.269531), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(8521.674805, -5083.527832, 3670.937012), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 600, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(843.044250, -3206.275146, 533.374756), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(-4674.607422, 9362.131836, 868.518433), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 300, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(843.044250, -3206.275146, 533.374756), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(-6184.420410, 9338.704102, 736.988220), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 600, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-377.560486, 1757.923218, 3714.269531), -- Позиция спавна
                    vehicle_class = "lvs_gunship_hmp", -- Класс LVS техники
                    target_position = Vector(8450.473633, -9825.648438, 803.435242), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
            },

            -- NPC защитники точек
            defenders = {
                count_per_point = 10, -- NPC на каждой точке
                spawn_waves = 0, -- Количество волн подкрепления NPC
                wave_interval = 300000, -- Интервал между волнами NPC (3 минуты)
                
                npc_types = {
                    {class = "npc_summe_bx", health = 500, weapon = "default"},
                }
            }
        },

        ["gm_redrock2"] = {
            name = "Захват территории", 
            is_main = false,
            event_type = "capture",
            description = "Отбейте все точки от NPC врагов!",
            duration = 1200, -- 20 минут
            
            -- Настройки захвата
            capture_points = 3,
            reinforcement_points = 50, -- Очки подкрепления
            


            -- NPC защитники точек
            defenders = {
                count_per_point = 20, -- NPC на каждой точке
                spawn_waves = 2, -- Количество волн подкрепления NPC
                wave_interval = 30, -- Интервал между волнами NPC (3 минуты)
                
                npc_types = {
                    {class = "npc_combine_s", health = 100, weapon = "weapon_ar2"},
                    {class = "npc_combine_s", health = 120, weapon = "weapon_shotgun"},
                    {class = "npc_metropolice", health = 80, weapon = "weapon_pistol"},
                }
            }
        },
        
        ["event_christophsis_tgc"] = {
            name = "Оборона базы (Кристовсис)",
            is_main = false,
            event_type = "defense", 
            description = "Защищайте базу от волн врагов!",
            duration = 1800, -- 15 минут
            defense_radius = 5000,
            reward_xp = 5000,
            
            -- Настройки обороны
            reinforcement_points = 50, -- Очки подкрепления
            
            droppods = {
                -- 1-я волна
                {
                    spawn_delay = 0,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                -- 2-я волна
                {
                    spawn_delay = 300,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 3-я волна
                {
                    spawn_delay = 600,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 4-я волна
                {
                    spawn_delay = 900,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 5-я волна
                {
                    spawn_delay = 1200,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 6-я волна
                {
                    spawn_delay = 1500,
                    drop_position = Vector(12352.064453, 1602.229492, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(14052.937500, 1608.531128, 128.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(12356.615234, 129.476440, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(14024.107422, 173.577042, 192.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
            },

            vehicles = {
                -- 1-я волна
                {
                    spawn_delay = 0,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 2-я волна
                {
                    spawn_delay = 300,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 3-я волна
                {
                    spawn_delay = 600,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 4-я волна
                {
                    spawn_delay = 900,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 5-я волна
                {
                    spawn_delay = 1200,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 1200,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1200,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1200,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 6-я волна
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(7035.809570, -544.480530, 298.091888), -- Позиция спавна
                    vehicle_class = "lvs_fakehover_aat", -- Класс LVS техники
                    target_position = Vector(7035.809570, -544.480530, 298.091888), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(7030.126953, 447.848511, 298.091888),
                    vehicle_class = "lvs_fakehover_aat",
                    target_position = Vector(7030.126953, 447.848511, 298.091888),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(5074.908691, 874.085938, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(5074.908691, 874.085938, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4995.602539, -1001.311829, 3181.736328),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 1500,
                    spawn_position = Vector(2756.575684, 454.630188, 4551.2265628),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(2756.575684, 454.630188, 4551.2265628),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
            },

            -- Волны атакующих NPC
            attack_waves = {
                {
                    wave_number = 1,
                    delay = 0, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 2,
                    delay = 150, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 3,
                    delay = 300, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 4,
                    delay = 420, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 5,
                    delay = 600, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 6,
                    delay = 750, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 7,
                    delay = 900, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 8,
                    delay = 1050, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 9,
                    delay = 1200, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 10,
                    delay = 1350, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 10, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 11,
                    delay = 1500, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
                {
                    wave_number = 12,
                    delay = 1650, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
            }
        },

        ["gm_flatgrass"] = {
            name = "Оборона зоны",
            is_main = false,
            event_type = "defense", 
            description = "Защищайте зону от волн врагов!",
            duration = 180, -- 15 минут
            defense_radius = 5000,
            reward_xp = 5000,
            
            -- Настройки обороны
            reinforcement_points = 75, -- Очки подкрепления
            
            droppods = {
                -- 1-я волна
                {
                    spawn_delay = 0,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 0,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                    }
                },
                -- 2-я волна
                {
                    spawn_delay = 300,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 300,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                    }
                },
                -- 3-я волна
                {
                    spawn_delay = 600,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 600,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 4-я волна
                {
                    spawn_delay = 900,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 900,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 5-я волна
                {
                    spawn_delay = 1200,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1200,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_b1", count = 5, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 1, health = 500, weapon = "default"},
                    }
                },
                -- 6-я волна
                {
                    spawn_delay = 1500,
                    drop_position = Vector(13870.913086, 9970.981445, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/bd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(12664.716797, 9324.550781, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/sbd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(9684.741211, 11378.449219, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/sbd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
                {
                    spawn_delay = 1500,
                    drop_position = Vector(9386.334961, 12620.991211, 64.031250), -- Позиция падения
                    model = "models/props/starwars/vehicles/sbd_dispenser.mdl", -- Модель пода
                    health = 1500, -- Здоровье пода
                    npcs = {
                        {class = "npc_summe_bx", count = 5, health = 500, weapon = "default"},
                    }
                },
            },

            vehicles = {
                {
                    spawn_delay = 60, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(-1473.497925, 4270.255859, -8475.641602), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(-1473.497925, 4270.255859, -8475.641602), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 60,
                    spawn_position = Vector(4109.547852, 5210.039062, -3918.117432),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4109.547852, 5210.039062, -3918.117432),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                }
            },

            -- Волны атакующих NPC
            attack_waves = {
                {
                    wave_number = 1,
                    delay = 0, -- Начало через 1 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 2,
                    delay = 60, -- Через 3 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 15, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 3,
                    delay = 120, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 20, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 4,
                    delay = 180, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 20, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 5,
                    delay = 240, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 30, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 5, health = 5000, weapon = "default"},
                    }
                }
            }
        },

        ["[event]_mygeeto_clswrp"] = {
            name = "Майгито (Оборона)",
            is_main = false,
            event_type = "defense", 
            description = "Защищайте зону от волн врагов!",
            duration = 1800, -- 30 минут
            defense_radius = 4324,
            reward_xp = 5000,
            
            -- Настройки обороны
            reinforcement_points = 50, -- Очки подкрепления
            
            droppods = {
                
            },

            vehicles = {
                -- 1-я волна
                {
                    spawn_delay = 0, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 30,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 30,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 0,
                    spawn_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 2-я волна
                {
                    spawn_delay = 300, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 300,
                    spawn_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 3-я волна
                {
                    spawn_delay = 600, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 600,
                    spawn_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                -- 4-я волна
                {
                    spawn_delay = 900, -- Через 3 минуты после начала ивента
                    spawn_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Позиция спавна
                    vehicle_class = "lvs_starfighter_vulturedroid", -- Класс LVS техники
                    target_position = Vector(5351.256348, 7571.652344, 2304.110107), -- Куда ехать
                    team = "enemy", -- Команда (enemy/ally)
                    health_multiplier = 1.5, -- Множитель здоровья
                    ai_enabled = true -- Включить ИИ
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(7978.174805, 5405.392090, 2158.288330),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(4208.342285, 9057.770508, 542.323669),
                    vehicle_class = "lvs_starfighter_vulturedroid",
                    target_position = Vector(4208.342285, 9057.770508, 542.323669),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
                {
                    spawn_delay = 900,
                    spawn_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    vehicle_class = "lvs_gunship_hmp",
                    target_position = Vector(8905.221680, 3359.344482, 2813.437988),
                    team = "enemy",
                    health_multiplier = 2.0,
                    ai_enabled = true
                },
            },

            -- Волны атакующих NPC
            attack_waves = {
                {
                    wave_number = 1,
                    delay = 0, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 2,
                    delay = 150, -- Начало через 0 минуту
                    npcs = {
                        {class = "npc_summe_b1", count = 55, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 3,
                    delay = 300, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 4,
                    delay = 420, -- Через 5 минуты
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                    }
                },
                {
                    wave_number = 5,
                    delay = 600, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 6,
                    delay = 750, -- Через 5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                    }
                },
                {
                    wave_number = 7,
                    delay = 900, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 8,
                    delay = 1050, -- Через 7.5 минут
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                    }
                },
                {
                    wave_number = 9,
                    delay = 1200, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 6, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 10,
                    delay = 1350, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 4, health = 2500, weapon = "default"},
                        {class = "npc_summe_bx", count = 10, health = 1000, weapon = "default"},
                        
                    }
                },
                {
                    wave_number = 11,
                    delay = 1500, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
                {
                    wave_number = 12,
                    delay = 1650, -- Через 10 минут (финальная волна)
                    npcs = {
                        {class = "npc_summe_b1", count = 50, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_heavy", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_officer", count = 2, health = 500, weapon = "default"},
                        {class = "npc_summe_b1_sniper", count = 10, health = 500, weapon = "default"},
                        {class = "npc_summe_b2", count = 15, health = 1000, weapon = "default"},
                        {class = "npc_summe_b3", count = 4, health = 5000, weapon = "default"},
                        {class = "npc_summe_crab", count = 10, health = 2500, weapon = "default"},
                    }
                },
            }
        }
    },
    
    -- Расписание ивентов (конкретные ивенты в конкретное время)
    Schedule = {
        {
            name = "Оборона (Майгито)",
            hour = 22,
            minute = 00,
            map = "[event]_mygeeto_clswrp"
        },
    },
    
    -- Настройки
    Settings = {
        min_players = 0, -- Минимум игроков для запуска ивента
        notification_time = 300, -- За сколько секунд уведомлять о смене карты (5 минут)
        change_delay = 30, -- Задержка смены карты в секундах
        
        -- Настройки времени подготовки
        preparation_time = 300, -- Время на подготовку в секундах (1 минута)
        preparation_notifications = {30, 10, 5, 3, 2, 1}, -- Уведомления за N секунд до начала
        
        -- НОВЫЕ НАСТРОЙКИ ОТСЧЕТА ДО ИВЕНТА ПО РАСПИСАНИЮ
        schedule_countdown_enabled = true, -- Включить отсчет времени до ивента
        schedule_countdown_hud = true, -- Показывать HUD с отсчетом
        schedule_countdown_notifications = {
            3600, -- За час (1 час = 3600 секунд)
            1800, -- За 30 минут
            900,  -- За 15 минут
            600,  -- За 10 минут
            300,  -- За 5 минут
            180,  -- За 3 минуты
            60,   -- За минуту
            30    -- За 30 секунд
        },
        schedule_countdown_min_time = 300, -- Минимальное время отсчета (30 минут)
        
        -- Настройки очков подкрепления
        death_cost = 1, -- Сколько очков тратится за смерть игрока
        zone_damage = 10, -- Урон в секунду вне зоны обороны
        zone_damage_interval = 1, -- Интервал урона в секундах
        
        -- Награды
        victory_rewards = {
            experience = 1000,
            money = 5000,
        },

        droppod_settings = {
            fall_height = 100, -- Высота падения в единицах
            fall_speed_multiplier = 1.0, -- Множитель скорости падения
            impact_radius = 200, -- Радиус урона при падении
            impact_damage = 150, -- Урон при падении
            spawn_delay_after_land = 3, -- Задержка спавна NPC после приземления (секунды)
            destruction_delay = 60, -- Через сколько секунд удалить под после высадки всех NPC
        },

        timezone_offset = 3,
    }
}

print("[AutoEvents] Конфигурация загружена")