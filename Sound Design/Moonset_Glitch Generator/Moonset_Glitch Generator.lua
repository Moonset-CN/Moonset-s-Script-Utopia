-- @description Moonset_Glitch Generator
-- @author Moonset
-- @version 1.0.1
-- @about
--   Throw anything in and just start recording!
-- @links
--  Bilibili: https://space.bilibili.com/424601022
--  NetEase Cloud Music: http://music.163.com/artist?id=28868931



num_items = reaper.CountSelectedMediaItems(0)
if num_items == 0 then
  reaper.ShowMessageBox("No Item Selected", "Error", 0)
  return
end
  
reaper.Undo_BeginBlock()

for i = 0, num_items - 1 do

  item = reaper.GetSelectedMediaItem(0, i)
  take = reaper.GetActiveTake(item)
  if take then

    pitch_shift = 12 - 24 * math.random()
    rate_random = 3 - math.random() * 3 
    modeset = {-1, 589824, 655360, 720896, 393216, 458752, 524288, 851968, 917504, 0, 983040, 131072}
    modeflag = math.random(12)
    
    reaper.SetMediaItemTakeInfo_Value(take, "D_PITCH", pitch_shift)
    reaper.SetMediaItemTakeInfo_Value(take, "D_PLAYRATE", rate_random)
    reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", modeset[modeflag])
    
  end
  
end

reaper.Undo_EndBlock("Glitch Generator", -1)

reaper.UpdateArrange()
