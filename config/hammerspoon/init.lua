-- Hammerspoon config (lives in ~/.dotfiles/config/hammerspoon, linked to ~/.config/hammerspoon)

hs.autoLaunch(true)  -- start at login

------------------------------------------------------------------------
-- Double-tap Control:
--   Control ×2        → toggle Ghostty's quick terminal
--   Fn (held) + Control ×2 → open a new regular Ghostty window
-- The quick terminal uses the hidden global shortcut bound in
-- config/ghostty/config; the new window uses Ghostty's AppleScript API.
------------------------------------------------------------------------
local DOUBLE_TAP_WINDOW = 0.3  -- seconds between taps

local types = hs.eventtap.event.types
local lastTap, lastMode = 0, nil
local ctrlDown, downMode, interrupted = false, nil, false

local function toggleQuickTerminal()
    hs.eventtap.keyStroke({ "ctrl", "alt", "cmd", "shift" }, "`", 0)
end

local function newGhosttyWindow()
    hs.osascript.applescript([[
        tell application "Ghostty"
            activate
            new window
        end tell
    ]])
end

local actions = { plain = toggleQuickTerminal, fn = newGhosttyWindow }

-- "plain" = only Control held; "fn" = only Fn + Control held; nil = anything else
local function mode(f)
    if not f.ctrl or f.cmd or f.alt or f.shift then return nil end
    return f.fn and "fn" or "plain"
end

ctrlDoubleTap = hs.eventtap.new({ types.flagsChanged, types.keyDown }, function(e)
    if e:getType() == types.keyDown then
        interrupted = true  -- Control was used in a combo, not tapped
        return false
    end

    local f = e:getFlags()
    local m = mode(f)

    if not ctrlDown then
        if m then ctrlDown, downMode, interrupted = true, m, false end  -- Control pressed
    elseif not f.ctrl then                                              -- Control released
        ctrlDown = false
        if interrupted then
            lastTap = 0
        else
            local now = hs.timer.secondsSinceEpoch()
            if lastMode == downMode and now - lastTap < DOUBLE_TAP_WINDOW then
                lastTap = 0
                actions[downMode]()
            else
                lastTap, lastMode = now, downMode
            end
        end
    elseif m ~= downMode then                                           -- Fn/other modifier changed mid-tap
        interrupted = true
    end
    return false
end)
ctrlDoubleTap:start()

------------------------------------------------------------------------
-- Helium: restore Fn+Control+↑/↓ window tiling
-- With Fn held, ↑/↓ arrive as Page Up/Down, and Chromium binds Control+Page
-- Up/Down to switching tabs, so macOS never gets to tile. While Helium is
-- focused, catch them and trigger Window → Move & Resize directly.
-- Left/right (Home/End) already work natively.
-- The physical Fn key is tracked so a real Control+Page Up/Down (tab switch)
-- keeps working.
------------------------------------------------------------------------
local HELIUM = "net.imput.helium"
local FN_KEYCODE = 63
local tileItems = {
    [116] = "Top",     -- Fn+↑ arrives as Page Up
    [121] = "Bottom",  -- Fn+↓ arrives as Page Down
}

local fnHeld = false
heliumFnTracker = hs.eventtap.new({ types.flagsChanged }, function(e)
    if e:getKeyCode() == FN_KEYCODE then fnHeld = e:getFlags().fn == true end
    return false
end)
heliumFnTracker:start()

heliumTiling = hs.eventtap.new({ types.keyDown }, function(e)
    local item = tileItems[e:getKeyCode()]
    if not (item and fnHeld) then return false end

    local f = e:getFlags()
    if not f.ctrl or f.cmd or f.alt or f.shift then return false end

    local app = hs.application.frontmostApplication()
    if not (app and app:bundleID() == HELIUM) then return false end

    app:selectMenuItem({ "Window", "Move & Resize", item })
    return true  -- swallow so Helium doesn't also see it
end)
heliumTiling:start()
