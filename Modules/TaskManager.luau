local Task = require("@lune/task")
local TaskManager = {}

function TaskManager:Create(Func)
    local taskObj
    local Status

    local Object = {
        Yield = function(...)
            if Status and taskObj then
                local Ok, Err = pcall(Task.cancel, taskObj)
                return Ok, Err
            end
            return false, "Task not started or failed"
        end
    }

    return {
        Start = function()
            Status, _ = pcall(function()
              taskObj = Task.spawn(Func)
            end)
            return Object
        end
    }
end

return TaskManager