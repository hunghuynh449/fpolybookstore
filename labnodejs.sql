-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 27, 2022 lúc 02:07 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `labnodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `id` int(11) NOT NULL,
  `tenLoai` varchar(200) NOT NULL,
  `thuTu` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`id`, `tenLoai`, `thuTu`, `anHien`) VALUES
(1, 'Lịch sử', 1, 1),
(2, 'Văn học', 2, 0),
(3, 'Nghệ thuật sống', 3, 1),
(4, 'Đời sống', 4, 1),
(5, 'Thiếu nhi', 5, 1),
(12, 'abc', 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `id` int(11) NOT NULL,
  `tenSach` varchar(200) NOT NULL,
  `moTa` varchar(5000) NOT NULL,
  `urlHinh` varchar(200) NOT NULL,
  `capNhat` timestamp NOT NULL DEFAULT current_timestamp(),
  `gia` double NOT NULL,
  `idLoai` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL,
  `luotMua` int(11) NOT NULL DEFAULT 0,
  `luotXem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`id`, `tenSach`, `moTa`, `urlHinh`, `capNhat`, `gia`, `idLoai`, `anHien`, `luotMua`, `luotXem`) VALUES
(1, 'Sống Chậm Đợi Nắng Lên', 'Lúc con trai còn nhỏ, tôi thường có những trò chơi đố vui dành cho con. Các câu đố thường lấy chủ đề về thiên nhiên, cây cối và loài vật gần gũi trong đời sống hàng ngày. Tôi luôn mong muốn con được trải lòng với vạn vật xung quanh một cách dịu lành và ngọt ngào.\r\n\r\nNhớ có lần tôi hỏi con: Đố con, đây là con gì? Lúc thò cổ / Lúc rụt đầu/  Hễ đi đâu đó / Mang nhà đi theo. Con đã ngẩn tò te suốt cả buổi rồi tự hỏi: Sao lại có con vật mang nhà đi theo bố nhỉ.\r\n\r\nĐến khi con không thể giải đố được, tôi mới đưa ra đáp án, con vật “lạ lùng” đó chính là ốc sên.\r\n\r\nCon trai phì cười, ôm cổ bố thỏ thẻ: Con biết rồi. Con ốc sên là con vật cẩn thận nhất. Nó lo bị lạc nhà, bị về muộn nên mang nhà đi theo luôn.\r\n\r\nTôi luôn mang theo trong lòng câu nói ngây thơ của con trai tự ngày ấy. Cái ý nghĩ mang nhà bên mình để khỏi quên, khỏi lạc thực sự quá ấn tượng. Bởi thông thường chúng ta chỉ nghĩ ốc sên là loài vật chậm chạp, nên những ai chậm, rù rờ thường bị ví là “chậm như sên”.\r\n\r\nNghĩ thế là oan cho ốc sên vì thực ra chúng đi được rất xa. Từ chỗ là loài bản địa của vùng Đông Phi,  ốc sên đã có mặt và sinh sôi ở hầu hết các lục địa và hải đảo trên thế giới.\r\n\r\nNăm tháng qua đi, con trai bé bỏng ngày nào giờ đã trở thành chàng sinh viên đại học và chắc con chẳng còn băn khoăn vì sao ốc sên lại mang theo nhà bên mình. Sách vở chắc đã giúp con hiểu ốc sên là loài thân mềm sống trên cạn. Nếu chúng không mang theo nhà bên mình thì trên đường di chuyển sẽ bị chết khô bởi sự thay đổi của môi trường.\r\n\r\nMọi điều đều có thể nhìn nhận dưới lăng kính của khoa học. Mạng thông tin toàn cầu giúp ta dễ dàng hiểu được nhiều điều chỉ bằng một cú nhấp chuột.\r\n\r\nẤy thế nhưng, tôi vẫn cứ mơ màng nghĩ về cái câu hỏi ngây thơ của con năm nào: Vì sao chúng ta cần phải mang theo nhà bên mình?\r\n\r\nVì khi ấy nhà không chỉ là nơi trú chân mà còn là nơi che chắn nỗi cô độc của mỗi người trên đường lữ hành qua ngày mưa tháng nắng.\r\n\r\nTôi đã từng có thời tuổi trẻ tang bồng hồ thỉ, lên Đông xuống Đoài, đi Nam về Bắc, đi ngược về xuôi. Tôi đã từng có thời tuổi trẻ với những xê dịch qua nhiều khung giờ ở những quốc gia khác nhau trên thế giới. Nhưng sau tất cả, tôi vẫn muốn như chú ốc sên kia, sống chậm rãi và luôn có NHÀ ở trong tim. Có NHÀ để biết “Sống chậm theo từng nhịp” và “Đợi nắng đến xôn xao” như tiêu đề hai phần trong cuốn tản văn “Sống chậm đợi nắng” lên của tôi.\r\n', 'images/song-cham-doi-nang-len.png', '2022-01-12 02:17:53', 89000, 3, 1, 14, 43),
(2, 'Sống Xanh Như Những Lá Trà', 'Trong cuốn sách thú vị này, bạn sẽ được khám phá kho tàng ý tưởng về sự đơn giản, tiết kiệm, các phương pháp tự chế và cả trí tuệ của người Nhật. Chính Kayaki đã áp dụng điều mà cô gọi là ‘Green tea living’ - gồm ăn thực phẩm ít calo, tập thể dục và thiền định... vào cuộc sống. Cô cũng đưa ra lời khuyên về việc thường xuyên ăn súp miso, sử dụng phương pháp bấm huyệt, thử dùng dầu ô-liu cho da khô, massage da mặt bằng thìa và các gợi ý để sống cuộc sống thanh đạm.\r\n\r\nTrà xanh không chỉ có lợi cho tim mạch, nó còn có thể được dùng như một loại mỹ phẩm chống lão hóa, như biện pháp ngừa sâu răng và loại bỏ mùi hôi miệng, như công cụ làm sạch, làm phân bón cho cây, và còn là chiến thuật giảm cân (bằng cách uống một cốc trà trước bữa tối). Sống Xanh Như Những Lá Trà của Kayaki quả thật vô cùng hữu ích và sáng tạo cho một cuộc sống thân thiện với môi trường.\r\n', 'images/song-xanh-nhu-nhung-la-tra.png', '2022-01-12 02:17:53', 109000, 3, 1, 6, 143),
(3, 'Sống Như Lần Đầu, Yêu Như Lần Cuối', 'Cuốn sách là những câu chuyện đời sống hằng ngày, như chuyện của những tấm bưu thiếp, những lá thư tay, những hạnh phúc giản dị mà chúng ta dễ dàng bỏ lỡ, đặc điểm con người, đời sống ở những vùng miền mà tác giả đã đi qua, hay những cảm xúc đang chi phối mỗi người. Từ những trải nghiệm cá nhân, tác giả muốn chia sẻ lại những cảm xúc của mình về cách nhìn nhận từ những điều nhỏ nhất, đến những quan điểm về cuộc sống nhân sinh. Qua những trang viết đầy chân thành của một người trẻ, Denley Lupin chuyển tải đến người đọc những thông điệp giá trị để yêu cuộc sống hơn!\r\n\r\n- “Cuộc sống là muôn hình vạn trạng, có đẹp có xấu, có hay có dở. Chúng ta sẽ lần lượt được thưởng thức các hương vị ấy trong đời mình. Nếu cuộc sống là một bàn tiệc, thì sẽ có đủ vị cay, đắng, ngọt, bùi, chua và cả những vị kỳ lạ bạn chẳng thể gọi tên. Mỗi người chúng ta gặp, mỗi chuyện chúng ta làm cũng như một màu sắc sẽ góp phần vào bức tranh ghép đang dần được hoàn thiện. Nếu như bạn thử nhìn mọi thứ một cách chậm rãi, trầm tư hơn, bạn sẽ cảm nhận được những điều mà trước kia bạn chưa bao giờ nghĩ tới. Bạn sẽ biết thưởng thức cuộc sống ngay cả từ những điều bạn đã vô tình bỏ qua, từng không mang nhiều ý nghĩa với bạn. Rồi bạn cũng sẽ nhận ra mỗi người có một lý do riêng để sống, theo ý định của bản thân họ. Không một ai giống bạn và bạn cũng sẽ không giống một ai khác”.\r\n\r\n- “Nếu được ít nhất một năm một lần, hãy đi đến một nơi mà bạn chưa từng đến trước đây. Sống với cảm giác của một lãng khách, một người lạ, không ai biết đến, rồi rời đi với thêm một dấu ấn. Nếu được hãy đến một nơi mà bạn có thể ngắm bầu trời đêm đầy sao, vì phố phường tấp nập, ánh sáng nhân tạo đã che khuất hết vẻ đẹp của bầu trời đêm đúng nghĩa, lúc đó chỉ có bạn đối diện với khoảng đêm bao la, ắt bạn sẽ nhận ra được nhiều điều ý nghĩa về cuộc sống”.\r\n\r\n- “Cho dù một ngày bạn có già đi bao nhiêu, thì đứa trẻ tâm hồn vẫn luôn tồn tại. Hãy cứ gìn giữ, nuôi dưỡng nó. Để đứa trẻ ấy luôn làm bạn, giữ bạn ổn định giữa những chông chênh cuộc đời. Đứa trẻ ấy là chính bạn, phản ánh con người thật của bạn. Đừng vì lý do gì mà chối bỏ nó. Cho dù bề ngoài hay lối sống có khác đi thì hãy hiểu rằng giữ vững đứa trẻ tâm hồn ấy, bạn sẽ luôn được là chính mình”.\r\n', 'images/song-nhu-lan-dau-tien-yeu-thuong-nhu-lan-cuoi.jpg', '2022-01-12 02:17:53', 99000, 3, 1, 0, 74),
(4, 'Những Ngày Đầy Nắng', '“Bạn thân mến! Tôi chưa bao giờ nghĩ mình sẽ viết sách. Tôi cũng chưa bao giờ tin, mình có thể làm bánh. Tôi chưa bao giờ biết được rằng, ước mơ lại có giá trị lớn lao đến như vậy, cho đến khi tôi thật sự chạm tay vào… Nếu như hôm đó, trong rất nhiều những thất bại của bản thân, những ngã rẽ, những con đường, rất nhiều những hoạch định tương lai nhưng không có lối đi, hay nơi nào mà mình thật sự thuộc về, nếu tôi bỏ cuộc, chắc chắn, sẽ không có Những ngày đầy nắng, cũng không có tôi của ngày hôm nay. Tôi hiểu cảm giác của sự thất bại, chán chường, nhưng tôi thấm thía hơn rất nhiều về sự kiên nhẫn để đạt được ước mơ, rằng ai cũng có thể làm được điều mình muốn, nếu bạn thật sự muốn, và kiên định với điều đó.\r\n\r\nNhững ngày đầy nắng ra đời, là kết quả của rất nhiều năm tôi tin tưởng và kiên định với con đường mình chọn. Trong quyển sách này, tôi ghi lại công thức, kinh nghiệm và mong muốn được chia sẻ với bạn về tất cả những gì đã trải qua trong căn bếp ấy, với vai trò của một người mẹ, người vợ, chứ không phải là một chuyên gia. Tôi mong bạn, những cô gái, những chàng trai đã trót yêu bếp bánh, yêu cái vị ngọt lành của bơ, đường, trứng, yêu cảm giác bàn tay lấm lem bột, yêu luôn những buổi chiều mưa rả rích và được ôm mình trong căn bếp nhỏ… Tôi mong bạn hãy tin, tin vào chính bạn, rằng bạn hoàn toàn có thể làm được rất nhiều điều kỳ diệu.\r\n\r\nNhững ngày đầy nắng là những ngày dù bên ngoài có như thế nào, dù là giông bão, hay là những bộn bề lo toan đến mệt nhoài, hay những vất vả đời thường của cơm, áo, gạo, tiền đè nặng lên vai… thì chỉ cần bước vào căn bếp nhỏ, được hít hà vị bánh thơm lừng từ chiếc lò cũ kỹ, được thấy đứa con bé bỏng í ới gọi mẹ cho ăn bánh, được sống là mình và rõ ràng đó là chính mình, một cách nguyên bản và không hề mảy may nghi ngờ về bản thân, với tôi, đó thật sự là những ngày đầy nắng…\r\n\r\nTôi chúc bạn, dù ngoài trời có như thế nào thì trong căn nhà nhỏ mà ấm áp, nơi góc bếp xinh đó, bạn sẽ tìm được những yêu thương ngọt ngào cho chính mình…” – chia sẻ của tác giả Hoàng Yến tới bạn đọc.\r\n', 'images/nhung-ngay-day-nang.png', '2022-01-12 02:17:53', 129000, 3, 1, 1, 5),
(5, 'Sức Mạnh Của Sự Tử Tế', 'Bạn có nhớ nụ cười của một người lạ khi bạn giữ cửa cho họ bước qua hay lời cảm ơn chân thành từ một người bạn khi được bạn giúp đỡ không? Có phải bạn cảm thấy hạnh phúc đến lạ khi làm được điều gì đó cho người khác, dù việc bạn làm vô cùng nhỏ bé? Nụ cười của họ có thể làm bạn vui cả ngày, và lời cảm ơn chân thành từ người nhận giúp bạn cảm thấy cuộc sống mình có ý nghĩa hơn. \r\n\r\nĐó chính là sức mạnh từ sự tử tế - những việc làm nhỏ bé nhưng mang đến niềm hạnh phúc to lớn. Chúng ta đang sống trong thời đại mà phần lớn tin tức trên báo đài, ti-vi là tiêu cực, khiến ta băn khoăn tự hỏi có phải đạo đức con người đang ngày càng đi xuống. Nhưng dù thế nào đi nữa, hãy luôn tin rằng ở đâu đó vẫn còn những con người tử tế, sống và làm điều tử tế mỗi ngày. \r\n\r\nSức Mạnh Từ Sự Tử Tế tập hợp những câu chuyện sâu sắc và ý nghĩa về sự tử tế mỗi ngày. Một hành động tử tế nhỏ bé có thể tạo ra sự khác biệt lớn lao cho một ngày, thậm chí là cả cuộc đời, của ai đó. Qua những câu chuyện trong quyển sách nhỏ này, bạn sẽ gặp gỡ những con người bình dị, làm những việc tử tế xuất phát từ trái tim chứ không mong đợi được đền đáp, để rồi sau đó cả cuộc đời của họ lẫn người được họ giúp đỡ đều thay đổi theo hướng tốt đẹp hơn.\r\n\r\nChúng tôi tin rằng quyển sách sẽ là dòng nước mát cuốn trôi những hoài nghi trong bạn vốn cho rằng thế giới này chỉ đầy rẫy những điều xấu xa. Mong rằng sau khi đọc xong quyển sách này, bạn sẽ nở một nụ cười và có thêm động lực làm điều gì đó tử tế cho người khác, dù đó chỉ là một việc nhỏ bé. Như thế cũng đã là niềm vui và vinh dự lớn lao cho những người thực hiện quyển sách này.\r\n', 'images/suc-manh-cua-su-tu-te.png', '2022-01-12 02:17:53', 68000, 3, 1, 153, 585),
(6, 'Để Có Một Tương Lai', 'Trong xã hội có rất nhiều mối nguy. Nếu chúng ta đặt một người trẻ vào xã hội mà không tìm cách bảo vệ họ, họ sẽ tiếp nhận những bạo động, căm thù, sợ hãi và bất an mỗi ngày, rốt cuộc họ sẽ bị bệnh. Những câu chuyện của chúng ta, những chương trình tivi, quảng cáo, sách báo đều tưới tẩm các hạt giống khổ đau nơi những người trẻ và cả những người lớn. Chúng ta cần một vài nguyên tắc, vài phương thuốc cho căn bệnh của mình, những gì lành, đẹp và thật để có thể nương tựa vào.\r\n\r\n2.500 năm trước, Bụt đã đưa ra các nguyên tắc cho những người đệ tử tại gia của Ngài để giúp họ sống một đời sống bình an, lành mạnh và hạnh phúc. Đó là Năm Giới và nền tảng của mỗi Giới này là chánh niệm. Với chánh niệm, chúng ta ý thức được những gì đang xảy ra nơi thân thể, cảm thọ, tâm hồn và thế giới quanh ta, cũng như ta tránh không gây tổn hại cho mình và cho người.\r\n\r\nHọc hỏi và thực tập theo Năm Giới và nương tựa Tam Bảo chắc chắn sẽ mang lại an lạc cho bản thân, cho cộng đồng và cho xã hội. Là con người, chúng ta cần có một cái gì để tin tưởng, một cái gì lành, đẹp và thật, một cái gì mà ta có thể tiếp xúc. Trong quyển sách này, Năm Giới được diễn bày theo hình thức mới, đó là Bảo vệ sự sống, Hạnh phúc chân thực, Tình thương đích thực, Ái ngữ và Lắng nghe, Nuôi dưỡng và trị liệu.\r\n\r\nNăm Giới chính là tình thương. Thương có nghĩa là hiểu, bảo vệ và mang lại an vui cho đối tượng thương yêu của chúng ta. Giới không phải là luật lệ mà là những nguyên tắc hướng dẫn giúp ta tập sống như thế nào để có thể bảo hộ cho mình và cho những người xung quanh.\r\n\r\nKhi có người hỏi: “Bạn có quan tâm đến bản thân không?”, “Bạn có quan tâm đến người bạn đời không”, “Bạn có quan tâm đến Trái đất không?”… cách hay nhất để trả lời là hành trì Năm Giới. Đây là cách dạy bằng thân giáo chứ không phải chỉ bằng lời. Nếu bạn thật sự quan tâm, xin hãy hành trì các Giới này để bảo hộ cho mình và cho mọi người, mọi loài khác nữa. Nếu chúng ta thực tập hết lòng thì tương lai sẽ còn có mặt cho chúng ta và con cháu chúng \r\n', 'images/de-co-mot-tuong-lai.png', '2022-01-12 02:17:53', 155000, 3, 1, 86, 152),
(7, 'Cân Bằng Cảm Xúc, Cả Lúc Bão Giông', 'Một ngày, chúng ta có khoảng 16 tiếng tiếp xúc với con người, công việc, các nguồn thông tin từ mạng xã hội, loa đài báo giấy… Việc này mang đến cho bạn vô vàn cảm xúc, cả tiêu cực lẫn tích cực. \r\nBạn có thể thấy vui khi nhìn một em bé đến trường nhưng 5 phút sau đã nổi cơn tam bành khi bị đứa trẻ con đi xe đạp đâm sầm vào lại còn ăn vạ. \r\nHoặc bạn rất dễ phát điên nếu như chỉ còn 5 giây nữa đèn giao thông chuyển từ đỏ sang xanh mà kẻ đi đằng sau bấm còi inh ỏi.\r\nHay là, bạn thấy buồn chỉ vì hôm nay trời mưa man mác, mà vẫn phải ngồi trong văn phòng làm việc, bạn bi quan rằng tuổi trẻ thật buồn tẻ. \r\nHãy thừa nhận đi! Ai trong số chúng ta cũng sẽ trải qua những điều này. Và cuốn sách này dạy bạn cách làm hòa với chính những tiêu cực bên trong mình…\r\nĐa số những cảm xúc tiêu cực chỉ thỏa mãn được chúng ta ở thời điểm hiện tại. Tức là chúng ta có thể sẽ nhận được sự thoải mái khi la hét, cáu giận, chửi thề một ai đó nhưng những âm thanh ta phát ra, suy nghĩ ta truyền đi sẽ đóng vai một con dao sắc lẹm đâm ngược lại vào chính thân thể mình. Các mối quan hệ, cuộc sống, công việc của chúng ta sẽ dần rơi vào sự mệt mỏi, bế tắc.\r\nHọc được cách cân bằng cảm xúc cũng chính là học được cách làm chủ cuộc đời mình thông minh, sáng suốt và đúng hướng. \r\n“Cân bằng cảm xúc, cả lúc bão giông” khác biệt hoàn toàn so với những cuốn sách về cảm xúc thông thường khác khi:\r\nChỉ cho người đọc những lý do khiến chúng ta luôn tiêu cực và bản chất của những điều này là gì?\r\nNhững điều khiến chúng ta thường xuyên nóng giận và không hạnh phúc bắt nguồn từ đâu? \r\nĐưa ra những bài tập cụ thể để cân bằng cảm xúc mỗi ngày như: Ngừng suy nghĩ trong một khoảng thời gian cố định, tưởng tượng một quá trình, tập sống với bản thân mỗi ngày… \r\nCân bằng phương trình của cuộc đời không dễ, cuốn sách này không chỉ là lý thuyết còn cho bạn những kĩ năng, phướng pháp tận tình nhất để giúp bạn làm chủ cảm xúc của mình. \r\n', 'images/can-bang-cam-xuc-ca-luc-bao-giong.jpg', '2022-01-12 02:17:53', 96000, 3, 1, 13, 26),
(8, 'Hiểu Về Trái Tim', 'Xuất bản lần đầu tiên vào năm 2011, Hiểu Về Trái Tim trình làng cùng lúc với kỷ lục: cuốn sách có số lượng in lần đầu lớn nhất: 100.000 bản. Trung tâm sách kỷ lục Việt Nam công nhận kỳ tích ấy nhưng đến nay, con số phát hành của Hiểu Về Trái Tim vẫn chưa có dấu hiệu chậm lại.\r\n\r\nLà tác phẩm đầu tay của nhà sư Minh Niệm, người sáng lập dòng thiền hiểu biết (Understanding Meditation), kết hợp giữa tư tưởng Phật giáo Đại thừa và Thiền nguyên thủy Vipassana, nhưng Hiểu Về Trái Tim không phải tác phẩm thuyết giáo về Phật pháp.\r\n\r\nCuốn sách rất “đời” với những ưu tư của một người tu nhìn về cõi thế. Ở đó, có hạnh phúc, có đau khổ, có tình yêu, có cô đơn, có tuyệt vọng, có lười biếng, có yếu đuối, có buông xả… Nhưng, tất cả những hỉ nộ ái ố ấy đều được khoác lên tấm áo mới, một tấm áo tinh khiết và xuyên suốt, khiến người đọc khi nhìn vào, đều thấy mọi sự như nhẹ nhàng hơn…\r\n\r\nSinh tại Châu Thành, Tiền Giang, xuất gia tại Phật Học Viện Huệ Nghiêm – Sài Gòn, Minh Niệm từng thọ giáo thiền sư Thích Nhất Hạnh tại Pháp và thiền sư Tejaniya tại Mỹ. Kết quả sau quá trình tu tập, lĩnh hội kiến thức… Ông quyết định chọn con đường hướng dẫn thiền và khai triển tâm lý trị liệu cho giới trẻ làm Phật sự của mình. Tiếp cận với nhiều người trẻ, lắng nghe thế giới quan của họ và quan sát những đổi thay trong đời sống hiện đại, ông phát hiện có rất nhiều vấn đề của cuộc sống.\r\n\r\nNhưng, tất cả, chỉ xuất phát từ một nguyên nhân: Chúng ta chưa hiểu, và chưa hiểu đúng về trái tim mình là chưa cơ chế vận động của những hỉ, nộ, ái, ố trong mỗi con người. “Tôi đã từng quyết lòng ra đi tìm hạnh phúc chân thật. Dù thời điểm ấy, ý niệm về hạnh phúc chân thật trong tôi rất mơ hồ nhưng tôi vẫn tin rằng nó có thật và luôn hiện hữu trong thực tại. Hơn mười năm sau, tôi mới thấy con đường. Và cũng chừng ấy năm nữa, tôi mới tự tin đặt bút viết về những điều mình đã khám phá và trải nghiệm…”, tác giả chia sẻ.\r\n\r\nGần 500 trang sách, Hiểu Về Trái Tim là những phác thảo rõ nét về bức tranh đời sống cảm xúc của tất cả mọi người. Người đọc sẽ tìm thấy căn nguyên thành hình của những xúc cảm, thấy cả việc chúng chi phối thế nào đến hành xử thường ngày và quan trọng hơn cả là cách thức để điều khiển chúng thế nào. Không có câu trả lời cuối cùng của việc đúng – sai trong từng tình huống nhưng Hiểu Về Trái Tim có chứa trong nó chìa khóa để mở ra một cánh cửa đến với thế giới mới, thế giới an lạc từ trong tâm mỗi người. Bởi, suy cho cùng, mỗi trái tim - cơ quan chúng ta thường gắn cho nhiệm vụ điều khiển trí tuệ cảm xúc của con người, đều có những nỗi niềm riêng. Chỉ cần hiểu câu chuyện của trái tim, tự khắc, mỗi người sẽ quyết định được câu chuyện của chính mình.\r\n\r\nBí quyết của sự chuyển hóa là không nên dùng ý chí để áp đặt hay nhồi nặn tâm mình trở thành một kiểu mẫu tốt đẹp nào đó. Chỉ cẩn quan sát và thấu hiểu chúng là đủ. Tác giả nhận định: “Việc đưa tâm thức vượt lên những cung bậc cao hơn để nhìn đúng đắn hơn về thân phận của mình và bản chất cuộc sống là điều hoàn toàn có thể làm được”.\r\n', 'images/hieu-ve-trai-tim.jpg', '2022-01-12 02:17:53', 138000, 3, 1, 0, 9),
(9, 'Việt Nam Sử Lược', 'Cái nghĩa vụ làm sử, tưởng nên kê cứu cho tường tận, rồi cứ sự thực mà nổi, chứ không nên lấy lòng yêu ghét của mình mà xét đoán. Dẫu người mình ghét mà có làm điều phải, mình cũng phải khen; người mình yêu mà có làm điều trái, mình cũng phải chê”\r\n\r\n- Trần Trọng Kim\r\n\r\nViệt Nam sử lược của Trần Trọng Kim xuất bản lần đầu năm 1920, dựa trên những nghiên cứu trước đó như Nam sử tiểu học và Sơ học An Nam sử lược từ những năm 1914 -1917, là bộ thông sử viết bằng chữ quốc ngữ đầu tiên của Việt Nam được soạn theo phương pháp hiện đại.\r\n\r\nVới Việt Nam sử lược, sử học Việt Nam lần đầu tiên có một công trình thoát ly được khỏi lối chép sử biên niên truyền thống của Trung Quốc vốn chỉ nêu lên từng sự kiện riêng lẻ, rời rạc. Việt Nam sử lược trình bày các diễn biến lịch sử thành một câu chuyện liên tục và hấp dẫn, cho người đọc thấy được mối liên lạc nhân quả, biện chứng giữa các sự kiện xảy ra theo dòng thời gian. Ngoài ra, khác với lối chép sử của các sử thần thời phong kiến thường chỉ chú ý ghi chép hành vi, hoạt động của vua chúa quan lại, những cuộc tranh bá đồ vương, Việt Nam sử lược trái lại đã bắt đầu chú ý nhiều đến những sự kiện liên quan đời sống thực tế của dân chúng, sinh hoạt của xã hội, phong tục, tín ngưỡng, … Tất cả đều được thể hiện với một thái độ điềm tĩnh, khách quan, và công bằng đúng như một sử gia cần có.\r\n\r\nTừ lâu đã được coi là tác phẩm kinh điển của sử học Việt Nam, cũng là cuốn sách để đời của học giả Trần Trọng Kim, Việt Nam sử lược hiện vẫn là bộ tín sử ngắn gọn súc tích, dễ nhớ dễ hiểu, sinh động và hấp dẫn nhất từ trước đến nay. Một kiệt tác luôn cần được đọc và đọc lại.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'images/viet-nam-su-luoc.jpg', '2022-01-12 06:24:36', 265000, 1, 1, 231, 480),
(10, 'Lo Âu Xã Hội', 'Lo âu xã hội là tình trạng kéo dài và có thể gây ảnh hưởng nghiêm trọng đến đời sống thường ngày của bạn. Những hành vi trốn tránh, cảm giác sợ hãi và lo lắng tột độ là triệu chứng điển hình mà người mắc chứng lo âu xã hội thường xuyên trải qua. Điều này có thể ngăn bạn đến với những trải nghiệm mới mẻ và có được cuộc sống mà bạn mong muốn.\r\n\r\nVới nhiều năm kinh nghiệm trong lĩnh vực điều trị lo âu, tiến sĩ David Shanley sẽ cung cấp cho bạn những thông tin cần thiết và phương pháp hiệu quả nhất để đối mặt với lo âu xã hội. Cụ thể hơn,LO ÂU XÃ HỘI sẽ phân tích về:\r\n\r\n• Ba khía cạnh cuộc sống mà người mắc chứng lo âu xã hội chật vật nhất: các mối quan hệ, công việc và những tình huống nơi công cộng.\r\n\r\n• Những phương pháp trị liệu hiệu quả như liệu pháp nhận thức hành vi (CBT), liệu pháp chấp nhận và cam kết (ACT).\r\n\r\n• Bộ công cụ phòng chống lo âu với đầy đủ các bài tập thực hành và ví dụ thực tế.\r\n\r\nQuyển sách sẽ giúp bạn xây dựng sự tự tin, học cách tiếp cận lo âu thay vì tránh né, và giành lại quyền kiểm soát cuộc đời mình từ tay lo âu.\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'images/lo-au-xa-hoi.jpg', '2022-01-12 06:24:36', 59000, 4, 1, 0, 24),
(11, 'Mọi người đều nói dối', 'Mọi người đều nói dối.\r\n\r\nNgười ta nói dối số li đã uống trước khi về nhà. Họ nói dối số lần đi tập gym một tuần, về giá đôi giày mới mua, và cả về chuyện có đọc quyển sách mà họ đã nói hay không. Họ gọi điện báo nghỉ bệnh khi vẫn khỏe như vâm. Họ nói sẽ liên lạc nhưng rồi bặt vô âm tín. Họ nói rằng chuyện không liên quan đến bạn mặc dù có liên quan. Họ nói họ yêu bạn dù rằng họ không hề yêu. Họ nói họ vui dù rằng đang buồn chán. Họ nói họ thích phụ nữ dù thực tế họ thích đàn ông.\r\n\r\nNgười ta nói dối với bạn bè. Họ nói dối với ông chủ. Họ nói dối với trẻ con. Họ nói dối với cha mẹ. Họ nói dối với bác sĩ. Họ nói dối với chồng. Họ nói dối với vợ. Họ nói dối với chính mình.\r\n\r\nEVERYBODY LIES là quyển sách ngay từ khi ra mắt đã tạo nên cú chấn động trong cộng đồng yêu thích những sự thật tréo nghoeo nói chung và ham mê tìm tòi phân tích dữ liệu nói riêng. Tận dụng lợi thế cực mạnh của Dữ Liệu Lớn cùng những phương pháp khai thác dữ liệu vô cùng độc đáo và thông minh, tác giả Seth Stephens-Davidowitz đã làm lộ diện điều mà mỗi người thực sự suy nghĩ tận sâu bên trong tâm hồn.\r\n\r\nLiệu bạn có đang nói dối chính mình?\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'images/moi-nguoi-deu-noi-doi.jpg', '2022-01-12 06:28:12', 150000, 4, 1, 4, 58),
(14, 'Đại Việt Sử Ký Toàn Thư Trọn Bộ', 'Đại Việt Sử Ký Toàn Thư trọn bộ ( Tái bản 2020)\r\n\r\nTrong các sách lịch sử cũ của ta , thì \" Đại Việt sử ký toàn thư \" là một bộ sử lớn chép từ Hồng Bàng đến Ất Mão ( 1675) đời vua Gia Tôn nhà Lê. \" Đại Việt sử ký toàn thư \" là bộ sách lịch sử quý báu trong tủ sách sử cũ của nước Việt Nam , rất cần thiết cho những người nghiên cứu lịch sử dân tộc .\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'images/dai-viet-su-ky-toan-thu.jpg', '2022-01-12 13:13:15', 136000, 1, 0, 537, 1482);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(200) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullName`, `userName`, `password`, `role`, `email`) VALUES
(1, 'Huỳnh Quốc Hưng', 'admin', '123', 1, ''),
(2, 'Nguyễn Phương Trang', 'trang', '123', 0, ''),
(3, 'Quốc An', '', '$2b$10$YOMyAHRDRBE4IcnbnI8OJenEt.MeCfZekMiPQwLAWAeh6YLDlrOmi', 0, 'hunghuynh2606@gmail.com'),
(5, 'Khánh An', '', '$2b$10$CphTHz5dfmTrgRsj8pmXjutzAkrmIZHPBN9FFEUpuGdw5qRJ4A0cC', 0, 'hunghuynh449@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
