-- gamemode/modules/generator/sh_generator_config.lua

NextRP = NextRP or {}
NextRP.Generator = NextRP.Generator or {}

-- Конфигурация модуля
NextRP.Generator.Config = {
    -- Карты на которых работает модуль
    EnabledMaps = {
        ["rp_dotrmm"] = true,
        ["rp_starwars_coruscant"] = true,
        ["rp_starwars_venator"] = true,
        ["rp_starwars_tatooine"] = true,
    },
    
    -- Настройки генератора
    Generator = {
        FuelCapacity = 100, -- Максимальный уровень топлива (100%)
        FuelConsumption = 10, -- Расход топлива за минуту (2% в минуту) - ИСПРАВЛЕНО
        Position = Vector(0, 0, 0), -- Дефолтная позиция (переопределяется для каждой карты)
        Model = "models/props_c17/substation_stripebox01a.mdl", -- Модель генератора
        ButtonText = "Нажмите E для заправки генератора",
        RefuelAmount = 15, -- Количество топлива за один кристалл (15%)
        LowFuelWarning = 25, -- При каком уровне предупреждать (25%)
        CriticalFuelWarning = 10, -- При каком уровне критическое предупреждение (10%)
        
        -- Кнопка которую нажимает генератор при отключении
        LightButtonName = "light_switch", -- Название кнопки на карте
    },
    
    -- Настройки кристаллов
    Crystals = {
        -- Жилы кристаллов (настраиваются для каждой карты)
        Veins = {},
        VeinModel = "models/props_junk/rock001a.mdl", -- Модель жилы
        VeinHealth = 150, -- Здоровье жилы
        CrystalDropAmount = {2, 5}, -- Минимум и максимум кристаллов за добычу
        RestoreTime = 420, -- Время восстановления жилы (7 минут) - ИСПРАВЛЕНО
        MiningTime = 8, -- Время добычи (8 секунд)
        MaxPlayerCrystals = 50, -- Максимальное количество кристаллов у игрока
        MiningCooldown = 2, -- Кулдаун между добычами (2 секунды)
        VeinCapacity = 10, -- Максимальное количество кристаллов в жиле
        RestoreRate = 1, -- Количество кристаллов восстанавливающихся за раз
    },
    
    -- Настройки уведомлений
    Notifications = {
        GeneratorOff = "⚠️ КРИТИЧНО! Генератор отключился! Требуется заправка!",
        LowFuel = "⚠️ ВНИМАНИЕ! Низкий уровень топлива генератора: %d%%",
        CriticalFuel = "🚨 КРИТИЧНО! Критический уровень топлива: %d%%",
        Refueled = "✅ Генератор заправлен! Уровень топлива: %d%%",
        NoFuel = "❌ Генератор полностью заправлен!",
        NoCrystals = "❌ У вас нет кристаллов для заправки!",
        MiningStarted = "⛏️ Добыча кристаллов начата...",
        MiningCompleted = "💎 Вы добыли %d кристаллов!",
        CrystalsFull = "❌ У вас максимальное количество кристаллов! (%d/%d)",
        VeinEmpty = "❌ В жиле нет кристаллов! Ждите восстановления.",
        VeinBeingMined = "❌ Эта жила уже добывается другим игроком!",
    },
    
    -- Настройки звуков (опционально)
    Sounds = {
        Mining = "ambient/machines/machine1_hit1.wav",
        Refuel = "ambient/machines/machine6_hit1.wav",
        GeneratorOff = "ambient/alarms/klaxon1.wav",
        LowFuel = "ambient/alarms/warningbell1.wav",
    }
}

-- Настройки для конкретных карт
NextRP.Generator.MapConfigs = {
    ["rp_dotrmm"] = {
        Generator = {
            Position = Vector(9957.218750, 9600.541992, -13928.968750),
            LightButtonName = "light_switch_kamino",
        },
        Crystals = {
            Veins = {
            }
        }
    },
    
    ["rp_starwars_coruscant"] = {
        Generator = {
            Position = Vector(-2000, 1500, 200),
            LightButtonName = "power_switch_coruscant",
        },
        Crystals = {
            Veins = {
                Vector(-1500, 1000, 150),
                Vector(-2500, 2000, 150),
                Vector(-1000, 800, 150),
                Vector(-2200, 1800, 150),
                Vector(-1800, 1200, 150),
                Vector(-2800, 1600, 150),
            }
        }
    },
    
    ["rp_starwars_venator"] = {
        Generator = {
            Position = Vector(0, 0, 50),
            LightButtonName = "ship_power_main",
        },
        Crystals = {
            Veins = {
                Vector(300, 400, 0),
                Vector(-300, -400, 0),
                Vector(500, -200, 0),
                Vector(-500, 200, 0),
                Vector(0, 600, 0),
                Vector(0, -600, 0),
            }
        }
    },
    
    ["rp_starwars_tatooine"] = {
        Generator = {
            Position = Vector(3000, -1000, 100),
            LightButtonName = "desert_power_switch",
        },
        Crystals = {
            Veins = {
                Vector(2500, -800, 50),
                Vector(3500, -1200, 50),
                Vector(2700, -1500, 50),
                Vector(3200, -600, 50),
                Vector(2800, -1100, 50),
                Vector(3400, -900, 50),
            }
        }
    },
}

-- Функции модуля
function NextRP.Generator:IsMapEnabled()
    local currentMap = game.GetMap()
    return self.Config.EnabledMaps[currentMap] == true
end

function NextRP.Generator:GetMapConfig()
    local currentMap = game.GetMap()
    return self.MapConfigs[currentMap] or {}
end

-- Проверяем включен ли модуль на текущей карте
if NextRP.Generator:IsMapEnabled() then
    print("[Generator] Модуль генератора активирован для карты: " .. game.GetMap())
else
    print("[Generator] Модуль генератора отключен для карты: " .. game.GetMap())
end