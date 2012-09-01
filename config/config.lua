local T, C, L = unpack(select(2, ...))  -- Import: T - functions, constants, variables; C - config; L - locales

C['general'] = {
  ['autoscale'] = true,                   -- mainly enabled for users that don't want to mess with the config file
  ['uiscale'] = 0.71,                     -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
  ['overridelowtohigh'] = nil,            -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
  ['multisampleprotect'] = true,          -- i don't recommend this because of shitty border but, voila!
  ['threatbar'] = true,                   -- enable threat bar?
  ['blizzardreskin'] = true,              -- skin blizzard frames to match tukui?
}

C['media'] = {
  -- fonts (ENGLISH, SPANISH)
  ['font'] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
  ['uffont'] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
  ['dmgfont'] = [[Fonts\FRIZQT__.ttf]],
  ['namefont'] = [[Fonts\FRIZQT__.ttf]],
  ['pixelfont'] = [[Interface\Addons\Tukui\medias\fonts\pixel_font.ttf]], -- pixel font

  -- textures
  ['normTex'] = [[Interface\AddOns\Tukui\medias\textures\normTex]], -- texture used for tukui healthbar/powerbar/etc
  ['glowTex'] = [[Interface\AddOns\Tukui\medias\textures\glowTex]], -- the glow text around some frame.
  ['bubbleTex'] = [[Interface\AddOns\Tukui\medias\textures\bubbleTex]], -- unitframes combo points
  ['copyicon'] = [[Interface\AddOns\Tukui\medias\textures\copy]], -- copy icon
  -- ['blank'] = [[Interface\AddOns\Tukui\medias\textures\blank]], -- the main texture for all borders/panels
  ['blank'] = [[Interface\AddOns\Tukui\medias\textures\normTex]], -- the main texture for all borders/panels
  ['bordercolor'] = { .3, .3, .3 }, -- border color of tukui panels
  ['altbordercolor'] = { .3, .3, .3 }, -- alternative border color, mainly for unitframes text panels.
  ['backdropcolor'] = { .1, .1, .1 }, -- background color of tukui panels
  ['datatextcolor1'] = { 1, 1, 1 }, -- color of datatext title
  ['datatextcolor2'] = { 0, 1, 0 }, -- color of datatext result
  ['buttonhover'] = [[Interface\AddOns\Tukui\medias\textures\button_hover]],
  
  -- sound
  ['whisper'] = [[Interface\AddOns\Tukui\medias\sounds\whisper.mp3]],
  ['warning'] = [[Interface\AddOns\Tukui\medias\sounds\warning.mp3]],
}

