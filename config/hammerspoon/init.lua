-- Hammerspoon config (lives in ~/.dotfiles/config/hammerspoon, linked to ~/.config/hammerspoon)

hs.autoLaunch(true)  -- start at login

------------------------------------------------------------------------
-- Double-tap Control → toggle Ghostty's quick terminal
-- Sends the hidden global shortcut bound in config/ghostty/config.
------------------------------------------------------------------------
local DOUBLE_TAP_WINDOW = 0.3  -- seconds between taps

local types = hs.eventtap.event.types
local lastTap, ctrlDown, interrupted = 0, false, false

local function toggleQuickTerminal()
    hs.eventtap.keyStroke({ "ctrl", "alt", "cmd", "shift" }, "`", 0)
end

ctrlDoubleTap = hs.eventtap.new({ types.flagsChanged, types.keyDown }, function(e)
    if e:getType() == types.keyDown then
        interrupted = true  -- Control was used in a combo, not tapped
        return false
    end

    local f = e:getFlags()
    local onlyCtrl = f.ctrl and not (f.cmd or f.alt or f.shift or f.fn)

    if onlyCtrl and not ctrlDown then          -- Control pressed
        ctrlDown, interrupted = true, false
    elseif ctrlDown and not f.ctrl then        -- Control released
        ctrlDown = false
        if interrupted then
            lastTap = 0
        else
            local now = hs.timer.secondsSinceEpoch()
            if now - lastTap < DOUBLE_TAP_WINDOW then
                lastTap = 0
                toggleQuickTerminal()
            else
                lastTap = now
            end
        end
    elseif ctrlDown and not onlyCtrl then      -- another modifier joined
        interrupted = true
    end
    return false
end)
ctrlDoubleTap:start()
