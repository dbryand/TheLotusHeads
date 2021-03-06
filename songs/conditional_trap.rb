dir = "/Users/dbryand/Music/Samples/808_drum_kit_soundpacks.com/"
hats = dir + "hihats/"
kicks = dir + "kicks/"
snares = dir + "snares/"

define :h do |x|
  density x do
    sample hats, 7, amp: 4
    sleep 1
  end
end

n = 0 #change variable to 0 to switch to second part of code and back to 1 for first part

live_loop :code do
  with_fx :reverb, room: 1 do
    use_synth :pluck
    use_random_seed 975
    16.times do
      if n == 0
        play scale(:c2, :iwato, num_octaves: 4).choose, release: 2,amp: 2, pan: rrand(-0.7, 0.8)
      else
        play scale(:c4, :iwato, num_octaves: 4).choose, release: 2, amp: 2
      end
      sleep 0.25
    end
  end
end

live_loop :bass, sync: :code do
  # stop
  use_synth :subpulse
  if n == 1
    play ring(:c1, :c1, :c2).tick, release: (ring, 3, 3, 0.5).look, amp: (ring, 3, 3, 5).look
    sleep (ring, 4, 3.5, 0.5).look
  else
    play ring(36, 37, 41, 42, 36, 37, 41, 37).tick, amp: 2, release: rrand(0.4, 0.7), cutoff: 90
    sleep 0.5
  end
end

live_loop :kick, sync: :code do
  # stop
  if n == 1
    sample kicks, 12, amp: 9
  end
  sample kicks, 12, amp: 9, rate: (line, 3, 1, steps: 8).tick
  sleep ring(2, 0.25, 1.75, 2, 0.125, 0.25, 0.125, 1.5).look
end

t = 1.0
live_loop :snair, sync: :code do
  stop
  use_synth :cnoise
  with_fx :echo, mix: ring(0, 0, 0, 0.7).tick, decay: 3, phase: t/3 do
    sleep 1
    play 60, release: 0.4, amp: 3
    sleep 1
  end
end

# Uses density to do hats and rolls
live_loop :hat, sync: :code do
  stop
  h ring(4, 4, 4, 6, 4, 3, 32, 4, 16, 4, 8, 4, 3, 6, 12, 4).tick
end
