-- This is an example init file , its supposed to be placed in /lua/custom/

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

-- MAPPINGS

-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it
--
local g = vim.g

g.base46_cache = vim.fn.stdpath "config" .. "/nvchad/base46/"
