class Movie {
  String title;
  String image;
  String director;
  String rating;
  String duration;
  String price;
  String genre;
  String releaseDate;
  String ageRestriction;
  String cast;
  String description;

  Movie({
    required this.title,
    required this.image,
    required this.director,
    required this.rating,
    required this.duration,
    required this.price,
    required this.genre,
    required this.releaseDate,
    required this.ageRestriction,
    required this.cast,
    required this.description,
  });
}

final List<Movie> movieItems = [
  Movie(
    title: 'Công Tử Bạc Liêu',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-1.jpg',
    director: 'Direct by Lý Minh Thắng',
    rating: '4.7',
    duration: '1h:46m',
    price: '180',
    genre: 'Hài, gia đình',
    releaseDate: '20/12/2024',
    ageRestriction: '16+',
    cast: 'Song Luân, Thiên Ân, Công Dương',
    description:
        'Đây là tựa phim Việt Nam chiếu rạp đáng mong đợi trong dịp cuối năm 2024. Phim quay về những năm 1930, xoay quanh câu chuyện về Công tử Bạc Liêu với lối sống hưởng thụ và thích ăn chơi.\n\nCậu là người có tư tưởng khá hiện đại, thích làm ngược lại những quy định mà cậu cho là cổ hủ. Phim cho khán giả thấy lại được những giai thoại, sự kiện nổi tiếng gắn liền với Công tử Bạc Liêu.',
  ),
  Movie(
    title: 'Linh Miêu: Quỷ Nhập Tràng',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-2.jpg',
    director: 'Direct by Lưu Thành Luân',
    rating: '4.5',
    duration: '1h:49m',
    price: '200',
    genre: 'Kinh dị',
    releaseDate: '22/11/2024',
    ageRestriction: '18+',
    cast: 'Hồng Đào, Nguyễn Thúc Thùy Tiên, Samuel An',
    description:
        'Linh Miêu là phim chiếu rạp Việt Nam kể về câu chuyện của một gia đình sống tại Huế vào những năm 90. Với chủ đề liên quan đến quỷ nhập tràng, phim sẽ mang đến nội dung với nhiều chi tiết kinh dị.\n\nPhim còn đề cập đến việc phân biệt giới tính, cho người xem thấy được những lề lối xưa và cả những bất hạnh của từng người trong gia đình.',
  ),
  Movie(
    title: 'Ngày Xưa Có Một Chuyện Tình',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-3.jpg',
    director: 'Direct by Trịnh Đình Lê Minh',
    rating: '4.8',
    duration: '2h:03m',
    price: '190',
    genre: 'Lãng mạn',
    releaseDate: '01/11/2024',
    ageRestriction: '16+',
    cast: 'Ngọc Xuân, Nhật Hoàng, Alvin Lu',
    description:
        'Ngày Xưa Có Một Chuyện Tình là phim Việt chiếu rạp kể về câu chuyện tình bạn và tình yêu của 3 bạn trẻ. Vinh thầm thương Miền từ thời thơ ấu nhưng lại không thể thổ lộ.\n\nCòn Miền và Vinh thì lại chẳng thể bên cạnh nhau do một gặp phải biến cố. Câu chuyện của 3 người trẻ từ lúc nhỏ đến khi lớn khiến người xem cực kỳ đồng cảm.',
  ),
  Movie(
    title: 'Cám',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-4.jpg',
    director: 'Direct by Trần Hữu Tấn',
    rating: '4.6',
    duration: '2h:02m',
    price: '170',
    genre: 'Kinh dị',
    releaseDate: '20/09/2024',
    ageRestriction: '18+',
    cast: 'Lâm Thanh My, Rima Thanh Vy, Thúy Diễm, Quốc Cường',
    description:
        'Cám là tựa phim Việt Nam chiếu rạp đề tài kinh dị với cốt truyện dân gian đầy sự ghê rợn. Phim cho khán giả thấy được những hủ tục đáng sợ cùng những bi kịch cứ tiếp diễn trong cuộc đời của nhân vật.\n\nTạo hình nhân vật trong phim cũng cực kỳ ấn tượng, tạo được cảm giác ghê sợ cho người xem.',
  ),
  Movie(
    title: 'Cô Dâu Hào Môn',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-5.jpg',
    director: 'Direct by Vũ Ngọc Đãng',
    rating: '4.7',
    duration: '1h:54m',
    price: '190',
    genre: 'Tâm lý, hài, gia đình',
    releaseDate: '18/10/2024',
    ageRestriction: '18+',
    cast: 'Uyển Ân, Kiều Minh Tuấn, Thu Trang, Lê Giang, Samuel An',
    description:
        'Cô Dâu Hào Môn là phim chiếu rạp Việt Nam lấy chủ đề tâm lý gia đình và pha lẫn vào đó là những chi tiết hài hước.\n\nPhim khai thác nội dung về môn đăng hộ đối trong hôn nhân, tình yêu sẽ không thể gắn kết nếu cả hai gia đình có gia cảnh và tư duy quá khác biệt. Phim cho người xem cảm nhận được nỗi khổ của cả người nghèo lẫn người giàu trong xã hội.',
  ),
  Movie(
    title: 'Hai Muối',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-6.jpg',
    director: 'Direct by NSƯT Vũ Thành Vinh',
    rating: '4.6',
    duration: '2h:03m',
    price: '180',
    genre: 'Gia đình, chính kịch',
    releaseDate: '30/08/2024',
    ageRestriction: '13+',
    cast: 'Quyền Linh, Kim Hải, Hồng Vân, Việt Anh',
    description:
        'Hai Muối cũng là tựa phim Việt Nam chiếu rạp được khá nhiều khán giả yêu thích trong năm 2024 này. Phim kể về câu chuyện của một cô gái mất mẹ từ rất sớm và sống trong vòng tay của cha tại đảo Thiềng Liềng.\n\nNhững chuyển biến hấp dẫn diễn ra khi Muối quyết định rời quê để đến vùng đất mới, tìm việc để phụ ba.',
  ),
  Movie(
    title: 'Lật Mặt 7: Một Điều Ước',
    image:
        'https://cdn-media.sforum.vn/storage/app/media/quynh/phim-viet-nam-chieu-rap-8.jpg',
    director: 'Direct by Lý Hải',
    rating: '4.9',
    duration: '2h:40m',
    price: '200',
    genre: 'Gia đình, tình cảm, hài',
    releaseDate: '26/04/2024',
    ageRestriction: 'Mọi độ tuổi, dưới 13 tuổi phải có người lớn đi cùng',
    cast: 'Thanh Hiền, Đinh Y Nhung, Trương Minh Cường, Quách Ngọc Tuyên',
    description:
        'Lật Mặt 7: Một Điều Ước là tựa phim Việt Nam chiếu rạp với chủ đề tình thân đưa người xem vào những tình huống hài hước lẫn những chi tiết đẫm nước mắt.\n\nKể về gia đình bà Hai cùng 5 người con đã khôn lớn, mỗi người đều có cuộc sống riêng. Đến khi biến cố xuất hiện, khán giả sẽ thấy được trái tim người mẹ dành cho con là vô cùng lớn.',
  ),
];
