use_bpm 100

live_loop :time do
  sleep 1
end

live_loop :amen_break, sync: :time do
  # use_bpm 30
  sample :b
  sleep 2
end

live_loop :intro, sync: :time do
  # tick
  puts 'xxxxxxxxxxxxxxx' + look
  # stop
  sample :ambi_choir, beat_stretch: 2
  # sleep 2
end

live_loop :loopy, sync: :time do
  # tick
  # stop
  tick
  play :e2, amp: 0.3, attack: 0.3, sustain: 1
end
