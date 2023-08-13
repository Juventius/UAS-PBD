DROP DATABASE IF EXISTS `Aplikasi_Pemesanan_Makanan`;
CREATE DATABASE `Aplikasi_Pemesanan_Makanan`;
USE `Aplikasi_Pemesanan_Makanan`;

CREATE TABLE `customer` (
	`customer_id` char(9) NOT NULL,
    `customer_name` varchar(50) NOT NULL,
    `customer_phone_number` varchar(20) NOT NULL,
    `customer_address` varchar(255) NOT NULL,
    PRIMARY KEY (`customer_id`)
);

CREATE TABLE `restaurant` (
    `restaurant_id` char(9) NOT NULL,
    `restaurant_name` varchar(100) NOT NULL,
    `restaurant_address` varchar(255) NOT NULL,
    `opening_time` time NOT NULL,
    `closing_time` time NOT NULL,
    PRIMARY KEY (`restaurant_id`)
);

CREATE TABLE `driver` (
    `driver_id` char(9) NOT NULL,
    `driver_name` varchar(50) NOT NULL,
    `driver_phone_number` varchar(20) NOT NULL,
    `license_plate_number` varchar(12) NOT NULL,
    `vehicle_brand_and_model` varchar(50) NOT NULL,
    PRIMARY KEY (`driver_id`)
);

CREATE TABLE `menu` (
    `menu_id` char(9) NOT NULL,
    `menu_name` varchar(255) NOT NULL,
    `restaurant_id` char(9) NOT NULL,
    PRIMARY KEY (`menu_id`),
    CONSTRAINT `FK_menu_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`)
);

CREATE TABLE `menu_item` (
    `menu_item_id` char(9) NOT NULL,
    `item_name` varchar(255) NOT NULL,
    `category` varchar(50) NOT NULL,
    `description` varchar(255) NOT NULL,
    `price` float NOT NULL,
    `image` varchar(255) NOT NULL,
    `menu_id` char(9) NOT NULL,
    PRIMARY KEY (`menu_item_id`),
    CONSTRAINT `FK_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`)
);

