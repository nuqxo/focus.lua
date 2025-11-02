-- focus.lua
-- Clean version for Windows terminal
-- Command-line focus timer for productivity and vibes

-- CONFIG
local duration = tonumber(arg[1]) or 25 -- minutes
local start_time = os.time()
local end_time = start_time + (duration * 60)

-- HEADER
print("[FOCUS MODE] Started for " .. duration .. " minutes.")
print("Stay locked in. No distractions.")
print("-----------------------------------")

-- TIMER LOOP
while os.time() < end_time do
    local remaining = end_time - os.time()
    local minutes = math.floor(remaining / 60)
    local seconds = remaining % 60
    io.write(string.format("\rTime left: %02d:%02d", minutes, seconds))
    io.flush()
    os.execute("ping -n 2 127.0.0.1 > nul") -- wait ~1 second (Windows-safe)
end

-- END MESSAGE
print("\n-----------------------------------")
print("[DONE] Focus session completed.")
print("Take a short break, you earned it.")
