class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: '\nFIFO',
      iconImage: 'lib/assets/earth.gif',
      description:
          "As the name suggests, this algorithm works on the principle of First in First out.It replaces the oldest page that has been present in the main memory for the longest time. It is implemented by keeping track of all the pages in a queue",
      images: [
        'https://cdn.pixabay.com/photo/2013/07/18/10/57/mercury-163610_1280.jpg',
        'https://cdn.pixabay.com/photo/2014/07/01/11/38/planet-381127_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/06/26/18/48/mercury-822825_1280.png',
        'https://image.shutterstock.com/image-illustration/mercury-high-resolution-images-presents-600w-367615301.jpg'
      ]),
  PlanetInfo(2,
      name: '\nLIFO',
      iconImage: 'lib/assets/earth.gif',
      description:
          "As the name suggests, this algorithm works on the principle of Last in First out. It replaces the newest page that arrived at last in the main memory. It is implemented by keeping track of all the pages in a stack.",
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/39/venus-11022_1280.jpg',
        'https://image.shutterstock.com/image-photo/solar-system-venus-second-planet-600w-515581927.jpg'
      ]),
  PlanetInfo(3,
      name: '\nLRU',
      iconImage: 'lib/assets/earth.gif',
      description:
          "As the name suggests, this algorithm works on the principle of Least Recently Used. It replaces the page that has not been referred by the CPU for the longest time.",
      images: [
        'https://cdn.pixabay.com/photo/2011/12/13/14/31/earth-11015_1280.jpg',
        'https://cdn.pixabay.com/photo/2011/12/14/12/11/astronaut-11080_1280.jpg',
        'https://cdn.pixabay.com/photo/2016/01/19/17/29/earth-1149733_1280.jpg',
        'https://image.shutterstock.com/image-photo/3d-render-planet-earth-viewed-600w-1069251782.jpg'
      ]),
  PlanetInfo(4,
      name: '\nOPTIMAL',
      iconImage: 'lib/assets/earth.gif',
      description:
          "This algorithm replaces the page that will not be referred by the CPU in future for the longest time. It is practically impossible to implement this algorithm. This is because the pages that will not be used in future for the longest time can not be predicted. However, it is the best known algorithm and gives the least number of page faults. Hence, it is used as a performance measure criterion for other algorithms. ",
      images: []),
  PlanetInfo(5,
      name: '\nRANDOM',
      iconImage: 'lib/assets/earth.gif',
      description:
          "As the name suggests, this algorithm randomly replaces any page. So, this algorithm may behave like any other algorithm like FIFO, LIFO, LRU, Optimal etc.",
      images: []),
  PlanetInfo(6,
      name: 'AUTO SELECT',
      iconImage: 'lib/assets/earth.gif',
      description:
          "This Function Automatically Chooses a page replacement algorithm which gives best output for given set of inputs",
      images: []),
];
