hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon("ControlEscape")
hs.loadSpoon('WinWin')

hs.window.animationDuration = 0.1
spoon.ReloadConfiguration.watch_paths={"/Users/tinchiway/project/config/mac/hammerspoon"}
spoon.ReloadConfiguration:start()
local open = require('open')

local hyperex = require('hyperex')
local rightcmd = hyperex.new('rightcmd')

--------------------------------------------------------------------------------
-- open apps
--------------------------------------------------------------------------------
rightcmd:bind('w'):to(open.app('WeChat'))
rightcmd:bind('t'):to(open.app('iTerm'))
rightcmd:bind('i'):to(open.app('IntelliJ IDEA'))
rightcmd:bind('g'):to(open.app('Google Chrome'))
rightcmd:bind('s'):to(open.app('Sublime Text'))
rightcmd:bind('o'):to(open.app('Notion'))
rightcmd:bind('k'):to(open.app("Spark"))
rightcmd:bind('q'):to(open.app("QQ"))
rightcmd:bind('f'):to(open.app('Finder'))
rightcmd:bind('x'):to(open.app('咚咚'))
rightcmd:bind('d'):to(open.app('DingTalk'))
rightcmd:bind('n'):to(open.app('DataGrip'))
rightcmd:bind('a'):to(open.app('Lark'))
rightcmd:bind('m'):to(open.app('Music'))


--------------------------------------------------------------------------------
-- Remap keys
-- ctrl + n -> down, except iTerm
-- ctrl + p -> up, except iTerm
--------------------------------------------------------------------------------
local postKey = function(mods, key)
  return function() hs.eventtap.event.newKeyEvent(mods, key, true):post() end
end
local nextHotkey = hs.hotkey.new('ctrl', 'n',
  postKey({}, 'down'), nil, postKey({}, 'down')
)

local prevHotkey = hs.hotkey.new('ctrl', 'p',
  postKey({}, 'up'), nil, postKey({}, 'up')
)

local appWatcher = hs.application.watcher.new(function(appName, eventType)
    if eventType == hs.application.watcher.activated then
      if appName ~= 'iTerm2' then 
        nextHotkey:disable()
        prevHotkey:disable()
      else
        nextHotkey:enable()
        prevHotkey:enable()
      end
    end
  end)

appWatcher:start()
-- appWatcher will be stopped if the screen is locked.
hs.caffeinate.watcher.new(function(eventType)
  appWatcher:start()
end):start()
    

--------------------------------------------------------------------------------
-- Window Management
-- rightcmd + r: toggle the modal
-- in the modal:
--    q: quit the modal
--    o: maximize a window
--    f: toggle a fullscreen window
--    c: centralize a window
--    n: move a window to the next screen
--    i: input a size of the window to resize
--    u,d,l,r: Resize the focused window in the [halfup, halfdown, halfleft, halfright] by on step
--    s: shrinkr
--    e: expand
--------------------------------------------------------------------------------
local resizeModal
rightcmd:bind('r'):to(function()
  -- toggle rightcmd+r
  if resizeModal then resizeModal:exit() resizeModal = nil return end
  resizeModal = hs.hotkey.modal.new()
  local alertId = hs.alert.show('Window Management', hs.screen.mainScreen(), math.huge)
  resizeModal.exited = function() hs.alert.closeSpecific(alertId, 0) end

  resizeModal:bind('', 'q', function()
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'o', function()
    spoon.WinWin:moveAndResize('maximize')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'u', function()
    spoon.WinWin:moveAndResize('halfup')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'd', function()
    spoon.WinWin:moveAndResize('halfdown')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'l', function()
    spoon.WinWin:moveAndResize('halfleft')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'r', function()
    spoon.WinWin:moveAndResize('halfright')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 's', function()
    spoon.WinWin:moveAndResize('shrink')
  end)

  resizeModal:bind('', 'e', function()
    spoon.WinWin:moveAndResize('expand')
  end)

  resizeModal:bind('', 'f', function()
    hs.window.frontmostWindow():toggleFullScreen()
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'c', function()
    spoon.WinWin:moveAndResize('center')
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:bind('', 'n', function()
    if hs.window.frontmostWindow():isFullScreen() then
      hs.window.frontmostWindow():toggleFullScreen()
    end
    spoon.WinWin:moveToScreen('next')
  end)

  resizeModal:bind('', 'i', function()
    local frontmost = hs.window.frontmostWindow()
    hs.focus()
    local tips = 'format: [600 | 600x400]'
    local button,input = hs.dialog.textPrompt('Resizing', tips)
    if (#input == 0) then return end
    frontmost:focus()
    local s = hs.fnutils.split(input, 'x')
    local frame = frontmost:frame()
    frame.w = s[1]
    if s[2] then frame.h = s[2] end
    if frontmost:isFullScreen() then frontmost:toggleFullScreen() end
    frontmost:setFrame(frame)
    resizeModal:exit()
    resizeModal = nil
  end)

  resizeModal:enter()
end)

--------------------------------------------------------------------------------
-- notice config reloaded
--------------------------------------------------------------------------------

hs.notify.new({title='Hammerspoon', informativeText='Config Loaded'}):send()