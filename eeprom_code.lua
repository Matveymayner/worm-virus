local invoke = component.invoke
local component = require("component")
local gpu = component.gpu

local width, height = gpu.getResolution()
local worms = {}

-- Функция для создания червя на случайной позиции
local function createWorm()
  local x = math.random(1, width)
  local y = math.random(1, height)
  local worm = {x = x, y = y}
  table.insert(worms, worm)
end

-- Функция для обновления позиции червей и их отображения
local function updateWorms()
  gpu.fill(1, 1, width, height, " ") -- Очищаем экран
  for _, worm in ipairs(worms) do
    gpu.set(worm.x, worm.y, "@") -- Отображаем червя
    worm.x = worm.x + math.random(-1, 1) -- Случайное перемещение по оси X
    worm.y = worm.y + math.random(-1, 1) -- Случайное перемещение по оси Y
    -- Ограничиваем позицию червя в пределах экрана
    worm.x = math.max(1, math.min(worm.x, width))
    worm.y = math.max(1, math.min(worm.y, height))
  end
end

-- Основной цикл программы
while true do
  createWorm() -- Создаем новых червей
  updateWorms() -- Обновляем позиции червей
  Sleep(1) -- Приостанавливаем выполнение на некоторое время
end
