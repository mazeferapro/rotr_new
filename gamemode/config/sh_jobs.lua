TEAM_CADET = NextRP.createJob('Кадет', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'cadet', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/olive/cadet/cadet.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Cadet',
    ranks = {
        ['Cadet'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/olive/cadet/cadet.mdl'
            },
            hp = 100, -- ХП
            ar = 0, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Кадеты',
            speed = {500, 500}, -- Значения скорости: {walkSpeed, runSpeed}
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'Кадеты'
})




--[[----------------------------------------------------------------------------------

    #:ВАР

------------------------------------------------------------------------------------]]

TEAM_21 = NextRP.createJob('Боец 21-го', {
    id = '21',
    model = {'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 200,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = true,
        },
        ['SCC'] = {
            sortOrder = 17,
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller_alt.mdl',
            },
            hp = 300,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Клон-Коммандер',
            whitelist = true,
        },
    },
    flags = {
        ['SN|Снайпер'] = {
            id = 'SN|Снайпер',
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15le',
                    'arc9_k_dc15x'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 300,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
        ['Keller'] = {
            id = 'Keller',
            model = {
                'models/jajoff/sps/cgi21s/tc13j/keller.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_westarm5',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17_stun',
                },
            },
            hp = 300,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/jajoff/sps/cgi21s/tc13j/medic_alt.mdl',
                'models/jajoff/sps/cgi21s/tc13j/medic_keller.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17_stun'
                },
            },
            hp = 300,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
        ['Пилот'] = {
            id = 'PIL',
            model = {
                'models/jajoff/sps/cgi21s/tc13j/pilot_keller_alt.mdl',
                'mmodels/jajoff/sps/cgi21s/tc13j/pilot_keller.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15a_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                    'arc9_k_dc17_stun',
                },
            },
            hp = 300,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
        ['Тяж боец'] = {
            id = 'HT',
            model = {
                'models/jajoff/sps/cgi21s/tc13j/trooper_keller.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_republicshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                    'arc9_k_dc17_stun',
                },
            },
            hp = 300,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 400,
    Salary = 200,
    category = '21-й Корпус'
})

