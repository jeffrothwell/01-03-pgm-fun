room_info = { data: { rooms:
    [ { id: 1, room_number: "201", capacity: 50}, { id: 2, room_number: "301", capacity: 200 }, { id: 3, room_number: "1B", capacity: 100}
    ],
    events: [
      { id: 1, room_id: 2, start_time: 18, end_time: 20, attendees: 75 },
      { id: 2, room_id: 1, start_time: 10, end_time: 18, attendees: 25 },
      { id: 3, room_id: 2, start_time: 10, end_time: 18, attendees: 20 },
      { id: 4, room_id: 3, start_time: 18, end_time: 21, attendees: 56 },
    ]
  }
}

rm201_capacity = 0

room_info[:data][:rooms].each do |room|
  if room[:room_number] == "201"
    rm201_capacity = room[:capacity]
  end
end

rm201_id = 0

room_info[:data][:rooms].each do |room|
  if room[:room_number] == "201"
    rm201_id = room[:id]
  end
end

room_info[:data][:events].each do |event|
  if event[:room_id] == rm201_id
    if event[:attendees] <= rm201_capacity
      puts "Room 201 is big enough to host the #{event[:attendees]}-person event with id:#{event[:id]}"
    else
      puts "Room 201 cannot hold #{event[:attendees]} people expected at event with id:#{event[:id]}"
    end
  end
end