CREATE TABLE `order` (
	`order_id` char(12) NOT NULL,
    `restaurant_id` char(9) NOT NULL,
    `customer_id` char(9) NOT NULL,
    `driver_id` char(9) NOT NULL,
    `status` enum("DIPROSES", "DIKIRIM", "DIBATALKAN", "SELESAI") NOT NULL,
    `total_price` float NOT NULL,
    `payment_method` enum("TUNAI", "E-MONEY") NOT NULL,
    `destination` varchar(255) NOT NULL,
    `order_date` datetime NOT NULL,
    `arrival_time` time NOT NULL,
    PRIMARY KEY (`order_id`),
    CONSTRAINT `FK_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`),
    CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`),
    CONSTRAINT `FK_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver`(`driver_id`)
);

CREATE TABLE `order_item` (
    `order_item_id` char(9) NOT NULL,
    `order_id` char(12) NOT NULL,
    `menu_item_id` char(9) NOT NULL,
    `quantity` integer NOT NULL,
    PRIMARY KEY (`order_item_id`),
    CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`),
    CONSTRAINT `FK_menu_item_id` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item`(`menu_item_id`)
);


-- Insert values into "customer" table
-- 1
INSERT INTO `customer` 
VALUES ("105927382","Setno Nugraha","081334567287","Jl. Merdeka No.27, Kota Bandung, Jawa Barat");
-- 2
INSERT INTO `customer` 
VALUES ("179346892","Bambang Turangga","081821673011","Jl. Dipatiukur No.62, Kota Bandung, Jawa Barat");
-- 3
INSERT INTO `customer` 
VALUES ("152683258","Budi Tabudi","081914294799","Jl. Jawa No.8, Kota Bandung, Jawa Barat");
-- 4
INSERT INTO `customer`
VALUES ("193278434","Anwar Gunawan","081150923864","Jl. Purwakarta No.50, Kota Bandung, Jawa Barat");
-- 5
INSERT INTO `customer`
VALUES ("172835928","Cika Yuniarti","081187934047","Jl. Gatot Subroto No.8, Kota Bandung, Jawa Barat");
-- 6
INSERT INTO `customer` 
VALUES ("143213212","Andi Putra","081334567281","Jl. Gator Subroto No.89, Kota Bandung, Jawa Barat");
-- 7
INSERT INTO `customer` 
VALUES ("165234789","Arif Teja","081324559123","Jl.Braga N0.16, Kota Bandung, Jawa Barat");
-- 8
INSERT INTO `customer` 
VALUES ("187562341","Dani Putra","081222623165","Jl.Buah Batu No.25, Kota Bandung, Jawa Barat");
-- 9
INSERT INTO `customer` 
VALUES ("132167980","Dewi Alya","089876234512","Jl.Siliwangi No.82, Kota Bandung, Jawa Barat");
-- 10
INSERT INTO `customer` 
VALUES ("188211143","Ratna Sari","087234121111","Jl.Asia Afrika No.30, Kota Bandung, Jawa Barat");
-- 11
INSERT INTO `customer` 
VALUES ("123221060","Deva Rizki","081223231221","Jl.Ujungberung No.21, Kota Bandung, Jawa Barat");
-- 12
INSERT INTO `customer` 
VALUES ("167892122","Mayang Sari","087902147892","Jl.Talagabodas N0.35, Kota Bandung, Jawa Barat");
-- 13
INSERT INTO `customer` 
VALUES ("143256777","Hanif Bakti","082112356900","Jl.Sukamulya No.04, Kota Bandung, Jawa Barat");
-- 14
INSERT INTO `customer` 
VALUES ("146231332","Surya Utama","081234222342","Jl.Babakan Sari No.110, Kota Bandung, Jawa Barat");
-- 15
INSERT INTO `customer` 
VALUES ("187212111","Angga Dharma","085234212121","Jl.Raya Kopo No.30, Kota Bandung, Jawa Barat");
-- 16 
INSERT INTO `customer` 
VALUES ("144212111","Salsa Utami","081221131232","Jl.Gedebage No.14, Kota Bandung, Jawa Barat");
-- 17
INSERT INTO `customer` 
VALUES ("167892123","Asep Prawira","087212111456","Jl.Purabaya N0.16, Kota Bandung, Jawa Barat");
-- 18
INSERT INTO `customer` 
VALUES ("197721117","Indra Teguh","085321234474","Jl.A.H Nasution No.14, Kota Bandung, Jawa Barat");
-- 19
INSERT INTO `customer` 
VALUES ("178262123","Rama Saleh","085902365782","Jl.Bojongloa No.76, Kota Bandung, Jawa Barat");
-- 20
INSERT INTO `customer` 
VALUES ("165252471","Aryo Pujasya","087842332109","Jl.Batununggal No.12 , Kota Bandung, Jawa Barat");

-- Insert values into "restaurant" table
-- 1 
INSERT INTO `restaurant` 
VALUES ("285713296","Nasi Goreng Mang Asep","Jl. Merak No.25, Kota Bandung, Jawa Barat","10:00:00","18:00:00");
-- 2
INSERT INTO `restaurant` 
VALUES ("213248814","Mie Ayam Selera Rasa","Jl. Jakarta No.112, Kota Bandung, Jawa Barat","10:00:00","22:00:00");
-- 3
INSERT INTO `restaurant` 
VALUES ("246138949","Xi Bo Ba","Jl. Sunda No.3, Kota Bandung, Jawa Barat","11:00:00","21:00:00");
-- 4
INSERT INTO `restaurant`
VALUES ("228619369","Nasi Padang Sari Bundo","Jl. Banda No.112, Kota Bandung, Jawa Barat","09:00:00","18:00:00");
-- 5
INSERT INTO `restaurant`
VALUES ("259783171","KFC", "Jl. Ir. H. Djuanda No.250, Kota Bandung, Jawa Barat","11:00:00","20:00:00");
-- 6
INSERT INTO `restaurant`
VALUES ("234218211","Chiclin","Jl. HOS Cokroaminoto No.10, Kota Bandung, Jawa Barat","10:00:00","21:00:00");
-- 7 
INSERT INTO `restaurant`
VALUES ("292661567","Burger King","JL. Asia Afrika No.85, Kota Bandung, Jawa Barat","08:00:00","21:00:00");
-- 8
INSERT INTO `restaurant`
VALUES ("262511369","Lekker Story","Jl. Lodaya No 21, Kota Bandung, Jawa Barata","11:00:00","20:00:00");
-- 9
INSERT INTO `restaurant`
VALUES ("211310598","Seblak Sultan","JL. Sultan Agung No 10, Kota Bandung, Jawa Barat","10:00:00","21:00:00");
-- 10
INSERT INTO `restaurant`
 VALUES ("223418821","Donat Pops","Jl. Kebon Bibit No.11, Kota Bandung, Jawa Barat","08:00:00","21:15:00");
-- 11
INSERT INTO `restaurant` 
VALUES ("265555234","Bubur Ayam BEJO","Jl. Baranang Siang No.41, Kota Bandung, Jawa Barat","06:00:00","23:00:00");
-- 12
INSERT INTO `restaurant` 
VALUES ("281232111","Surabi Cihapit","Jl. Sabang No.65, Kota Bandung, Jawa Barat","07:00:00","22:00:00");
-- 13
INSERT INTO `restaurant` 
VALUES ("232123452","Chatime","Jl. Merdeka No.56, Kota Bandung, Jawa Barat","11:00:00","21:00:00");
-- 14
INSERT INTO `restaurant`
VALUES ("288711267","Mixue","Jl. Karapitan No.114B, Kota Bandung, Jawa Barat","09:00:00","22:00:00");
-- 15
INSERT INTO `restaurant`
VALUES ("295432664","Roti Bakar Cari Rasa", "Jl. A.Yani No.149, Kota Bandung, Jawa Barat","06:00:00","00:00:00");
-- 16
INSERT INTO `restaurant`
VALUES ("255621223","Jigoku Ramen","Jl. Anggrek No.43, Kota Bandung, Jawa Barat","12:00:00","20:00:00");
-- 17 
INSERT INTO `restaurant`
VALUES ("233444111","Kue Balok Kang Didin","JL. Abdul Rahman Saleh No.52, Kota Bandung, Jawa Barat","06:00:00","00:00:00");
-- 18
INSERT INTO `restaurant`
VALUES ("275671459","Puyo Silky Desserts","Jl. Pasir Kaliki No.23, Kota Bandung, Jawa Barat","10:00:00","20:00:00");
-- 19
INSERT INTO `restaurant`
VALUES ("219221870","Richeese Factory","JL. Pajajaran No 65, Kota Bandung, Jawa Barat","08:00:00","21:00:00");
-- 20
INSERT INTO `restaurant`
VALUES ("276567231","Es Teh Indonesia","Jl. Cikutra No.230, Kota Bandung, Jawa Barat","10:00:00","21:00:00");

-- Insert values into "driver" table
-- 1
INSERT INTO `driver`
VALUES ("391878415","Bambang Hidayat","081993407639","D 4567 KDF","Yamaha Fino");
-- 2
INSERT INTO `driver`
VALUES ("310344239","Kevin Nurhadian","082401327923","D 4102 BCQ","Honda Scoopy");
-- 3
INSERT INTO `driver`
VALUES ("371986821","Heru Cahyono","081165290245","D 5907 EIV","Yamaha R15");
-- 4
INSERT INTO `driver`
VALUES ("310986517","Hadian Rizky","081917032568","D 2938 AAD","Honda Genio");
-- 5
INSERT INTO `driver`
VALUES ("319825731","Bernartus Vincent","082280395738","D 9745 KLM","Suzuki Address");
-- 6
INSERT INTO `driver` 
VALUES ("322875890","Budi Prakasa","082199340762","D 2111 LDF","Yamaha Fino");
-- 7
INSERT INTO `driver` 
VALUES ("349781221","Eko Putra","081225123231","D 2321 AWG","Yamaha Mio");
-- 8
INSERT INTO `driver` 
VALUES ("342167900","Aji Sakti","085671321111","D 4561 APC","Honda Scoopy");
-- 9
INSERT INTO `driver` 
VALUES ("352311245","Banar Arif","087234178654","D 1124 ALM","Honda Supra");
-- 10
INSERT INTO `driver` 
VALUES ("331432795","Eka Rizky","082156724321","D 2341 AUG","Honda Vario");
-- 11
INSERT INTO `driver`
VALUES ("366245761","Putri Pangestu","081124596724","D 1145 ILY","Honda Beat Street");
-- 12
INSERT INTO `driver`
VALUES ("394221780","Puri Anjasmara","089823670555","D 2124 ATT","Honda Vario");
-- 13
INSERT INTO `driver`
VALUES ("377212870","Alli Mahata","085523111870","D 4221 RST","Honda Revo");
-- 14
INSERT INTO `driver`
VALUES ("344521767","Lilis Purnama","081212789564","D 6782 IDF","Honda Beat");
-- 15
INSERT INTO `driver`
VALUES ("369221766","Sari Astuti","089721456978","D 1131 AMR","Yamaha Freego");
-- 16
INSERT INTO `driver` 
VALUES ("381231216","Angga Subakti","081255356324","D 5642 YPT","Honda Forza");
-- 17
INSERT INTO `driver` 
VALUES ("355436111","Jalil Utama","081256555919","D 8845 ARW","Honda Supra X");
-- 18
INSERT INTO `driver` 
VALUES ("387671902","Amar Pahlevi","085456213222","D 6781 EPC","Honda Scoopy");
-- 19
INSERT INTO `driver` 
VALUES ("346671888","Sigit Pratama","087721870879","D 1121 RMN","Honda Gear 125");
-- 20
INSERT INTO `driver` 
VALUES ("369821773","Fahmi Perkasa","081456755212","D 4421 IUD"," Yamaha X Ride");

-- Insert values into "menu" table
-- 1
INSERT INTO `menu`
VALUES ("401713296","Menu Nasi Goreng","285713296"); -- Nasi Goreng Mang Asep
-- 2
INSERT INTO `menu`
VALUES ("401248814","Menu Mie Ayam","213248814"); -- Mie Ayam Selera Rasa
-- 3
INSERT INTO `menu`
VALUES ("401138949","Menu Boba","246138949"); -- Xi Bo Ba
-- 4
INSERT INTO `menu`
VALUES ("401619369","Menu Paket Nasi Padang","228619369"); -- Nasi Padang Sari Bundo
-- 5
INSERT INTO `menu`
VALUES ("401783171","Menu Ayam","259783171"); -- KFC
-- 6
INSERT INTO `menu`
VALUES ("402713296","Menu Mie Goreng","285713296"); -- Nasi Goreng Mang Asep
-- 7
INSERT INTO `menu`
VALUES ("402248814","Menu Bakso","213248814"); -- Mie Ayam Selera Rasa
-- 8
INSERT INTO `menu`
VALUES ("402138949","Menu Teh","246138949"); -- Xi Bo Ba
-- 9
INSERT INTO `menu`
VALUES ("402619369","Menu Lauk Satuan","228619369"); -- Nasi Padang Sari Bundo
-- 10
INSERT INTO `menu`
VALUES ("402783171","Menu Burger","259783171"); -- KFC
-- 11
INSERT INTO `menu`
VALUES ("401264189","Menu Bubur Ayam Campur","265555234"); -- Bubur Ayam BEJO
-- 12
INSERT INTO `menu`
VALUES ("403724818","Menu Bubur Ayam Pisah","265555234"); -- Bubur Ayam BEJO
-- 13
INSERT INTO `menu`
VALUES ("409184371","Menu Topping","265555234"); -- Bubur Ayam BEJO
-- 14
INSERT INTO `menu`
VALUES ("407429817","Menu Ice Cream Cone","288711267"); -- Mixue
-- 15
INSERT INTO `menu`
VALUES ("407187921","Menu Milk Tea","288711267"); -- Mixue
-- 16
INSERT INTO `menu`
VALUES ("409508905","Menu Sakura Series","288711267"); -- Mixue
-- 17
INSERT INTO `menu`
VALUES ("408412679","Menu Mixue X BTS","288711267"); -- Mixue
-- 18
INSERT INTO `menu`
VALUES ("409781497","Menu Lavender Tea","288711267"); -- Mixue
-- 19
INSERT INTO `menu`
VALUES ("406834187","Menu Ice Cream Sundae","288711267"); -- Mixue
-- 20
INSERT INTO `menu`
VALUES ("408854289","Menu Coffee","288711267"); -- Mixue
-- 21
INSERT INTO `menu`
VALUES ("402347817","Menu Real Fruit Tea","288711267"); -- Mixue
-- 22
INSERT INTO `menu`
VALUES ("401273183","Menu Burger","292661567"); -- Burger King
-- 23
INSERT INTO `menu`
VALUES ("408193748","Menu Ayam","292661567"); -- Burger King
-- 24
INSERT INTO `menu`
VALUES ("407298316","Menu Soda","292661567"); -- Burger King
-- 25
INSERT INTO `menu`
VALUES ("401894638","Menu Kentang","292661567"); -- Burger King
-- 26
INSERT INTO `menu`
VALUES ("401634189","Menu Seblak","211310598"); -- Seblak Sultan
-- 27
INSERT INTO `menu`
VALUES ("406128498","Menu Paket Combo","219221870"); -- Richeese Factory
-- 28
INSERT INTO `menu`
VALUES ("401834619","Menu Roti Bakar Biasa","295432664"); -- Roti Bakar Cari Rasa
-- 29
INSERT INTO `menu`
VALUES ("407183469","Menu Roti Bakar Kadet","295432664"); -- Roti Bakar Cari Rasa
-- 30
INSERT INTO `menu`
VALUES ("401968413","Menu Roti Kukus","295432664"); -- Roti Bakar Cari Rasa
-- 31
INSERT INTO `menu`
VALUES ("401983274","Menu Surabi Biasa","281232111"); -- Surabi Cihapit
-- 32
INSERT INTO `menu`
VALUES ("401846913","Menu Surabi Mini","281232111"); -- Surabi Cihapit
-- 33
INSERT INTO `menu`
VALUES ("401469137","Menu Kue Balok","233444111"); -- Kue Balok Kang Didin
-- 34
INSERT INTO `menu`
VALUES ("401632917","Menu Chicken","234218211"); -- Chiclin
-- 35
INSERT INTO `menu`
VALUES ("401784127","Menu Ramen","255621223"); -- Jigoku Ramen
-- 36
INSERT INTO `menu`
VALUES ("402397438","Menu Es Teh","276567231"); -- Es Teh Indonesia
-- 37
INSERT INTO `menu`
VALUES ("401298749","Menu Silky Desserts","275671459"); -- Puyo Silky Desserts
-- 38
INSERT INTO `menu`
VALUES ("401293798","Menu Lekker","262511369"); -- Lekker Story
-- 39
INSERT INTO `menu`
VALUES ("401937928","Menu Hazelnut","232123452"); -- Chatime
-- 40
INSERT INTO `menu`
VALUES ("401829479","Menu Donat","223418821"); -- Donat Pops

-- Insert values into "menu_item" table
-- 1
INSERT INTO `menu_item`
VALUES ("581626190","Nasi Goreng Sosis","Makanan","Nasi goreng dengan toping sosis lezat",27500,"nasi_goreng_sosis.jpg","401713296"); -- Menu Nasi Goreng / Nasi Goreng Mang Asep
-- 2
INSERT INTO `menu_item`
VALUES ("538240896","Mie Ayam Komplit","Makanan","Mie ayam dengan tambahan bakso dan pangsit",20000,"mie_ayam_komplit.jpg","401248814"); -- Menu Mie Ayam / Mie Ayam Selera Rasa
-- 3
INSERT INTO `menu_item`
VALUES ("592170293","Salted Caramel Boba","Minuman","Campuran susu, salted caramel, dan boba",18500,"salted_caramel_boba.jpg","401138949"); -- Menu Boba / Xi Bo Ba
-- 4
INSERT INTO `menu_item`
VALUES ("517234014","Nasi Rendang Komplit","Makanan","Nasi putih dengan rendang, daun singkong, dan sambal hijau",22000,"nasi_rendang_komplit.jpg","401619369"); -- Menu Paket Nasi Padang / Nasi Padang Sari Bundo
-- 5
INSERT INTO `menu_item`
VALUES ("562178561","Paha Atas Crispy","Makanan","Paha atas ayam yang digoreng dengan tepung crispy",18000,"paha_atas_crispy.jpg","401783171"); -- Menu Ayam / KFC
-- 6
INSERT INTO `menu_item`
VALUES ("571985034","Mie Goreng Ayam","Makanan","Mie goreng dengan topping ayam",14000,"mie_goreng_ayam.jpg","402713296"); -- Menu Mie Goreng / Nasi Goreng Mang Asep
-- 7
INSERT INTO `menu_item`
VALUES ("551728009","Bakso Kerikil","Makanan","Bakso kecil-kecil dengan kuah",10000,"bakso_kerikil.jpg","402248814"); -- Menu Bakso / Mie Ayam Selera Rasa
-- 8
INSERT INTO `menu_item`
VALUES ("547301269","Iced Jasmine Tea","Minuman","Es teh manis dengan aroma Jasmine",16000,"iced_jasmine_tea.jpg","402138949"); -- Menu Teh / Xi Bo Ba
-- 9
INSERT INTO `menu_item`
VALUES ("512908573","Ayam Pop","Makanan","Ayam Pop khas Padang",12000,"ayam_pop.jpg","402619369"); -- Menu Lauk Satuan / Nasi Padang Sari Bundo
-- 10
INSERT INTO `menu_item`
VALUES ("512907835","Cheeseburger","Makanan","Burger dengan keju melimpah",25000,"cheeseburger.jpg","402783171"); -- Menu Burger / KFC
-- 11
INSERT INTO `menu_item`
VALUES ("529435729","Bubur Ayam Campur + Telur","Makanan","Bubur ayam untuk tim #dicampur dengan tambahan telur",22000,"bubur_ayam_telur.jpg","401264189"); -- Menu Bubur Ayam Campur / Bubur Ayam BEJO
-- 12
INSERT INTO `menu_item`
VALUES ("528975982","Bubur Ayam Pisah Orginal","Makanan","Bubur ayam porsi pisah original",15000,"bubur_ayam.jpg","403724818"); -- Menu Bubur Ayam Pisah / Bubur Ayam BEJO
-- 13
INSERT INTO `menu_item`
VALUES ("582498257","Ekstra Daun Bawang","Makanan","Tambahan daun bawang",2000,"daun_bawang.jpg","409184371"); -- Menu Topping / Bubur Ayam BEJO
-- 14
INSERT INTO `menu_item`
VALUES ("591758319","Strawberry Ice Cream","Makanan","Es krim rasa stroberi",5000,"strawberry_ice_cream.jpg","407429817"); -- Menu Ice Cream Cone / Mixue
-- 15
INSERT INTO `menu_item`
VALUES ("514798320","Original Milk Tea XL","Minuman","Milk tea original dengan ukuran terbesar",28000,"milk_tea_xl.jpg","407187921"); -- Menu Milk Tea / Mixue
-- 16
INSERT INTO `menu_item`
VALUES ("543780921","Sakura Fanta Float","Minuman","Fanta dengan tambahan es krim",17000,"sakura_fanta_float.jpg","409508905"); -- Menu Sakura Series / Mixue
-- 17
INSERT INTO `menu_item`
VALUES ("590487124","Purple Lemon Tea","Minuman","Teh lemon berwarna ungu",21000,"purple_lemon_tea.jpg","408412679"); -- Menu Mixue X BTS / Mixue
-- 18
INSERT INTO `menu_item`
VALUES ("543728190","Lavender Tea L","Minuman","Teh manis dengan aroma lavender",14000,"lavender_tea_l.jpg","409781497"); -- Menu Lavender Tea / Mixue
-- 19
INSERT INTO `menu_item`
VALUES ("543127980","Chocolate Sundae","Makanan","Es krim sundae rasa coklat",8000,"chocolate_sundae.jpg","406834187"); -- Menu Ice Cream Sundae / Mixue
-- 20
INSERT INTO `menu_item`
VALUES ("594827010","Black Coffee","Minuman","Kopi hitam manis",7500,"black_coffee.jpg","408854289"); -- Menu Coffee / Mixue
-- 21
INSERT INTO `menu_item`
VALUES ("513489010","Glazed Apple Tea","Minuman","Teh dengan perisa apel manis",17500,"glazed_apple_tea.jpg","402347817"); -- Menu Real Fruit Tea / Mixue
-- 22
INSERT INTO `menu_item`
VALUES ("543798021","Beef Rasher","Makanan","Burger dengan patty dan tambahan bacon",23000,"beef_rasher.jpg","401273183"); -- Menu Burger / Burger King
-- 23
INSERT INTO `menu_item`
VALUES ("542780931","Spicy Chicken Drumstick","Makanan","Paha ayam goreng pedas",13500,"spicy_drumstick.jpg","408193748"); -- Menu Ayam / Burger King
-- 24
INSERT INTO `menu_item`
VALUES ("510987410","Coca Cola","Minuman","Coca Cola original",7500,"coca_cola.jpg","407298316"); -- Menu Soda / Burger King
-- 25
INSERT INTO `menu_item`
VALUES ("574892107","Cheesy Fries","Makanan","Kentang goreng dengan keju",6000,"cheesy_fries.jpg","401894638"); -- Menu Kentang / Burger King
-- 26
INSERT INTO `menu_item`
VALUES ("541702491","Seblak Komplit","Makanan","Seblak dengan campuran semua kerupuk",13500,"seblak_komplit.jpg","401634189"); -- Menu Seblak / Seblak Sultan
-- 27
INSERT INTO `menu_item`
VALUES ("587149372","Combo Favorite","Makanan","Nasi ayam goreng dengan 2 saus spesial",33000,"combo_favorite.jpg","406128498"); -- Menu Paket Combo / Richeese Factory
-- 28
INSERT INTO `menu_item`
VALUES ("543892179","Roti Bakar Keju Susu","Makanan","Roti bakar dengan isian keju dan susu",26500,"bakar_keju_susu.jpg","401834619"); -- Menu Roti Bakar Biasa / Roti Bakar Cari Rasa
-- 29
INSERT INTO `menu_item`
VALUES ("574198749","Roti Kadet Coklat","Makanan","Roti kadet bakar dengan isian coklat",7500,"kadet_coklat.jpg","407183469"); -- Menu Roti Bakar Kadet / Roti Bakar Cari Rasa
-- 30
INSERT INTO `menu_item`
VALUES ("578390204","Roti Kukus Pisang Oreo","Makanan","Roti kukus dengan isian pisang dan oreo",29500,"kukus_pisang_oreo.jpg","401968413"); -- Menu Roti Kukus / Roti Bakar Cari Rasa
-- 31
INSERT INTO `menu_item`
VALUES ("510874949","Surabi Telur Sosis","Makanan","Surabi telur dengan tambahan sosis",12000,"surabi_telur_sosis.jpg","401983274"); -- Menu Surabi Biasa / Surabi Cihapit
-- 32
INSERT INTO `menu_item`
VALUES ("574180987","Surabi Coklat Mini","Makanan","Surabi coklat ukuran kecil",4000,"surabi_coklat_mini.jpg","401846913"); -- Menu Surabi Mini / Surabi Cihapit
-- 33
INSERT INTO `menu_item`
VALUES ("517401974","Kue Balok Green Tea Original","Makanan","Kue balok adonan Green Tea original",27000,"kue_balok_green_tea_ori.jpg","401469137"); -- Menu Kue Balok / Kue Balok Kang Didin
-- 34
INSERT INTO `menu_item`
VALUES ("571987401","Crispy Chicken XXL","Makanan","Ayam goreng crispy ukuran besar",35000,"crispy_chicken_xxl.jpg","401632917"); -- Menu Chicken / Chiclin
-- 35
INSERT INTO `menu_item`
VALUES ("529784190","Miso Ramen","Makanan","Ramen dengan kuah miso",42000,"miso_ramen.jpg","401784127"); -- Menu Ramen / Jigoku Ramen
-- 36
INSERT INTO `menu_item`
VALUES ("517983710","Es Teh Tawar","Minuman","Es teh original tanpa gula",3000,"es_teh_tawar.jpg","402397438"); -- Menu Es Teh / Es Teh Indonesia
-- 37
INSERT INTO `menu_item`
VALUES ("534791746","Silky Mango","Makanan","Puding rasa mangga",21000,"silky_mango.jpg","401298749"); -- Menu Silky Desserts / Puyo Silky Desserts
-- 38
INSERT INTO `menu_item`
VALUES ("547137019","Lekker Kornet Tuna","Makanan","Lekker dengan isian daging tuna dan kornet",29500,"lekker_kornet_tuna.jpg","401293798"); -- Menu Lekker / Lekker Story
-- 39
INSERT INTO `menu_item`
VALUES ("587953901","Hazelnut Choco Milk","Minuman","Susu coklat dengan perisa hazelnut",26000,"hazelnut_choco_milk.jpg","401937928"); -- Menu Hazelnut / Chatime
-- 40
INSERT INTO `menu_item`
VALUES ("580213741","Banana Cream Donut","Makanan","Donat dengan isian krim pisang",11500,"banana_cream_donut.jpg","401829479"); -- Menu Donat / Donat Pops

-- Insert values into "order" table
-- 1
INSERT INTO `order`
VALUES ("F-1552329710","285713296","105927382","391878415","SELESAI",165000,"TUNAI","Jl. Merdeka No.27, Kota Bandung, Jawa Barat","2022-06-08 15:30:00","16:10:00");
-- 2
INSERT INTO `order`
VALUES ("X-1092738551","213248814","179346892","310344239","DIPROSES",75000,"E-MONEY","Jl. Braga No.28, Kota Bandung, Jawa Barat","2022-05-06 12:10:00","12:45:00");
-- 3
INSERT INTO `order`
VALUES ("S-5125628168","246138949","152683258","371986821","DIKIRIM",30000,"TUNAI","Jl. Jawa No.8, Kota Bandung, Jawa Barat","2022-06-13 10:30:00","11:20:00");
-- 4
INSERT INTO `order`
VALUES ("B-9078125615","228619369","193278434","310986517","DIPROSES",45000,"TUNAI","Jl. Purwakarta No.50, Kota Bandung, Jawa Barat","2022-04-22 16:35:00","17:00:00");
-- 5
INSERT INTO `order`
VALUES ("M-1075915921","259783171","172835928","319825731","DIBATALKAN",110000,"E-MONEY","Jl. Raya Bojongsoang No.43, Kabupaten Bandung, Jawa Barat","2022-03-15 13:00:00","13:55:00");
-- 6
INSERT INTO `order`
VALUES ("A-8108749730","285713296","105927382","319825731","DIKIRIM",55000,"TUNAI","Jl. Supratman No.87, Kota Bandung, Jawa Barat","2022-01-27 12:25:00","13:10:00");
-- 7
INSERT INTO `order`
VALUES ("L-1502798465","213248814","172835928","310986517","DIKIRIM",80000,"E-MONEY","Jl. Gatot Subroto No.8, Kota Bandung, Jawa Barat","2022-02-16 11:30:00","12:25:00");
-- 8
INSERT INTO `order`
VALUES ("E-4865147413","246138949","179346892","371986821","DIBATALKAN",35000,"E-MONEY","Jl. Setiabudi No.77, Kota Bandung, Jawa Barat","2022-06-15 16:15:00","16:40:00");
-- 9
INSERT INTO `order`
VALUES ("Y-3243617494","228619369","152683258","310344239","DIPROSES",65000,"TUNAI","Jl. Jawa No.8, Kota Bandung, Jawa Barat","2022-06-01 17:15:00","18:00:00");
-- 10
INSERT INTO `order`
VALUES ("C-4126810974","259783171","193278434","391878415","SELESAI",120000,"E-MONEY","Jl. Asia Afrika No.117, Kota Bandung, Jawa Barat","2022-04-03 13:30:00","14:20:00");

-- Insert values into "order_item" table
-- 1
INSERT INTO `order_item`
VALUES ("654907731","F-1552329710","581626190",5);
-- 2
INSERT INTO `order_item`
VALUES ("642910574","X-1092738551","538240896",2);
-- 3
INSERT INTO `order_item`
VALUES ("640494701","S-5125628168","592170293",1);
-- 4
INSERT INTO `order_item`
VALUES ("698135279","Y-3243617494","517234014",2);
-- 5
INSERT INTO `order_item`
VALUES ("653827532","M-1075915921","562178561",5);
-- 6
INSERT INTO `order_item`
VALUES ("619683471","A-8108749730","571985034",3);
-- 7
INSERT INTO `order_item`
VALUES ("675479324","L-1502798465","551728009",7);
-- 8
INSERT INTO `order_item`
VALUES ("689247542","E-4865147413","547301269",2);
-- 9
INSERT INTO `order_item`
VALUES ("642538269","Y-3243617494","512908573",1);
-- 10
INSERT INTO `order_item`
VALUES ("671784128","X-1092738551","551728009",2);