C['unitframes'] = {
   -- general options
  ['enable'] = true,                      -- do i really need to explain this?
  ['enemyhcolor'] = nil,                  -- enemy target (players) color by hostility, very useful for healer.
  ['unitcastbar'] = true,                 -- enable tukui castbar
  ['cblatency'] = nil,                    -- enable castbar latency
  ['cbicons'] = true,                     -- enable icons on castbar
  ['auratimer'] = nil,                    -- enable timers on buffs/debuffs
  ['auratextscale'] = 11,                 -- the font size of buffs/debuffs timers on unitframes
  ['playerauras'] = nil,                  -- enable auras
  ['targetauras'] = true,                 -- enable auras on target unit frame
  ['highThreshold'] = 80,                 -- hunter high threshold
  ['lowThreshold'] = 20,                  -- global low threshold, for low mana warning.
  ['totdebuffs'] = nil,                   -- enable tot debuffs (high reso only)
  ['showtotalhpmp'] = true,               -- change the display of info text on player and target with XXXX/Total.
  ['showsmooth'] = true,                  -- enable smooth bar
  ['charportrait'] = false,               -- do i really need to explain this?
  ['maintank'] = nil,                     -- enable maintank
  ['mainassist'] = nil,                   -- enable mainassist
  ['unicolor'] = nil,                     -- enable unicolor theme
  ['combatfeedback'] = true,              -- enable combattext on player and target.
  ['playeraggro'] = nil,                  -- color player border to red if you have aggro on current target.
  ['healcomm'] = true,                    -- enable healprediction support.
  ['onlyselfdebuffs'] = nil,              -- display only our own debuffs applied on target
  ['focustarget'] = true,                 -- show focus target?
  ['combopoints'] = nil,                  -- cp icons?
  ['t12focuslayout'] = nil,               -- use tukui v12 focus layout? note that this will remove focus target!

   -- raid layout (if one of them is enabled)
  ['showrange'] = true,                   -- show range opacity on raidframes
  ['raidalphaoor'] = 0.6,                 -- alpha of unitframes when unit is out of range
  ['gridonly'] = nil,                     -- enable grid only mode for all healer mode raid layout.
  ['showsymbols'] = true,                 -- show symbol.
  ['aggro'] = nil,                        -- show aggro on all raids layouts
  ['raidunitdebuffwatch'] = true,         -- track important spell to watch in pve for grid mode.
  ['gridhealthvertical'] = true,          -- enable vertical grow on health bar for grid mode.
  ['showplayerinparty'] = nil,            -- show my player frame in party
  ['gridscale'] = 1,                      -- set the healing grid scaling
  
   -- boss frames
  ['showboss'] = true,                    -- enable boss unit frames for PVELOL encounters.
  
   -- class bar
  ['classbar'] = true,                    -- enable tukui classbar over player unit
}

C['arena'] = {
  ['unitframes'] = true,                  -- enable tukz arena unitframes (requirement : tukui unitframes enabled)
}

C['auras'] = {
  ['player'] = true,                      -- enable tukui buffs/debuffs
  ['consolidate'] = nil,                  -- enable downdown menu with consolidate buff
  ['flash'] = true,                       -- flash warning for buff with time < 30 sec
  ['highlight'] = {                       -- buffs that will be highlighted
    ['Power Torrent'] = true,
    ['Landslide'] = true,
    ['Lightweave'] = true,
  }
}

C['actionbar'] = {
  ['enable'] = true,                      -- enable tukz action bars
  ['hotkey'] = nil,                       -- enable hotkey display because it was a lot requested
  ['hideshapeshift'] = true,              -- hide shapeshift or totembar because it was a lot requested.
  ['showgrid'] = true,                    -- show grid on empty button
  ['buttonsize'] = 34,
  ['petbuttonsize'] = 29,                 -- pet & stance buttons size
  ['buttonspacing'] = 4,
}

C['nameplate'] = {
  ['enable'] = true,                      -- enable nice skinned nameplates that fit into tukui
  ['showhealth'] = nil,                   -- show health text on nameplate
  ['enhancethreat'] = nil,                -- threat features based on if your a tank or not
  ['overlap'] = true,                     -- allow nameplates to overlap
  ['combat'] = nil,                       -- only show enemy nameplates in-combat.
  ['goodcolor'] = {.29, .68, .29},        -- good threat color (tank shows this with threat, everyone else without)
  ['badcolor'] = {.78, .25, .25},         -- bad threat color (opposite of above)
  ['transitioncolor'] = {.85, .77, .36},  -- threat color when gaining threat
}

C['bags'] = {
  ['enable'] = true,                      -- enable an all in one bag mod that fit tukui perfectly
}

C['loot'] = {
  ['lootframe'] = true,                   -- reskin the loot frame to fit tukui
  ['rolllootframe'] = true,               -- reskin the roll frame to fit tukui
  ['autogreed'] = true,                   -- auto-dez or auto-greed item at max level, auto-greed Frozen orb
}

C['cooldown'] = {
  ['enable'] = true,                      -- do i really need to explain this?
  ['threshold'] = 10,                     -- show decimal under X seconds and text turn red
}

