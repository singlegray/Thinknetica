month = { january: 31,
          february: 28,
          marh: 31,
          april: 30,
          may: 31,
          june: 30,
          jule: 31,
          august: 31,
          september: 30,
          october: 31,
          november: 30, 
          december: 31 }
month.each { |key, value| puts key if value == 30 }