TEAM_91 = NextRP.createJob('Боец 91-го', {
    id = '91',
    model = {'models/player/gary/91st/ink/trooper.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = true,
        },
        ['SCC'] = {
            sortOrder = 17,
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Клон-Коммандер',
            whitelist = true,
        },
    },
    flags = {
        ['SN|АРФ'] = {
            id = 'SN|ARF',
            model = {
                'models/player/gary/91st/ink/arf.mdl',
                'models/player/gary/91st/ink/sharpshooter.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15le',
                    'arc9_k_dc15x'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['ЭРК'] = {
            id = 'ARC',
            model = {
                'models/player/gary/91st/ink/arc.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_westarm5',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 550,
            ar = 70,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/player/gary/91st/ink/medic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Пилот'] = {
            id = 'PIL',
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер'] = {
            id = 'ENG',
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник'] = {
            id = 'PAR',
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arc9_k_dc15le',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_thermal',
                },
                default = {
                    'arc9_k_dc17_akimbo',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Гранатометчик'] = {
            id = 'GREN',
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dc15le',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец'] = {
            id = 'HT',
            model = {
                'models/player/gary/91st/ink/trooper.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_republicshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = '91-й Батальон'
})


TEAM_CTRP = NextRP.createJob('Боец 212-го', {
    id = 'ctrp',
    model = {'models/212_sld/212_sld.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = true,
        },
        ['SCC'] = {
            sortOrder = 17,
            model = {
                'models/212_sld/212_sld.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Клон-Коммандер',
            whitelist = true,
        },
    },
    flags = {
        ['SN|АРФ'] = {
            id = 'SN|ARF',
            model = {
                'models/212_arf/212_arf.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15le',
                    'arc9_k_dc15x'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['ЭРК'] = {
            id = 'ARC',
            model = {
                'models/212_arc/212_acr.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_westarm5',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 550,
            ar = 70,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/212_med/212_med.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Пилот'] = {
            id = 'PIL',
            model = {
                'models/212_pilot/212_pilot.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер'] = {
            id = 'ENG',
            model = {
                'models/212_eng/212_eng.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник'] = {
            id = 'PAR',
            model = {
                'models/212_para/212_para.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arc9_k_dc15le',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_thermal',
                },
                default = {
                    'arc9_k_dc17_akimbo',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Гранатометчик'] = {
            id = 'GREN',
            model = {
                'models/212_spec/212_spec.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dc15le',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец'] = {
            id = 'HT',
            model = {
                'models/212_heavy/212_heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_republicshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = '212-й Батальон'
})

TEAM_44RP = NextRP.createJob('Боец 44-й Дивизии', {
    id = '44rp',
    model = {'models/player/garith/10th_3/commando_3.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = true,
        },
    },
    flags = {
        ['Джагернаут'] = {
            id = 'JG',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },

            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_galactic_dlt19h',
                    'arc9_k_launcher_rps6_republic',
                },
                default = {
                },
            },
            hp = 600,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },

                ['Оперативная Группа D.A'] = {
            id = 'D.A',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },

            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc15x',
                    'arc9_k_nade_sonar',
                    'arc9_k_sb2',
                    'arc9_k_dc15a_stun',
                },
                default = {
                },
            },
            hp = 250,
            ar = 65,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },

        ['Десантник'] = {
            id = 'PAR',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arc9_k_dc15le',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_thermal',
                },
                default = {
                    'arc9_k_dc17_akimbo',
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },

        ['Инженер'] = {
            id = 'ENG',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
                ['SN|АРФ'] = {
            id = 'SN|ARF',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15le',
                    'arc9_k_dc15x'
                },
                default = {
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
                ['Пилот'] = {
            id = 'PIL',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['ЭРК'] = {
            id = 'ARC',
            model = {
                'models/player/garith/10th_3/commando_3.mdl',
                'models/player/garith/10th_3/darion_3.mdl',
                'models/player/garith/10th_3/evo_3.mdl',
                'models/player/garith/10th_3/grenadier_3.mdl',
                'models/player/garith/10th_3/linguini_3.mdl',
                'models/player/garith/10th_3/lizard_3.mdl',
                'models/player/garith/10th_3/marksman_3.mdl',
                'models/player/garith/10th_3/mustang_3.mdl',
                'models/player/garith/10th_3/officer_3.mdl',
                'models/player/garith/10th_3/ranger_3.mdl',
                'models/player/garith/10th_3/raz_3.mdl',
                'models/player/garith/10th_3/zair_3.mdl',
                'models/player/garith/10th_3/cerberus/fuka_3.mdl',
                'models/player/garith/cerberus/10th_3/cotton_3.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_westarm5',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 550,
            ar = 70,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = '44-я Дивизия'
})

TEAM_CTCG2 = NextRP.createJob('Боец SOF', {
    id = 'ctcg2',
    model = {'models/jajoff/sps/cgioly/tc13j/arf.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',                    
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/jajoff/sps/cgioly/tc13j/scout_fem.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/jajoff/sps/cgioly/tc13j/scout_fem.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/jajoff/sps/cgioly/tc13j/phase1_fem.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = true,
        },
                ['SLT'] = {
            sortOrder = 10,
            model = {
                'models/jajoff/sps/cgioly/tc13j/phase1_fem.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = true,
        },
                ['CPT'] = {
            sortOrder = 10,
            model = {
                'models/jajoff/sps/cgioly/tc13j/phase1_fem.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = true,
        },
    },
    flags = {
        ['КМД Оперативник'] = {
            id = 'CMD SOF',
            model = {
                'models/jajoff/sps/cgioly/tc13j/phase1_fem.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout_fem.mdl'
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc19',
                    'arc9_k_westarm5',
                    'weapon_defibrillator',
                    'fort_datapad',
                    'jet_mk5',
                    'arc9_k_nade_bacta',
                    'weapon_bactainjector',
                    'defuser_bomb',
                    'sw_datapad',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'arc9_k_dc17_stun',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Оперативник'] = {
            id = 'SOF',
            model = {
                'models/jajoff/sps/cgioly/tc13j/airborne.mdl',
                'models/jajoff/sps/cgioly/tc13j/arf.mdl',
                'models/jajoff/sps/cgioly/tc13j/phase1.mdl',
                'models/jajoff/sps/cgioly/tc13j/pilot.mdl',
                'models/jajoff/sps/cgioly/tc13j/scout.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc19',
                    'arc9_k_westarm5',
                    'weapon_defibrillator',
                    'fort_datapad',
                    'jet_mk5',
                    'arc9_k_nade_bacta',
                    'weapon_bactainjector',
                    'defuser_bomb',
                    'sw_datapad',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'arc9_k_dc17_stun',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'SOF'
})

TEAM_CTCG = NextRP.createJob('Боец Корусантской гвардии', {
    id = 'ctcg',
    model = {'models/cg_sld/cg_sld.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',                    
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'arc9_k_nade_thermal',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = true,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = true,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/cg_sld/cg_sld.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = true,
        },
    },
    flags = {
        ['K9'] = {
            id = 'K9',
            model = {
                'models/cg_arf/cg_arf.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15x'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'arc9_k_dc17_stun',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/cg_sld/cg_sld.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_bacta',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arccw_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Пилот'] = {
            id = 'PIL',
            model = {
                'models/cg_pil/cg_pil.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер'] = {
            id = 'ENG',
            model = {
                'models/cg_eng/cg_eng.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Перехватчик'] = {
            id = 'IRT',
            model = {
                'models/cg_barc/cg_barc.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Десантник'] = {
            id = 'PAR',
            model = {
                'models/cg_para/cg_para.mdl',
            },
            weapon = {
                ammunition = {
                    'jet_mk1',
                    'arc9_k_dc15le',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_thermal',
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец'] = {
            id = 'HT',
            model = {
                'models/cg_heavy/cg_heavy.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun',
                    'arc9_k_launcher_rps6_republic'
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['ЭРК'] = {
            id = 'ARC',
            model = {
                'models/arc_hammer/arc_hammer.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6adv',
                    'arc9_k_westarm5',
                    'arc9_k_cgshield',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_stun'
                },
                default = {
                },
            },
            hp = 550,
            ar = 70,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'Корусантская гвардия'
})

TEAM_CTRP125 = NextRP.createJob('Боец 125-го', {
    id = 'ctrp125',
    model = {'models/clone125_baton.mdl'},
    color = Color(127,143,166),
    default_rank = 'TRP',
    ranks = {
        ['TRP'] = {
            sortOrder = 1,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Клон Рекрут',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 150,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15s',
                    'arc9_k_dc15a_stun',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 200,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic'
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 250,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_akimbo',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 300,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
        ['СС'] = {
            sortOrder = 16,
            model = {
                'models/clone125_baton.mdl',
            },
            hp = 350,
            ar = 70,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a_stun',
                    'arc9_k_dc15s',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                },
            },
            fullRank = 'Клон-Коммандер',
            whitelist = true,
        },
    },
    flags = {
                ['SN|АРФ'] = {
            id = 'SN|ARF',
            model = {
                'models/clone125_baton.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_smoke',
                    'weapon_cuff_elastic',
                    'weapon_stunstick',
                    'arc9_k_nade_sonar',
                    'arc9_k_dc15le',
                    'arc9_k_dc15x'
                },
                default = {
                'arc9_k_dc17_akimbo',
                'realistic_hook'
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'arc9_k_dc15s',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_smoke',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Пилот'] = {
            id = 'PIl',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Инженер'] = {
            id = 'ENG',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavyengineer2.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_dp23',
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'fort_datapad',
                    'sv_datapad',
                    'defuser_bomb',
                    'weapon_squadshield_arm',
                    'arc9_k_nade_thermal',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Огнеметчик'] = {
            id = 'FTR',
            model = {
                'models/clone125snow_baton.mdl',
            },
            weapon = {
                ammunition = {
                    'weapon_imperial_flamethrower',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Тяж боец'] = {
            id = 'HT',
            model = {
                'models/clone125_baton.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_z6',
                    'arc9_k_republicshield',
                    'arc9_k_nade_smoke',
                    'arc9_k_nade_flash',
                    'arc9_k_nade_thermal',
                    'arc9_k_launcher_rps6_republic',
                    'turret_placer'
                },
                default = {
                },
            },
            hp = 250,
            ar = 75,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = '125-я Дивизия'
})

TEAM_ARCRP = NextRP.createJob('Боец ARC', {
    id = 'saweq',
    model = {'models/arc_pvt/arc_pvt.mdl'},
    color = Color(127,143,166),
    default_rank = 'REC',
    ranks = {
        ['REC'] = {
            sortOrder = 1,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arc9_k_dc17ext',
                },
                ammunition = {
                    'arc9_k_dc15a',
                    'arc9_k_nade_thermal',
                },
            },
            fullRank = 'Рекрут ЭРК',
            whitelist = false,
        },
        ['PVT'] = {
            sortOrder = 2,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['PFC'] = {
            sortOrder = 3,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой Первого Класса',
            whitelist = false,
        },
        ['CPL'] = {
            sortOrder = 4,
            model = {
                'models/arc_pvt/arc_pvt.mdl',
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капрал',
            whitelist = false,
        },
        ['JSG'] = {
            sortOrder = 5,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Младший Сержант',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 6,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['SSG'] = {
            sortOrder = 7,
            model = {
                'models/arc_sgt/arc_sgt.mdl',
            },
            hp = 350,
            ar = 55,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Старший Сержант',
            whitelist = false,
        },
        ['JLT'] = {
            sortOrder = 9,
            model = {
                'models/arc_lt/arc_lt.mdl',
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Младший Лейтенант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 10,
            model = {
                'models/arc_lt/arc_lt.mdl',
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['SLT'] = {
            sortOrder = 11,
            model = {
                'models/arc_lt/arc_lt.mdl'
            },
            hp = 400,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Старший Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 12,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['MAJ'] = {
            sortOrder = 13,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Майор',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 15,
            model = {
                'models/arc_cpt/arc_cpt.mdl',
            },
            hp = 500,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arccw_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
            ['Медик'] = {
            id = 'MED',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'arc9_k_dc15s',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_smoke',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                },
            },
            hp = 500,
            ar = 60,
            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
    },
    type = TYPE_GAR,
    control = CONTROL_GAR,
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    category = 'Батальон ЭРК'
})

TEAM_RC44RP = NextRP.createJob('Республиканский коммандос 44-го', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'rc44rp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/rc_327/rc_327.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/rc_327/rc_327.mdl'
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc17m',
                    'arc9_k_dc17m_sniper',
                    'arc9_k_dc17m_shotgun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_nade_smoke',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_RCDELTARP = NextRP.createJob('Республиканский коммандос Дельта', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'rcdeltarp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/budds/cgi_clone_commandos/delta/cgi_delta_boss.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/delta/rc_boss.mdl',
                'models/delta/rc_fixer.mdl',
                'models/delta/rc_scorch.mdl',
                'models/delta/rc_sev.mdl'
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc17m',
                    'arc9_k_dc17m_sniper',
                    'arc9_k_dc17m_shotgun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_nade_smoke',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_RCRP = NextRP.createJob('Республиканский коммандос', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'rcrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/aussiwozzi/cgi/commando/rc_blue_squad.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/aussiwozzi/cgi/commando/rc_blue_squad.mdl',
                'models/aussiwozzi/cgi/commando/rc_hope_demo.mdl',
                'models/aussiwozzi/cgi/commando/rc_hope_leader.mdl',
                'models/aussiwozzi/cgi/commando/rc_hope_sniper.mdl',
                'models/aussiwozzi/cgi/commando/rc_hope_tech.mdl',
                'models/aussiwozzi/cgi/commando/rc_junglestriker.mdl',
                'models/aussiwozzi/cgi/commando/rc_nightops.mdl',
                'models/aussiwozzi/cgi/commando/rc_plain.mdl',
                'models/aussiwozzi/cgi/commando/rc_urbanfighter.mdl',
                'models/aussiwozzi/cgi/commando/rc_ranger.mdl',
                'models/aussiwozzi/cgi/commando/rc_recon.mdl',
                'models/aussiwozzi/cgi/commando/rc_sarge.mdl',
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc17m',
                    'arc9_k_dc17m_sniper',
                    'arc9_k_dc17m_shotgun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_nade_smoke',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_WRECKERRCRP = NextRP.createJob('Республиканский коммандос Wrecker', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'wreckerrcrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'RC',
    ranks = {
        ['RC'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl'
            },
            hp = 500, -- ХП
            ar = 40, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc15sa',
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc17m',
                    'arc9_k_dc17m_sniper',
                    'arc9_k_dc17m_shotgun',
                    'realistic_hook',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_nade_smoke',
                } -- В оружейке-- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Республиканский коммандос',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {
        ['Leadfoot'] = {
            id = 'Leadfoot',
            model = {
                'models/aussiwozzi/cgi/commando/rc_vale.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                },
            },
            hp = 500,
            ar = 40,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Roadbuster'] = {
            id = 'Roadbuster',
            model = {
                'models/aussiwozzi/cgi/commando/rc_witt.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                },
            },
            hp = 500,
            ar = 40,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'Республиканский коммандос'
})

TEAM_ARCALPHARP = NextRP.createJob('Боец ARC Alpha', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arcalpharp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/arcalphasquad/alphatroopersgt.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'CPL',
    ranks = {
        ['CPL'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alphatroopersgt.mdl'
            },
            hp = 300, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капрал',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alphatroopersgt.mdl'
            },
            hp = 350, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Сержант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['LT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alphatrooperlt.mdl'
            },
            hp = 400, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Лейтенант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['CPT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alphatroopercpt.mdl'
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капитан',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
            ['Медик'] = {
            id = 'MED',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'arc9_k_dc15s',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_smoke',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17_stun'
                },
            },
            hp = 500,
            ar = 60,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'ARC | Alpha'
})

TEAM_ARCALPHARPFORDO = NextRP.createJob('Боец ARC Alpha Fordo', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arcalpharfordo', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/arcalphasquad/alpha77.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'CPL',
    ranks = {
        ['CPL'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alpha77.mdl'
            },
            hp = 300, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капрал',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alpha77.mdl'
            },
            hp = 350, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Сержант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['LT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alpha77.mdl'
            },
            hp = 400, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Лейтенант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['CPT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/arcalphasquad/alpha77.mdl'
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капитан',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
            ['Медик'] = {
            id = 'MED',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'arc9_k_dc15s',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_smoke',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17_stun'
                },
            },
            hp = 500,
            ar = 60,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = false,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'ARC | Alpha'
})

TEAM_ARCNULLRP = NextRP.createJob('Боец ARC Null', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arcnullrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'SGT',
    ranks = {
        ['SGT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17s_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Сержант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['LT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17s_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Лейтенант',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['CPT'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            hp = 500, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17s_akimbo',
                },
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_valken38',
                    'arc9_k_dp23c',
                    'arc9_k_launcher_plx1_republic',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'arc9_k_z6',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Капитан',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
        ['Прудии'] = {
            id = 'Prudii',
            model = {
                'models/player/gary/starwars/arc/alpha_prudii.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Джайнг'] = {
            id = 'Jaing',
            model = {
                'models/player/gary/starwars/arc/alpha_jaing.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Комрк'] = {
            id = 'Komrk',
            model = {
                'models/player/gary/starwars/arc/alpha_komrk.mdl',
            },
            weapon = {
                ammunition = {
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Мерил'] = {
            id = 'Mereel',
            model = {
                'models/player/gary/starwars/arc/alpha_mereel.mdl',
            },
            weapon = {
                ammunition = {
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Аден'] = {
            id = 'Aden',
            model = {
                'models/player/gary/starwars/arc/alpha_aden.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 500,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Ордо'] = {
            id = 'Ordo',
            model = {
                'models/player/gary/starwars/arc/alpha_ordo.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arc9_k_dc17s_akimbo',
                },
            },
            hp = 600,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
        ['Медик'] = {
            id = 'MED',
            model = {
                'models/clone125_baton.mdl',
                'models/navy/gnavymedic.mdl',
            },
            weapon = {
                ammunition = {
                    'arc9_k_e9',
                    'arc9_k_dc15s',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'weapon_bactanade',
                    'arc9_k_nade_smoke',
                    'arc9_k_dc17ext_akimbo',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'arc9_k_nade_stun',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                },
                default = {
                    'arc9_k_dc17_stun'
                },
            },
            hp = 500,
            ar = 60,
            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 150,
    runspead = 300,
    Salary = 100,
    -- Категория
    category = 'ARC | Null'
})

TEAM_MAZENRP = NextRP.createJob('Представитель Республиканской Разведки', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'mazenrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/gary/commission/starwars/omen_srt.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/gonzo/republicintelligence/director/director.mdl',
                'models/player/gary/commission/starwars/omen_srt.mdl'
            },
            hp = 600, -- ХП
            ar = 65, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17ext'
                }, -- При спавне
                ammunition = {
                    'arc9_k_westarm5',
                    'arc9_k_dc15x',
                    'realistic_hook',
                    'weapon_bactainjector',
                    'arc9_k_nade_thermal',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            speed = {500, 500}, -- Значения скорости: {walkSpeed, runSpeed}
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_HRUSHNRP = NextRP.createJob('Ассасин специального назначения', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'hrushnrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/wa_clone_assasine_hrush/wa_clone_assasine_hrush.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/wa_clone_assasine_hrush/wa_clone_assasine_hrush.mdl',
            },
            hp = 150, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17'
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc19',
                    'arc9_k_dc15x',
                    'jet_mk2',
                    'weapon_lightsaber_wos_vibro',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_HRUSHNRP12 = NextRP.createJob('Раззведчик специального назначения', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'hrushnrp12', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/custom/custom/cleantrooper/custom.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/custom/custom/cleantrooper/custom.mdl',
            },
            hp = 150, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {
                    'arc9_k_dc17'
                }, -- При спавне
                ammunition = {
                    'arc9_k_dc19',
                    'arc9_k_dc15x',
                    'jet_mk2',
                    'weapon_lightsaber_wos_vibro',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_HQNRP = NextRP.createJob('Боец Штаба', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'hqnrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/alpha_dotr/alpha_dotr.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'ADJ',
    ranks = {
        ['BG'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavycrewman.mdl',
                'models/alpha_dotr/alpha_dotr.mdl'
            },
            hp = 400,
            ar = 50,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Бригадный Генерал',
            whitelist = false,
        },
        ['GM'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavyengineer.mdl',
                'models/alpha_dotr/alpha_dotr.mdl'
            },
            hp = 450,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Генерал Майор',
            whitelist = false,
        },
        ['GLT'] = {
            sortOrder = 1,
            model = {
                'models/navy/gnavyofficer.mdl',
                'models/alpha_dotr/alpha_dotr.mdl'
            },
            hp = 450,
            ar = 60,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Генерал Лейтенант',
            whitelist = false,
        },
        ['ADM'] = {
            sortOrder = 1,
            model = {
                'models/jajoff/sps/republic/tc13j/tarkin.mdl',
                'models/navy/gnavyadmiral.mdl'
            },
            hp = 500,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Адмирал',
            whitelist = false,
        },
        ['GEN'] = {
            sortOrder = 1,
            model = {
                'models/mc_crown/mc_crown.mdl',
                'models/navy/gnavygunner.mdl'
            },
            hp = 600,
            ar = 65,
            weapon = {
                default = {
                    'arc9_k_dc17_stun',
                },
                ammunition = {
                    'arc9_k_dc15s_stun',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                },
            },
            fullRank = 'Генерал',
            whitelist = false,
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'Штаб'
})

TEAM_ARFRANCOR = NextRP.createJob('Боец ARF Rancor', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'arfrancor', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/arfrancor/arfrancor.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'PVT',
    ranks = {
        ['PVT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 300,
            ar = 40,
            weapon = {
                default = {
                    'arc9_galactic_westar35',
                },
                ammunition = {
                    'arc9_galactic_e9',
                    'arc9_galactic_dlt20x',
                    'arc9_galactic_dp9',
                    'arc9_galactic_dlt74',
                    'arc9_galactic_dlt20c',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Рядовой',
            whitelist = false,
        },
        ['SGT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 400,
            ar = 40,
            weapon = {
                default = {
                    'arc9_galactic_westar35',
                },
                ammunition = {
                    'arc9_galactic_e9',
                    'arc9_galactic_dlt20x',
                    'arc9_galactic_dp9',
                    'arc9_galactic_dlt74',
                    'arc9_galactic_dlt20c',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Сержант',
            whitelist = false,
        },
        ['LT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 500,
            ar = 40,
            weapon = {
                default = {
                    'arc9_galactic_westar35',
                },
                ammunition = {
                    'arc9_galactic_e9',
                    'arc9_galactic_dlt20x',
                    'arc9_galactic_dp9',
                    'arc9_galactic_dlt74',
                    'arc9_galactic_dlt20c',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Лейтенант',
            whitelist = false,
        },
        ['CPT'] = {
            sortOrder = 1,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 600,
            ar = 50,
            weapon = {
                default = {
                    'arc9_galactic_westar35',
                },
                ammunition = {
                    'arc9_galactic_e9',
                    'arc9_galactic_dlt20x',
                    'arc9_galactic_dp9',
                    'arc9_galactic_dlt74',
                    'arc9_galactic_dlt20c',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Капитан',
            whitelist = false,
        },
        ['COL'] = {
            sortOrder = 2,
            model = {
                'models/arfrancor/arfrancor.mdl'
            },
            hp = 600,
            ar = 65,
            weapon = {
                default = {
                    'arc9_galactic_westar35',
                },
                ammunition = {
                    'arc9_galactic_e9',
                    'arc9_galactic_dlt20x',
                    'arc9_galactic_dp9',
                    'arc9_galactic_dlt74',
                    'arc9_galactic_dlt20c',
                    'arc9_k_nade_thermal',
                    'arc9_k_nade_sonar',
                    'jet_mk1',
                    'weapon_bactainjector',
                    'weapon_defibrillator',
                    'arc9_k_nade_bacta',
                    'weapon_stunstick',
                    'weapon_cuff_elastic',
                    'fort_datapad',
                    'sv_datapad',
                },
            },
            fullRank = 'Полковник',
            whitelist = false,
        },
    },
    flags = {
        ['Мелинтор'] = {
            id = 'Melintor',
            model = {
                'models/mc_melintor/mc_melintor.mdl',
            },
            weapon = {
                ammunition = {
                },
                default = {
                    'arc9_galactic_westar35',
                },
            },
            hp = 600,
            ar = 50,
            replaceWeapon = false,
            replaceHPandAR = true,
            replaceModel = true,
        },
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_GAR, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = true,
    walkspead = 100,
    runspead = 250,
    Salary = 100,
    -- Категория
    category = 'ARF Rancor'
})

--[[----------------------------------------------------------------------------------

    #:Остальное
------------------------------------------------------------------------------------]]

TEAM_YOUNGJEDI = NextRP.createJob('Юнлинг', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'youngjedi', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/jedi/human.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Youngling',
    ranks = {
        ['Youngling'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                        'models/jazzmcfly/jka/younglings/jka_young_anikan.mdl',
                        'models/jazzmcfly/jka/younglings/jka_young_female.mdl',
                        'models/jazzmcfly/jka/younglings/jka_young_male.mdl',
                        'models/jazzmcfly/jka/younglings/jka_young_shak.mdl',
            },
            hp = 600, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_youngling'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Юнлинг',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_JEDI, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Джедаи'
})

TEAM_JEDI = NextRP.createJob('Джедай', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'jedi', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/jedi/human.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Padawan',
    ranks = {
        ['Padawan'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 2,
            -- Основные настройки
            model = { -- Модели
                        'models/player/jedi/bith.mdl',
                        'models/player/jedi/gotal.mdl',
                        'models/player/jedi/gungan.mdl',
                        'models/player/jedi/human.mdl',
                        'models/player/jedi/nautolan.mdl',
                        'models/player/jedi/pantoran.mdl',
                        'models/player/jedi/quarren.mdl',
                        'models/player/jedi/rodian.mdl',
                        'models/player/jedi/togruta.mdl',
                        'models/player/jedi/trandoshan.mdl',
                        'models/player/jedi/twilek.mdl',
                        'models/player/jedi/umbaran.mdl',
                        'models/player/jedi/zabrak.mdl',
                        'models/player/valley/orphne.mdl',
                        'models/gonzo/femalejedi/padawan/padawan.mdl',
                        'models/player/jedi/nyssa_delacor.mdl',
                        'models/gonzo/swtorjedi1/twilekjedi2/twilekjedi2.mdl',
            },
            hp = 800, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_padawan'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Падаван',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Knight'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 3,
            -- Основные настройки
            model = { -- Модели
                        'models/gonzo/swtorjedi1/twilekjedi1/twilekjedi1.mdl',
                        'models/gonzo/swtorjedi1/femalerevan/femalerevan.mdl',
                        'models/fire/masterfox/masterfox.mdl',
                        'models/player/jedi/nyssa_delacor.mdl',
                        'models/gonzo/femalejedi/master/master.mdl',
                        'models/player/valley/orphne.mdl',
                        'models/player/jedi/bith.mdl',
                        'models/player/jedi/gotal.mdl',
                        'models/player/jedi/gungan.mdl',
                        'models/player/jedi/human.mdl',
                        'models/player/jedi/nautolan.mdl',
                        'models/player/jedi/pantoran.mdl',
                        'models/player/jedi/quarren.mdl',
                        'models/player/jedi/rodian.mdl',
                        'models/player/jedi/togruta.mdl',
                        'models/player/jedi/trandoshan.mdl',
                        'models/player/jedi/twilek.mdl',
                        'models/player/jedi/umbaran.mdl',
                        'models/player/jedi/zabrak.mdl',
            },
            hp = 1000, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_knight'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Рыцарь',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Master'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 4,
            -- Основные настройки
            model = { -- Модели
                        'models/gonzo/swtorjedi1/twilekjedi1/twilekjedi1.mdl',
                        'models/player/swtor/arsenic/lag/ichigo.mdl',
                        'models/1/aizik.mdl',
                        'models/gonzo/swtorjedi1/femalerevan/femalerevan.mdl',
                        'models/fire/masterfox/masterfox.mdl',
                        'models/player/jedi/nyssa_delacor.mdl',
                        'models/gonzo/femalejedi/knight/knight.mdl',
                        'models/player/valley/orphne.mdl',
                        'models/player/jedi/bith.mdl',
                        'models/player/jedi/gotal.mdl',
                        'models/player/jedi/gungan.mdl',
                        'models/player/jedi/human.mdl',
                        'models/player/jedi/nautolan.mdl',
                        'models/player/jedi/pantoran.mdl',
                        'models/player/jedi/quarren.mdl',
                        'models/player/jedi/rodian.mdl',
                        'models/player/jedi/togruta.mdl',
                        'models/player/jedi/trandoshan.mdl',
                        'models/player/jedi/twilek.mdl',
                        'models/player/jedi/umbaran.mdl',
                        'models/player/jedi/zabrak.mdl',
            },
            hp = 1200, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_master' } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Мастер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Magister'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 5,
            -- Основные настройки
            model = { -- Модели
                        'models/fire/masterfox/masterfox.mdl',
                        'models/player/swtor/arsenic/lag/ichigo.mdl',
                        'models/1/aizik.mdl',
                        'models/player/jedi/sun_quix.mdl',
                        'models/gonzo/swtorjedi1/jedix1/jedix1.mdl',
                        'models/gonzo/swtorjedi1/malerevan/malerevan.mdl',
                        'models/gonzo/femalejedi/knight/knight.mdl',
                        'models/player/helios/jedi/human/human.mdl',
                        'models/player/helios/jedi/nautolan/nautolan.mdl',
                        'models/player/helios/jedi/rodian/rodian.mdl',
                        'models/player/helios/jedi/togruta/togruta.mdl',
                        'models/player/helios/jedi/zabrak/zabrak.mdl',
                        'models/player/atlas/starwars/atlas.mdl',
            },
            hp = 1400, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_magister'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Магистер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Grand Master'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 5,
            -- Основные настройки
            model = { -- Модели
                        'models/player/jedi/knight/yang_torm.mdl'
            },
            hp = 1600, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_magister'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Гранд-Мастер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
        ['Temple Watcher'] = {
            id = 'Смотрящий за храмом',

            model = {
                'models/player/jedi/knight/yang_torm.mdl'
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['guard'] = {
            id = 'Страж',

            model = {
                'models/gonzo/greyjediguard/greyjediguard.mdl'
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['defender'] = {
            id = 'Защитник',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['consul'] = {
            id = 'Консул',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['cj'] = {
            id = 'Коммандер',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['gj'] = {
            id = 'Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['sgj'] = {
            id = 'Старший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['hgj'] = {
            id = 'Высший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        }
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_JEDI, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Джедаи'
})

TEAM_OBIWANJEDI = NextRP.createJob('Оби-Ван Кеноби', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'obiwanjedi', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/player/generalkenobi/cgikenobi.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Magister',
    ranks = {
        ['Magister'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 5,
            -- Основные настройки
            model = { -- Модели
                 'models/player/generalkenobi/cgikenobi.mdl',
            },
            hp = 1400, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_magister'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Магистер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_JEDI, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Джедаи'
})

TEAM_JEDITRIFF = NextRP.createJob('Джедай Triff', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'jeditriff', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/oldjimmy/starwars/canon/triff_toral.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Magister',
    ranks = {
        ['Magister'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 5,
            -- Основные настройки
            model = { -- Модели
                        'models/oldjimmy/starwars/canon/triff_toral.mdl',
            },
            hp = 1400, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_magister'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Магистер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
        ['guard'] = {
            id = 'Страж',

            model = {
                'models/gonzo/greyjediguard/greyjediguard.mdl'
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['defender'] = {
            id = 'Защитник',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['consul'] = {
            id = 'Консул',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['cj'] = {
            id = 'Коммандер',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['gj'] = {
            id = 'Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['sgj'] = {
            id = 'Старший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['hgj'] = {
            id = 'Высший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        }
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_JEDI, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Джедаи'
})

TEAM_JEDIPEN = NextRP.createJob('Джедай Patience Kys', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'jedipen', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/oxyl/Mando_FEMALE.mdl'},
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Padawan',
    ranks = {
        ['Padawan'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 2,
            -- Основные настройки
            model = { -- Модели
                        'models/oxyl/Mando_FEMALE.mdl',
            },
            hp = 800, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_padawan'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Падаван',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Knight'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 3,
            -- Основные настройки
            model = { -- Модели
                        'models/oxyl/Mando_FEMALE.mdl',
            },
            hp = 1000, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_knight'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Рыцарь',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Master'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 4,
            -- Основные настройки
            model = { -- Модели
                        'models/oxyl/Mando_FEMALE.mdl',
            },
            hp = 1200, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_master'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Мастер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
        ['Magister'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 5,
            -- Основные настройки
            model = { -- Модели
                        'models/oxyl/Mando_FEMALE.mdl',
            },
            hp = 1400, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {'weapon_lscs', 'weapon_lightsaber_magister'} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Магистер',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {
        ['guard'] = {
            id = 'Страж',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['defender'] = {
            id = 'Защитник',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['consul'] = {
            id = 'Консул',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['cj'] = {
            id = 'Коммандер',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['gj'] = {
            id = 'Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['sgj'] = {
            id = 'Старший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        },
        ['hgj'] = {
            id = 'Высший Генерал-Джедай',

            model = {
            },
            weapon = {
                ammunition = {},
                default = {}
            },

            hp = 5,
            ar = 5,

            replaceWeapon = false,
            replaceHPandAR = false,
            replaceModel = false,
        }
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_JEDI, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Джедаи'
})

--[[----------------------------------------------------------------------------------

    #:Остальное
------------------------------------------------------------------------------------]]

TEAM_TPROLL = NextRP.createJob('РП Роль', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'tproll', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'rp',
    ranks = {
        ['rp'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
            hp = 100, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'рп',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'RP'
})

TEAM_CITYNRP = NextRP.createJob('Неизвестный', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'citynrp', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/combine_super_soldier.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Unknown',
    ranks = {
        ['Unknown'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/assassin/pm_civ_assassin_human_female.mdl',
                'models/bride/pm_civ_bride_costume_female.mdl',
                'models/cyborg/pm_civ_cyborg_costume_male.mdl',
                'models/dweller/pm_civ_dweller_human_female.mdl',
                'models/dweller/pm_civ_dweller_human_male.mdl',
                'models/engineer/pm_civ_engineer_human_female.mdl',
                'models/engineer/pm_civ_engineer_human_male.mdl',
                'models/formal/pm_civ_formal_human_female.mdl',
                'models/formal/pm_civ_formal_human_male.mdl',
                'models/merc/pm_civ_merc_human_female.mdl',
                'models/merc/pm_civ_merc_human_male.mdl',
                'models/noble/pm_civ_noble_human_female.mdl',
                'models/noble/pm_civ_noble_human_male.mdl',
                'models/ranger/pm_civ_ranger_costume_female.mdl',
                'models/rebel/pm_civ_rebel_costume_male.mdl',
                'models/renegade/pm_civ_renegade_human_female.mdl',
                'models/renegade/pm_civ_renegade_human_male.mdl',
                'models/resident/pm_civ_resident_human_female.mdl',
                'models/resident/pm_civ_resident_human_male.mdl',
                'models/scientist/pm_civ_scientist_human_female.mdl',
            },
            hp = 100, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {}, -- При спавне
                ammunition = {} -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Неизвестный',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    walkspead = 100,
    runspead = 250,
    -- Категория
    category = 'RP'
})

--

TEAM_AGENTGAR2LUSSI = NextRP.createJob('Наёмник Люси', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar2lussi', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/chet/holy/mandalorian/mandalorian_holy.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/chet/holy/mandalorian/mandalorian_holy.mdl',
            },
            hp = 250, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_westar35'}, -- При спавне
                ammunition = {
                'arc9_galactic_dlt74',
                'arc9_galactic_westar35',
                'arc9_galactic_nt242x',
                'arc9_k_nade_sonar',
                'weapon_lightsaber_wos_vibro',
                'jet_mk1',
                'alydus_fusioncutter',
                'fort_datapad',
                'defuser_bomb',
                'realistic_hook',
                    'medic_medkit',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'weapon_med_scanner',
                    'medic_tonometr'
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники ВАР'
})

TEAM_AGENTGAR2 = NextRP.createJob('Gabriel', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar2', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/frost/chsv/gabriel.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/frost/chsv/gabriel.mdl',
            },
            hp = 250, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_westar35'}, -- При спавне
                ammunition = {
                'arc9_galactic_nt242e',
                'arc9_galactic_dl44e',
                'arc9_k_nade_blaststick',
                'arc9_k_nade_sonar',
                'weapon_lightsaber_wos_vibro',
                'jet_mk1',
                'alydus_fusioncutter',
                'fort_datapad',
                'aquila_animation_swep',
                'defuser_bomb',
                'realistic_hook',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники ВАР'
})

TEAM_AGENTGAR4 = NextRP.createJob('Наёмник Сибата', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar4', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/player/arkham_origins_deathstroke_pm.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/player/arkham_origins_deathstroke_pm.mdl',
            },
            hp = 250, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_westar35'}, -- При спавне
                ammunition = {
                'arc9_galactic_cyclerobrez',
                'arc9_galactic_fwmb10k',
                'weapon_defibrillator',
                'nextrp_hands',
                'sv_datapad',
                'weapon_cuff_elastic',
                'weapon_lightsaber_wos_vibro',
                'jet_mk5',
                'weapon_lvsrepair',
                'medic_dosimetr',
                'medic_ecg_temp',
                'medic_exam',
                'medic_nerv_maleol',
                'medic_ophtalmoscope',
                'medic_otoscope',
                'medic_pulseoxymetr',
                'medic_shethoscope',
                'medic_therm',
                'medic_tonometr',
                'medic_scapula',
                'medic_expresstest_flu',
                'medic_blood',
                'medic_medkit',
                'realistic_hook',
                'weapon_bactainjector',
                'weapon_bactanade',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники'
})

TEAM_AGENTGAR3 = NextRP.createJob('Наёмник Батон', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar3', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/sdwan/arkham_knight/playermodels/arkham_knight.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/sdwan/arkham_knight/playermodels/arkham_knight.mdl',
            },
            hp = 250, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_westar35'}, -- При спавне
                ammunition = {
                'arc9_galactic_cyclerobrez',
                'arc9_galactic_fwmb10k',
                'weapon_defibrillator',
                'nextrp_hands',
                'sv_datapad',
                'weapon_cuff_elastic',
                'weapon_lightsaber_wos_vibro',
                'jet_mk5',
                'weapon_lvsrepair',
                'medic_dosimetr',
                'medic_ecg_temp',
                'medic_exam',
                'medic_nerv_maleol',
                'medic_ophtalmoscope',
                'medic_otoscope',
                'medic_pulseoxymetr',
                'medic_shethoscope',
                'medic_therm',
                'medic_tonometr',
                'medic_scapula',
                'medic_expresstest_flu',
                'medic_blood',
                'medic_medkit',
                'realistic_hook',
                'weapon_bactainjector',
                'weapon_bactanade',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники'
})

TEAM_AGENTGAR = NextRP.createJob('Агент ВАР', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'agentgar', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/oxyl/medwoman.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Classified',
    ranks = {
        ['Classified'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/oxyl/medwoman.mdl',
            },
            hp = 250, -- ХП
            ar = 50, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_westar35'}, -- При спавне
                ammunition = {
                    'arc9_galactic_cycler',
                    'realistic_hook',
                    'arc9_k_nade_bacta',
                    'weapon_defibrillator',
                    'weapon_bactainjector',
                    'medic_blood',
                    'medic_dosimetr',
                    'medic_ecg_temp',
                    'medic_exam',
                    'medic_nerv_maleol',
                    'medic_ophtalmoscope',
                    'medic_otoscope',
                    'medic_pulseoxymetr',
                    'medic_expresstest_flu',
                    'medic_scapula',
                    'medic_shethoscope',
                    'medic_therm',
                    'medic_tonometr'
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Засекреченно',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        }
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники ВАР'
})


TEAM_MERC = NextRP.createJob('Наёмник', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'merc', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = { -- Модели
                'models/knyaje pack/body_sgt/body_sgt.mdl'
            },
    color = Color(127, 143, 166),
    -- Звания
    default_rank = 'Vhetin',
    ranks = {
        ['Vhetin'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/knyaje pack/body_sgt2/body_sgt2.mdl',
                'models/knyaje pack/body_sgt/body_sgt.mdl',
                'models/knyaje pack/body_soldier/body_soldier.mdl',
                'models/knyaje pack/body_trp/body_trp.mdl',
                'models/jajoff/sps/jlmbase/modular/07female_mando2022.mdl',
                'models/player/swtor/arsenic/bones/bones01.mdl',
                'models/player/valley/bith.mdl',
                'models/player/valley/gotal.mdl',
                'models/player/valley/karkarodon.mdl',
                'models/player/valley/nossorri.mdl',
                'models/player/valley/orphne.mdl',
                'models/player/valley/talz.mdl',
                'models/jajoff/sps/jlmbase/modular/01_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/01crusader_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/02_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/03_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/04_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/05_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/06_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/07_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/08_mando2022.mdl',
            },
            hp = 300, -- ХП
            ar = 45, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_glie44e'}, -- При спавне
                ammunition = {
                'weapon_bactainjector',
                'weapon_cuff_elastic',
                'jet_mk5',
                'weapon_defibrillator',
                'weapon_lvsrepair',
                'arc9_galactic_a620su',
                'arc9_galactic_westar35',
                'arc9_galactic_iqa11e',
                'realistic_hook'
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Vhetin',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
                ['Serjant'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/knyaje pack/body_sgt2/body_sgt2.mdl',
                'models/knyaje pack/body_sgt/body_sgt.mdl',
                'models/jajoff/sps/jlmbase/modular/07female_mando2022.mdl',
                'models/knyaje pack/body_soldier/body_soldier.mdl',
                'models/knyaje pack/body_trp/body_trp.mdl',
                'models/player/swtor/arsenic/bones/bones01.mdl',
                'models/player/valley/bith.mdl',
                'models/player/valley/gotal.mdl',
                'models/player/valley/karkarodon.mdl',
                'models/player/valley/nossorri.mdl',
                'models/player/valley/orphne.mdl',
                'models/player/valley/talz.mdl',
                'models/jajoff/sps/jlmbase/modular/01_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/01crusader_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/02_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/03_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/04_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/05_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/06_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/07_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/08_mando2022.mdl',
            },
            hp = 400, -- ХП
            ar = 45, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_glie44e'}, -- При спавне
                ammunition = {
                'weapon_cuff_elastic',
                'weapon_bactainjector',
                'weapon_defibrillator',
                'weapon_lvsrepair',
                'arc9_galactic_a620su',
                'arc9_galactic_westar35',
                'arc9_galactic_iqa11e',
                'jet_mk5',
                'arc9_k_dc17_stun',
                'realistic_hook',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Serjant',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
            ['Koyalar'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/knyaje pack/body_sgt2/body_sgt2.mdl',
                'models/knyaje pack/body_sgt/body_sgt.mdl',
                'models/knyaje pack/body_soldier/body_soldier.mdl',
                'models/knyaje pack/body_trp/body_trp.mdl',
                'models/jajoff/sps/jlmbase/modular/07female_mando2022.mdl',
                'models/player/swtor/arsenic/bones/bones01.mdl',
                'models/player/valley/bith.mdl',
                'models/player/valley/gotal.mdl',
                'models/player/valley/karkarodon.mdl',
                'models/player/valley/nossorri.mdl',
                'models/player/valley/orphne.mdl',
                'models/player/valley/talz.mdl',
                'models/jajoff/sps/jlmbase/modular/01_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/01crusader_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/02_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/03_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/04_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/05_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/06_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/07_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/08_mando2022.mdl',
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_glie44e'}, -- При спавне
                ammunition = {
                'weapon_cuff_elastic',
                'weapon_bactainjector',
                'weapon_defibrillator',
                'weapon_lvsrepair',
                'arc9_galactic_dlt19h',
                'arc9_galactic_westar35',
                'arc9_galactic_a620su',
                'jet_mk5',
                'arc9_k_sb2',
                'arc9_k_dc17_stun',
                'realistic_hook',
                'arc9_galactic_cycler',
                'arc9_k_launcher_hh12_republic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Koyalar',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
            ['Kraam'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/knyaje pack/body_sgt2/body_sgt2.mdl',
                'models/knyaje pack/body_sgt/body_sgt.mdl',
                'models/knyaje pack/body_soldier/body_soldier.mdl',
                'models/knyaje pack/body_trp/body_trp.mdl',
                'models/player/swtor/arsenic/bones/bones01.mdl',
                'models/player/valley/bith.mdl',
                'models/player/valley/gotal.mdl',
                'models/jajoff/sps/jlmbase/modular/07female_mando2022.mdl',
                'models/player/valley/karkarodon.mdl',
                'models/player/valley/nossorri.mdl',
                'models/player/valley/orphne.mdl',
                'models/player/valley/talz.mdl',
                'models/jajoff/sps/jlmbase/modular/01_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/01crusader_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/02_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/03_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/04_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/05_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/06_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/07_mando2022.mdl',
                'models/jajoff/sps/jlmbase/modular/08_mando2022.mdl',
            },
            hp = 500, -- ХП
            ar = 60, -- Армор
            weapon = { -- Оружие
                default = {'arc9_galactic_glie44e'}, -- При спавне
                ammunition = {
                'weapon_cuff_elastic',
                'weapon_bactainjector',
                'weapon_defibrillator',
                'weapon_lvsrepair',
                'arc9_galactic_westar35',
                'arc9_galactic_a620su',
                'arc9_galactic_dlt19h',
                'arc9_k_sb2',
                'jet_mk5',
                'realistic_hook',
                'arc9_k_dc17_stun',
                'arc9_galactic_cycler',
                'arc9_k_launcher_hh12_republic',
                } -- В оружейке
            },
            -- Форматирование
            -- natoCode = 'OR-1',
            fullRank = 'Kraam',
            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу
        },
    },
    flags = {

    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_RPROLE, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_GAR, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    -- Стартовая
    start = false,
    Salary = 100,
    -- Категория
    category = 'Наёмники'
})

TEAM_ADMIN = NextRP.createJob('Администратор', {
    -- НЕОБХОДИМЫЕ НАСТРОЙКИ
    id = 'admin', -- УНИКАЛЬНЫЙ ID ПРОФЫ, без него вся система персонажей идёт нахуй
    -- Модель(и)
    model = {'models/dizcordum/wk/jackswan/wk_servoskull.mdl'},
    color = Color(220, 221, 225),
    -- Звания
    default_rank = 'ADMIN',
    ranks = {
        ['ADMIN'] = {
            -- Порядок сортировки, снизу вверх
            sortOrder = 1,
            -- Основные настройки
            model = { -- Модели
                'models/dizcordum/wk/jackswan/wk_servoskull.mdl'
            },
            hp = 100, -- ХП
            ar = 0, -- Армор
            weapon = { -- Оружие
                default = {'weapon_physgun', 'gmod_tool'}, -- При спавне
                ammunition = {} -- В оружейке
            },

            -- Форматирование
            natoCode = '',
            fullRank = 'Администратор',

            -- Вайтлист
            whitelist = false -- Может ли выдавать эту профу и менять звания
        },
    },
    flags = {
    },

    -- ТИПы и КОНТРОЛы
    type = TYPE_ADMIN, -- ТИП, могут быть TYPE_USA, TYPE_RUSSIA, TYPE_TERROR, TYPE_OTHER, TYPE_ADMIN, TYPE_RPROLE   control = CONTROL_NATO
    control = CONTROL_NONE, -- КОНТРОЛ, можеть быть CONTROL_NATO, CONTROL_TERRORISTS, CONTROL_HEADHUNTERS, CONTROL_NONE
    flag = 'ua',
    -- Стартовая
    start = true,
    walkspead = 250,
    runspead = 300,
    -- Категория
    category = 'Администратор'
})

START_TEAMS = {
	[TYPE_GAR] = TEAM_CADET,
}

--[[----------------------------------------------------------------------------------
By Raven
Date: 05.08.2025
Version: 14
------------------------------------------------------------------------------------]]