C['datatext'] = {
  ['fps_ms'] = 2,
  ['regen'] = 0,                          -- show spirit regen on panels
  ['system'] = 3,                         -- show total memory and others systems infos on panels
  ['bags'] = 5,                           -- show space used in bags on panels
  ['gold'] = 6,                           -- show your current gold on panels
  ['wowtime'] = 1,                        -- show time on panels
  ['guild'] = 0,                          -- show number on guildmate connected on panels
  ['dur'] = 4,                            -- show your equipment durability on panels.
  ['friends'] = 0,                        -- show number of friends connected.
  ['dps_text'] = 0,                       -- show a dps meter on panels
  ['hps_text'] = 0,                       -- show a heal meter on panels
  ['power'] = 0,                          -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
  ['haste'] = 0,                          -- show your haste rating on panels.
  ['crit'] = 0,                           -- show your crit rating on panels.
  ['avd'] = 0,                            -- show your current avoidance against the level of the mob your targeting
  ['armor'] = 0,                          -- show your armor value against the level mob you are currently targeting
  ['currency'] = 0,                       -- show your tracked currency on panels
  ['hit'] = 0,                            -- show your hit on panels
  ['mastery'] = 0,                        -- show your mastery on panels
  ['micromenu'] = 0,                      -- character/gm/etc menu
  ['talent'] = 0,                         -- talents
  ['calltoarms'] = 0,                     -- call to arms

  ['battleground'] = true,                -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
  ['time24'] = true,                      -- set time to 24h format.
  ['localtime'] = nil,                    -- set time to local time instead of server time.
  ['fontsize'] = 12,                      -- font size for panels.
}

C['chat'] = {
  ['enable'] = true,                      -- blah
  ['whispersound'] = true,                -- play a sound when receiving whisper
  ['background'] = nil,  
}

C['tooltip'] = {
  ['enable'] = true,                      -- true to enable this mod, false to disable
  ['hidecombat'] = nil,                   -- hide bottom-right tooltip when in combat
  ['hidebuttons'] = nil,                  -- always hide action bar buttons tooltip.
  ['hideuf'] = nil,                       -- hide tooltip on unitframes
  ['cursor'] = nil,                       -- tooltip via cursor only
}

C['merchant'] = {
  ['sellgrays'] = true,                   -- automatically sell grays?
  ['autorepair'] = true,                  -- automatically repair?
  ['sellmisc'] = {                        -- sell defined items automatically
    --[[
    [6289]  = true,                       -- Raw Longjaw Mud Snapper
    [6291]  = true,                       -- Raw Brilliant Smallfish
    [6308]  = true,                       -- Raw Bristle Whisker Catfish
    [6309]  = true,                       -- 17 Pound Catfish
    [6310]  = true,                       -- 19 Pound Catfish
    [41808] = true,                       -- Bonescale Snapper
    [42336] = true,                       -- Bloodstone Band
    [42337] = true,                       -- Sun Rock Ring
    [43244] = true,                       -- Crystal Citrine Necklace
    [43571] = true,                       -- Sewer Carp
    [43572] = true,                       -- Magic Eater
    --]]
  },
}

C['error'] = {
  ['enable'] = true,                      -- true to enable this mod, false to disable
  ['filter'] = {                          -- what messages to not hide
    [ERR_INV_FULL] = true,
    [ERR_SPELL_FAILED_ALREADY_AT_FULL_MANA] = true,
    [ERR_SPELL_FAILED_ALREADY_AT_FULL_HEALTH] = true,
    [ERR_PLAYER_WRONG_FACTION] = true,
    [ERR_ARENA_TEAM_NAME_INVALID] = true,
    [ERR_TAXIPLAYERALREADYMOUNTED] = true,
    [SPELL_FAILED_VISION_OBSCURED] = true,
    [SPELL_FAILED_TARGET_AFFECTING_COMBAT] = true,
    [ERR_OUT_OF_RANGE] = true,
    [SPELL_FAILED_NOT_BEHIND] = true,
  },
}

C['invite'] = { 
  ['autoaccept'] = true,                  -- auto-accept invite from guildmate and friends.
}
