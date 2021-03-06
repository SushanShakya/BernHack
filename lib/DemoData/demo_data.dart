class Location{
  final String name;
  final String description;
  final String imageName;
  final List<String> images;
  final String location;

  Location({
      this.name,
      this.description,
      this.imageName,
      this.location,
      this.images
  });
}

class DemoData{
  List <Location> picnicSpots = [
    Location(
      name: "Balaju Water Garden",
      description: "Situated five kilometers north-west of Kathmandu,"
          " Balaju Water Garden is an ideal place for rest and relaxation. "
          "The park features a long line of twenty-two stone water spouts from the"
          " mid-eighteenth century, each of which is ornately carved with crocodile"
          " heads. The garden also includes many other ponds, some of them containing "
          "large and small varieties of fish. Adjoining the garden is an Olympic-size "
          "swimming pool open to the public. Balaju Industrial Estate is located nearby.",
      imageName: "BalajuWaterGarden",
      location: "Balaju",
      images: ["BalajuWaterGarden"]
    ),
    Location(
        name: "Kakani",
        description: "Kakani is in the Nuwakot District. It is 20 km along the road from"
            " Kathmandu to Trisuli Baazar, the turn-off to the village is just before the "
            "police checkpoint where there is a cluster of shops. The road to the "
            "accommodation options in the village passes though a UN AFP training camp."
            "Most of the towns around Kathmandu sit at the bottom of the valley – you have"
            " to travel to the valley rim to really get decent views of the Himalaya. "
            "Set atop a ridge at 2073m, just off the road to Trisuli Bazaar, Kakani"
            " is the quieter, slower cousin of Dhulikhel and Nagarkot. From a series "
            "of high points along the ridge, there are magnificent views of the Himalayan"
            " skyline stretching all the way from Annapurna to Everest, via Manaslu, "
            "Ganesh Himal, Gauri Shankar, Dorje Lekpa and Shishapangma.Kakani is a major"
            " gateway for Picnic, hiking and mountain biking routes in neighbouring "
            "Shivapuri National Park.",
        imageName: "Kakani",
        location: "Nepal",
        images: ["BalajuWaterGarden"]
    ),
    Location(
      name: "Manjushree Park",
      description: "Located in the Chobhar gorge of the Kirtipur Municipality, Manjushree"
          " Park should be on your list of places to visit with family in Kirtipur, Nepal."
          " Located near the Manjushree cave, this park is ideal for sightseeing and "
          "photography. Located on a small hill, this park offers visitors with panoramic"
          " views of the beautiful surroundings. The park is believed to be named after "
          "Manjushree, who was a Chinese saint. Do not give this park when you are in "
          "Nepal!",
      imageName: "ManjushreePark",
      location: "Chobhar",
        images: ["ManjushreePark"]
    ),
    Location(
      name: "Sikali",
      description: "Sikali Temple – Khokana, is one of the most beautiful temple built "
          "around 336 Nepal Sambat. The temple with open, clean and green meadow, "
          "surrounding hills and paddy fields gives the feel of Switzerland.“Locals"
          " believe that if we don’t sacrifice the animals on different occasions, "
          "misfortunes and tragedies will occur”Sikali Temple lies in the southern "
          "part of Kathmandu Valley at an approximate distance of 10 KM. The temple is"
          " located in an isolated place, outside of the main settlements, but the "
          "surrounding is heavenly.",
      imageName: "sikali",
      location: "Bhaisepati",
        images: ["sikali"]
    ),
    Location(
      name: "Shankha Park",
      description: "Sankha Park is a park near Chappal Karkhana,The residents visit the"
          " park for picnicking, meeting and morning walk.The park is managed by "
          "Kathmandu Metropolitan City. This park is situated beside a busy ring road"
          " and offers solace to the many passers-by from the pollution and heat of the"
          " city.",
      imageName: "ShankhPark",
      location: "Kathmandu",
        images: ["ShankhPark"]
    ),
  ];

  List<Location> resorts = [
    Location(
      name: 'Sukute Beach',
      description: 'Wanna Chill Out ?? Sukute beach might just be the spot for you.\n Bring your spouse and chillax here.',
      location: 'Chaksibari Marg',
      imageName: 'sukuteBeach',
        images: ['sukuteBeach','sukuteBeach1']
    ),
    Location(
      name: 'Nepal Cottage',
      description: 'Are you looking for a peaceful area to take a break from your boring life? '
          'Try this resort and chillax',
      location: 'Paknajol Marg',
      imageName: 'NpCottage3',
        images: ['NpCottage1','NpCottage2','NpCottage3','NpCottage4','NpCottage5',]
    ),
    Location(
      name: 'Mountain Resort',
      description: "Are you hot all the time? Then fear not...... This mountain resort is cold ..... "
          "Like really really cold.. It\'s Chilling",
      location: 'Nagarkot',
      imageName: 'MtResort',
        images: ['MtResort','MtResort1','MtResort2','MtResort3','MtResort4','MtResort5']
    ),
  ];

  List<Location> getPicnicSpots() => picnicSpots;
  List<Location> getResorts() => resorts;
}