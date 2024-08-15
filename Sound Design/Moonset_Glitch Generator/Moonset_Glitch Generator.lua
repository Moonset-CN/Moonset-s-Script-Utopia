-- @description Moonset_Glitch Generator
-- @author Moonset
-- @version 1.0
-- @about
--   Throw anything in and just start recording!
-- @links
--  Bilibili: https://space.bilibili.com/424601022
--  NetEase Cloud Music: http://music.163.com/artist?id=28868931
-- @provides
--  [nomain]


num_items=reaper.CountSelectedMediaItems(0)
if num_items == 0 then
  reaper.ShowMessageBox("No Item Selected", "Error", 0)
  return
end
  
reaper.Undo_BeginBlock()

for i=0, num_items-1 do

  item = reaper.GetSelectedMediaItem(0, i)
  take = reaper.GetActiveTake(item)
  if take then
    pitch_shift = 12 - 24*math.random()
    rate_random = 3 - math.random()*3 
    modeflag = math.random(12)
    reaper.SetMediaItemTakeInfo_Value(take, "D_PITCH", pitch_shift)
    reaper.SetMediaItemTakeInfo_Value(take, "D_PLAYRATE", rate_random)
    
    if modeflag == 1 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", -1)
    elseif modeflag == 2 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 589824)
    elseif modeflag == 3 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 655360)
    elseif modeflag == 4 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 720896)
    elseif modeflag == 5 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 393216)
    elseif modeflag == 6 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 458752)
    elseif modeflag == 7 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 524288)
    elseif modeflag == 8 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 851968)
    elseif modeflag == 9 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 917504)
    elseif modeflag == 10 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 0)
    elseif modeflag == 11 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 983040)
    elseif modeflag == 12 then
      reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 131072)
    end
    
  end
  
end

reaper.Undo_EndBlock("Glitch Generator", -1)

reaper.UpdateArrange()
