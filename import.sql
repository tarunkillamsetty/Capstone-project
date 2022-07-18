#CREATE DATABASE AND UPDATE IN APPLICATION PROPERTIES


-------------------------------------------------------------------------------------
#creating DISCOUNT table 

CREATE TABLE IF NOT EXISTS discount
(
    id character  NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
)
ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

---------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

---------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) ,
    buyer_email character varying(255),
    buyer_name character varying(255) ,
    buyer_phone character varying(255) ,
    create_time timestamp ,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp ,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS product_category
(
    category_id integer NOT NULL,
    category_name character varying(255),
    category_type integer,
    create_time timestamp ,
    update_time timestamp,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

----------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS product_in_order
(
    id bigint NOT NULL,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255)  NOT NULL,
    product_icon character varying(255) ,
    product_id character varying(255) ,
    product_name character varying(255),
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

----------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS product_info
(
    product_id character varying(255)  NOT NULL,
    category_type integer DEFAULT 0,
    create_time timestamp ,
    product_description character varying(255) ,
    product_icon character varying(255) ,
    product_name character varying(255)  NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_status integer DEFAULT 0,
    product_stock integer NOT NULL,
    update_time timestamp,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

---------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) ,
    email character varying(255),
    name character varying(255),
    password character varying(255) ,
    phone character varying(255) ,
    role character varying(255) ,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-----------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS tokens
(
    id integer NOT NULL auto_increment,
    created_date timestamp ,
    token character varying(255) ,
    user_id bigint NOT NULL,
    CONSTRAINT tokens_pkey PRIMARY KEY (id),
    CONSTRAINT fk2dylsfo39lgjyqml2tbe0b0ss FOREIGN KEY (user_id)
        REFERENCES users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

----------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS wishlist
(
    id bigint NOT NULL,
    created_date timestamp,
    user_id bigint,
    product_id character,
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT  FOREIGN KEY (user_id)
        REFERENCES users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

----------------------------------------------------------------------------------------------

#Product_categories

lock table product_category write;
INSERT INTO product_category VALUES (2147483641, 'Wall Arts', 0, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO product_category VALUES (2147483642, 'Table Decor', 1, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO product_category VALUES (2147483643, 'Clocks', 2, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO product_category VALUES (2147483644, 'kids Decor', 3, '2022-06-23 23:03:26', '2022-06-23 23:03:26');


unlock tables;

--------------------------------------------------------------------------------------------------------------------

#Users

lock table users write;
INSERT INTO users VALUES (2147483645, true, 'road 22,siripuram , vizag', 'admin@email.com', 'Admin', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '1234567890', 'ROLE_MANAGER');


unlock tables;

----------------------------------------------------------------------------------------------------------------------------


#Product_info

lock tables product_info write;
INSERT INTO product_info VALUES ('BC001', 0, '2022-07-13 23:03:26', 'Malik Design made of Iron gold color wall art with LED ', 'https://ii1.pepperfry.com/media/catalog/product/m/e/800x880/metal-running-horse-behind-sun-in-golden-wall-art-by-malik-design-metal-running-horse-behind-sun-in--hfcjwg.jpg', 'Iron 7 Running Horse Wall Art With LED In Gold', 80.00, 0, 30, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('BC002', 0, '2022-07-13 23:03:26', 'Framed canvas by rahul kohli multicolor landscape oil painting', 'https://ii1.pepperfry.com/media/catalog/product/p/a/800x880/paper-40-x-0-5-x-28-inch-flowers-hand-framed-paintings-by-gallery99-paper-40-x-0-5-x-28-inch-flowers-33vkd7.jpg', 'Flowers Hand Framed Oil Painting', 65.00, 0, 60, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('BC003', 0, '2022-07-13 23:03:26', 'Vinyl multicolor wall sticker by print mantras', 'https://ii1.pepperfry.com/media/catalog/product/p/v/800x880/pvc-vinyl-34-x-24-inch-cute-little-girl-on-cycle-balloons-wall-sticker-by-print-mantras-pvc-vinyl-34-np5jon.jpg', 'Little Girl on Cycle Balloons Wall Sticker', 45.00, 0, 40, '2022-06-23 23:03:26');

INSERT INTO product_info VALUES ('IJ001', 1, '2022-07-13 23:03:26', 'Polyresin no assesmbly required brown color vase', 'https://ii1.pepperfry.com/media/catalog/product/l/e/800x880/leafy-ripples-polyresin-table-vase-by--home-leafy-ripples-polyresin-table-vase-by--home-aynozx.jpg', 'eafy Ripples Polyresin Table Vase', 53.00, 0, 22, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('IJ002', 1, '2022-07-13 23:03:26', 'Metal and marble white color candle holder for Home', 'https://ii1.pepperfry.com/media/catalog/product/w/h/800x880/white-terrazzo-candle-holder-by-posh-n-plush-white-terrazzo-candle-holder-by-posh-n-plush-ye3hue.jpg', 'White Terrazzo Candle Holder', 85.00, 0, 10, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('IJ003', 1, '2022-07-13 23:03:26', 'Multicolor resin no assembly required water fountain for tables', 'https://ii1.pepperfry.com/media/catalog/product/r/e/800x880/relaxing-buddha-by-smartway-lighting-relaxing-buddha-by-smartway-lighting-6l1twz.jpg', 'Relaxing Buddha Fountain', 45.00, 0, 50, '2022-06-23 23:03:26');


INSERT INTO product_info VALUES ('RE001', 2, '2022-07-13 23:03:26', 'Round analog golden color iron watch', 'https://ii1.pepperfry.com/media/catalog/product/g/o/800x880/golden-metal-analog-clock-golden-metal-analog-clock-sok9hy.jpg', 'Golden Metal Analog Clock Craftter', 73.00, 0, 45, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('RE002', 2, '2022-07-13 23:03:26', 'Black clor oval shape analog pendulum clock ', 'https://ii1.pepperfry.com/media/catalog/product/b/r/800x880/brown-plastic-oval-shape-pendulum-clock-by-kaiser-brown-plastic-oval-shape-pendulum-clock-by-kaiser-sbwe47.jpg', 'Black Plastic Oval Shape Pendulum Clock', 57.00, 0, 53, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('RE003', 2, '2022-07-13 23:03:26', 'Analog clock with fine metal java frame around it ', 'https://ii1.pepperfry.com/media/catalog/product/m/e/800x880/metal-jawa-bike-wall-clock-by-craft-tree-metal-jawa-bike-wall-clock-by-craft-tree-u9ldar.jpg', 'Metal Jawa Bike Wall Clock', 95.00, 0, 70, '2022-06-23 23:03:26');


INSERT INTO product_info VALUES ('CD001', 3, '2022-07-13 23:03:26', 'unique oak color engineering wood wall shelf for kids', 'https://ii1.pepperfry.com/media/catalog/product/e/n/800x880/engineered-wood-wallshelf-in-oak-finish-engineered-wood-wallshelf-in-oak-finish-mu91uk.jpg', 'Shark Shaped Shelf in Oak Finish', 90.00, 0, 39, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('CD002', 3, '2022-07-13 23:03:26', 'multicolor giraffe vinyl material wall sticker for kids height measurement', 'https://ii1.pepperfry.com/media/catalog/product/p/v/800x880/pvc-vinyl-28-x-55-inch-kids-height-measurement-with-giraffe-wall-sticker-by-print-mantras-pvc-vinyl--bk1ovv.jpg', 'PVC Vinyl 28 x 55 Inch Kids Height Measurement with Giraffe Wall Sticker', 76.00, 0, 75, '2022-06-23 23:03:26');
INSERT INTO product_info VALUES ('CD003', 3, '2022-07-13 23:03:26', 'NutScape muticolor landscape wall art for kids made of wood', 'https://ii1.pepperfry.com/media/catalog/product/d/r/800x880/dream-digital-painting-wall-art-by-nutcase-dream-digital-painting-wall-art-by-nutcase-cx1ruf.jpg', 'Dream Digital Painting Wall Art', 82.00, 0, 20, '2022-06-23 23:03:26');


