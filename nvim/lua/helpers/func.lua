local M = {}

-- Limits the number of parameters to zero.
function M.thunk(fn)
    return function()
        return fn()
    end
end

-- Partial application for one parameter (for now).
function M.partial(fn, arg)
    return function(...)
        return fn(arg, ...)
    end
end

return M
