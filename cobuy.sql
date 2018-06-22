CREATE DATABASE  IF NOT EXISTS `cobuy` /*!40100 DEFAULT CHARACTER SET utf8 */;


DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(60) NOT NULL,
 `continent` ENUM('Africa', 'Europe', 'Asia', 'North America', 'South America') NULL,
 `description` text NULL,
 `enable_vat_collection` BOOLEAN DEFAULT 0,
 `country_default_vat_rate` DOUBLE DEFAULT 0.00,
 `prevailing_vat_policy` ENUM('buyer_seller_same_country', 'all_country_store_purchases', 'only_country_domains_purchases_on_country_store') NULL,
 `flag` VARCHAR(40) NULL,
  `country_code` VARCHAR(6) NULL,
 `flag_size` INT(20) DEFAULT 0,
 `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `create_time` (`create_time`),
 KEY `update_time` (`create_time`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 
 
 DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(60) NOT NULL,
 `state_code` VARCHAR(6) NULL,
 `description` text NULL,
  `state_number` VARCHAR(2) NULL,
 `country_id` INT(10) UNSIGNED NOT NULL,
 `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `fk_country_state_idx` (`country_id`),
 KEY `create_time` (`create_time`),
 CONSTRAINT `fk_country_state_idx` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 
 DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(60) NOT NULL,
 `description` text NULL,
 `state_id` INT(10) UNSIGNED NOT NULL,
 `zip_code` VARCHAR(10) NULL,
  `city_number` VARCHAR(2) NULL,
 `number_sequence` INT(11) DEFAULT 0,
 `top_priority_delivery_in_percentage` DOUBLE DEFAULT 0,
  `priority_delivery_in_percentage` DOUBLE DEFAULT 0,
  `standard_delivery_in_percentage` DOUBLE DEFAULT 0,
  `minimum_top_priority_delivery_amount` DOUBLE DEFAULT 0,
  `minimum_priority_delivery_amount` DOUBLE DEFAULT 0,
  `minimum_standard_delivery_amount` DOUBLE DEFAULT 0,
  `estimated_number_of_days_for_top_priority_delivery` INT DEFAULT 0,
  `estimated_number_of_days_for_priority_delivery` INT DEFAULT 0,
  `estimated_number_of_days_for_standard_delivery` INT DEFAULT 0,
  `standard_delivery_price_per_kg` DOUBLE DEFAULT 0,
  `priority_delivery_price_per_kg` DOUBLE DEFAULT 0,
  `top_priority_delivery_price_per_kg` DOUBLE DEFAULT 0,
  `top_priority_discount_rate_for_mass_delivery` DOUBLE DEFAULT 0,
  `priority_discount_rate_for_mass_delivery` DOUBLE DEFAULT 0,
  `standard_discount_rate_for_mass_delivery` DOUBLE DEFAULT 0,
  `standard_minimum_mass_delivery_number` DOUBLE DEFAULT 0,
  `priority_minimum_mass_delivery_number` DOUBLE DEFAULT 0,
  `top_priority_minimum_mass_delivery_number` DOUBLE DEFAULT 0,
 `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `fk_state_city_idx` (`state_id`),
  KEY `create_time` (`create_time`),
 KEY `update_time` (`update_time`), 
 CONSTRAINT `fk_state_city_idx` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 DROP TABLE IF EXISTS `membershiptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershiptype` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(60) NOT NULL,
 `code` varchar(200) NOT NULL,
 `icon` VARCHAR(60) NULL,
  `icon_size` INT(20) DEFAULT 0,
`description` text NULL,
`create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `create_time` (`create_time`),
 KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
  
  DROP TABLE IF EXISTS `membership_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_fee` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `amount`  DOUBLE DEFAULT NULL,
 `amount_monthly`  DOUBLE DEFAULT NULL,
 `start_date` DATETIME DEFAULT NULL,
 `end_date` DATETIME DEFAULT NULL,
`create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `create_time` (`create_time`),
 KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 
 DROP TABLE IF EXISTS `membershiptype_has_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membershiptype_has_fees` (
 `membership_type_id` INT(10) UNSIGNED NOT NULL,
 `fee_id` INT(10) UNSIGNED NOT NULL,
 `yearly_fee_id` INT(10) UNSIGNED NOT NULL,
 `status` ENUM('inactive','active') NOT NULL,
 `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`membership_type_id`,`fee_id`),
  KEY `fk_fee_for_membershiptype_idx` (`fee_id`),
  KEY `fk_membershiptype_has_fee_idx` (`membership_type_id`),
  KEY `fk_yearly_fee_for_membershiptype_idx` (`yearly_fee_id`),
  CONSTRAINT `fk_fee_for_membershiptype_idx` FOREIGN KEY (`fee_id`) REFERENCES `membership_fee` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_yearly_fee_for_membershiptype_idx` FOREIGN KEY (`yearly_fee_id`) REFERENCES `membership_fee` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_membershiptype_has_fee_idx` FOREIGN KEY (`membership_type_id`) REFERENCES `membershiptype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
  
   DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(150) NOT NULL,
 `description` text NULL,
 `icon` VARCHAR(60) NULL,
 `image` VARCHAR(100) NULL,
 `icon_size` INT(20) DEFAULT 0,
 `image_size` INT(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
 `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(60) NOT NULL,
 `description` text NULL,
 `code` varchar(200) NOT NULL,
 `incrementer` INT(20) DEFAULT 0,
  `icon` VARCHAR(60) NULL,
  `icon_size` INT(20) DEFAULT 0,
 `container_id` INT(10) UNSIGNED NOT NULL,
 `is_available` BOOLEAN DEFAULT 0,
 `display_category_on_store` BOOLEAN DEFAULT 0,
 `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `fk_container_resource_type_idx` (`container_id`),
 KEY `create_time` (`create_time`),
 CONSTRAINT `fk_container_resource_type_idx` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 

 DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
   `description` text NULL,
    `service_id` INT(10) UNSIGNED NOT NULL,
	 `code` varchar(200) NOT NULL,
	  `is_available` BOOLEAN DEFAULT 0,
	  `display_types_on_store` BOOLEAN DEFAULT 0,
	  `is_faas` BOOLEAN DEFAULT 0,
   `icon` VARCHAR(100) DEFAULT NULL,
   `create_time` DATETIME DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `create_user_id` INT(10) DEFAULT NULL,
    `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_belongs_to_service_idx` (`service_id`),
  CONSTRAINT `fk_category_belongs_to_service_idx` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


 DROP TABLE IF EXISTS `measurement_symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_symbol` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
   `description` text NULL,
   `type` ENUM('weight', 'volume', 'length', 'height', 'unit','pieces','medicine') NULL,
   `create_time` DATETIME DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `create_user_id` INT(10) DEFAULT NULL,
    `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
   `category_id` INT(10) UNSIGNED NOT NULL,
   `description` text NULL,
   `code` varchar(200) NOT NULL,
   `vat_rate` DOUBLE DEFAULT 0.00,
   `sales_tax_rate` DOUBLE DEFAULT 0.00,
   `vat_rate_commencement_date` DATETIME DEFAULT NULL,
   `sales_tax_rate_commencement_date` DATETIME DEFAULT NULL,
    `is_available` BOOLEAN DEFAULT 0,
	`is_paas` BOOLEAN DEFAULT 0,
	 `is_faas` BOOLEAN DEFAULT 0,
	 `monthly_paas_subscription_cost` DOUBLE DEFAULT 0,
	 `minimum_quantity_for_paas_subscription` INT(10) DEFAULT 0,
	 `maximum_quantity_for_paas_subscription` INT(10) DEFAULT 0,
	 `minimum_paas_duration` INT(10) DEFAULT 0,
	 `maximum_paas_duration` INT(10) DEFAULT 0,
	 `icon` VARCHAR(100) DEFAULT NULL,
	 `icon_size` INT(20) DEFAULT 0,
   `create_time` DATETIME DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `create_user_id` INT(10) DEFAULT NULL,
    `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
   KEY `fk_producttpe_belongs_to_category_idx` (`category_id`),
  CONSTRAINT `fk_producttpe_belongs_to_category_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `product_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specification` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
   `description` text NULL,
   `code` varchar(200) NOT NULL,
   `create_time` DATETIME DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `create_user_id` INT(10) DEFAULT NULL,
    `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
   
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `producttype_has_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttype_has_specifications` (
  `product_type_id` INT(10) unsigned NOT NULL,
  `specification_id` INT(10) unsigned NOT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`, `specification_id`),
  KEY `fk_producttype_has_apecification_idx` (`product_type_id`),
  KEY `fk_specification_has_producttype_idx` (`specification_id`),
  CONSTRAINT `fk_producttype_has_apecification_idx` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_specification_has_producttype_idx` FOREIGN KEY (`specification_id`) REFERENCES `product_specification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
 
 
   DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE `product` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id` INT(10) UNSIGNED NOT NULL,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `product_type_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` text NULL,
  `condition` text DEFAULT NULL,
   `feature` VARCHAR(250) DEFAULT NULL,
   `feature_1` VARCHAR(250) DEFAULT NULL,
   `feature_2` VARCHAR(250) DEFAULT NULL,
   `feature_3` VARCHAR(250) DEFAULT NULL,
   `feature_4` VARCHAR(250) DEFAULT NULL,
   `specifications` text DEFAULT NULL,
  `icon` VARCHAR(100) DEFAULT NULL,
  `headline_image` VARCHAR(100) DEFAULT NULL,
  `product_front_view` VARCHAR(100) DEFAULT NULL,
   `product_right_side_view` VARCHAR(100) DEFAULT NULL,
   `product_top_view` VARCHAR(100) DEFAULT NULL,
   `product_inside_view` VARCHAR(100) DEFAULT NULL,
   `product_engine_view` VARCHAR(100) DEFAULT NULL,
   `product_back_view` VARCHAR(100) DEFAULT NULL,
   `product_left_side_view` VARCHAR(100) DEFAULT NULL,
   `product_bottom_view` VARCHAR(100) DEFAULT NULL,
   `product_dashboard_view` VARCHAR(100) DEFAULT NULL,
   `product_contents_or_booth_view` VARCHAR(100) DEFAULT NULL,
   `icon_size` INT(20) DEFAULT 0,
  `image_size` INT(20) DEFAULT 0,
  `product_front_view_size` INT(20) DEFAULT 0,
  `product_right_side_view_size` INT(20) DEFAULT 0,
  `product_top_view_size` DOUBLE DEFAULT NULL,
  `product_inside_view_size` DOUBLE DEFAULT NULL,
  `product_engine_view_size` DOUBLE DEFAULT NULL,
  `product_back_view_size` DOUBLE DEFAULT NULL,
  `product_left_side_view_size` DOUBLE DEFAULT NULL,
  `product_bottom_view_size` DOUBLE DEFAULT NULL,
  `product_dashboard_view_size` DOUBLE DEFAULT NULL,
  `product_contents_or_booth_view_size` DOUBLE DEFAULT NULL,
  `prevailing_retail_selling_price` DOUBLE DEFAULT NULL,
   `maximum_portion` INT(10) DEFAULT 1,
   `price_validity_period` VARCHAR(100) DEFAULT NULL,
  `per_portion_price` DOUBLE DEFAULT NULL,
  `discount_rate` DOUBLE DEFAULT NULL,
  `discounted_amount` DOUBLE DEFAULT NULL,
  `quantity` DOUBLE DEFAULT NULL,
  `displayable_on_store` BOOLEAN DEFAULT 0,
  `is_member_price_valid` BOOLEAN DEFAULT 0,
  `minimum_number_of_product_to_buy` INT(10) DEFAULT 0,
   `whats_in_a_park` text DEFAULT NULL,
   `whats_product_per_item` VARCHAR(100) NOT NULL,
   `brand` VARCHAR(200) NOT NULL,
   `maker` VARCHAR(200) NOT NULL,
   `origin` VARCHAR(200) NOT NULL,
   `start_price_validity_period` DATETIME DEFAULT NULL,
   `end_price_validity_period` DATETIME DEFAULT NULL,
   `is_quotable` BOOLEAN DEFAULT 0,
   `is_available` BOOLEAN DEFAULT 0,
   `is_escrowable` BOOLEAN DEFAULT 0,
   `is_future_tradable` BOOLEAN DEFAULT 0,
   `is_custom_product` BOOLEAN DEFAULT 0,
   `is_a_hamper` BOOLEAN DEFAULT 0,
   `is_payment_permitted_on_delivery` BOOLEAN DEFAULT 0,
   `hamper_cost_limit` DOUBLE DEFAULT 0,
   `is_with_video` BOOLEAN DEFAULT 0,
   `video_for` ENUM('general','installation','description','consumption','testimonial','operational','live','informational','pitch','instructional','training','demonstration','coupling','decoupling','coupling_decoupling') DEFAULT NULL,
    `video_filename` VARCHAR(200) DEFAULT NULL,
	`video_size` DOUBLE DEFAULT 0,
   `code` varchar(200) NOT NULL,
   `weight` DOUBLE DEFAULT 0,
	`is_rentable` BOOLEAN DEFAULT 0,
	`is_paas` BOOLEAN DEFAULT 0,
	`is_optionable` BOOLEAN DEFAULT 0,
	`allowed_for_international_market` BOOLEAN DEFAULT 0,
	`allowed_for_inspection` BOOLEAN DEFAULT 0,
	`discount_for_public_institutions` DOUBLE DEFAULT 0,
	`discount_for_students` DOUBLE DEFAULT 0,
	`discount_for_academia` DOUBLE DEFAULT 0,
	`discount_for_officers` DOUBLE DEFAULT 0,
	`regulatory_compliance` VARCHAR(250) DEFAULT NULL,
	`has_free_shipping_promotion` BOOLEAN DEFAULT 0,
	`has_give_away_promotion` BOOLEAN DEFAULT 0,
	`has_percentage_off_promotion` BOOLEAN DEFAULT 0,
	`has_buy_one_get_one_promotion` BOOLEAN DEFAULT 0,
	`rent_cost_per_day` DOUBLE DEFAULT 0,
	`maximum_rent_quantity_per_cycle` INT(10) DEFAULT 0,
	`minimum_rent_duration` INT(10) DEFAULT 0,
	`maximum_rent_duration` INT(10) DEFAULT 0,
	`minimum_rent_quantity_per_cycle` INT(10) DEFAULT 0,
	`hamper_container_id` INT(10) DEFAULT 0,
   `is_the_middle_page_advert` BOOLEAN DEFAULT 0,
   `is_faas` BOOLEAN DEFAULT 0,
    `faas_stage` ENUM('seeding','on','one','oner','onero','oneroo','oneroof','harvest') DEFAULT NULL,
	`faas_months_to_harvest` INT(10) DEFAULT 0,
	`faas_months_from_seedling` INT(10) DEFAULT 0,
	`faas_current_stage_to_harvest_position` INT(10) DEFAULT 0,
	`faas_maximum_number_of_stages_to_harvest` INT(10) DEFAULT 0,
	`faas_maximum_number_of_months_to_harvest` INT(10) DEFAULT 0,
	`faas_next_stage` VARCHAR(50) NOT NULL,
	`faas_number_of_months_to_next_stage` INT(10) DEFAULT 0,
	`is_faas_insured` BOOLEAN DEFAULT 0,
	`faas_total_insurance_value` DOUBLE DEFAULT NULL,
	`is_faas_tradable` BOOLEAN DEFAULT 0,
	`faas_expected_total_produce` DOUBLE DEFAULT 0,
	`faas_must_be_held_to_maturity` BOOLEAN DEFAULT 0,
	`faas_region` VARCHAR(50) NOT NULL,
	`faas_stage_activities` VARCHAR(250) DEFAULT NULL,
	`faas_insurance_coverage` VARCHAR(250) DEFAULT NULL,
	`faas_insurance_institution` VARCHAR(250) DEFAULT NULL,
	`maximum_faas_duration` INT(10) DEFAULT 0,
	`minimum_faas_duration` INT(10) DEFAULT 0,
	`minimum_quantity_for_faas_subscription` INT(10) DEFAULT 0,
	`maximum_quantity_for_faas_subscription` INT(10) DEFAULT 0,
	`cumulative_quantity` DOUBLE DEFAULT NULL,
	`date_current_stage_started` DATETIME DEFAULT NULL,
	`faas_month_season_started` ENUM('january','february','march','april','may','june','july','august','september','october','november','december') DEFAULT NULL,
	`faas_year_season_started` ENUM('2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027') DEFAULT NULL,
	`has_warranty` BOOLEAN DEFAULT 0,
	`months_of_warranty` INT(10) DEFAULT 0,
	`has_son_certification` BOOLEAN DEFAULT 0,
	`has_nafdac_certification` BOOLEAN DEFAULT 0,
	`other_certifications` VARCHAR(50) DEFAULT NULL,
	`nature_of_product` ENUM('general','book','clothes','graphics','video','sound','shoes','commodity','faas') DEFAULT NULL,
	`clothes_measurement_unit` ENUM('centimeter','meter','inches','yards') DEFAULT NULL,
	`clothes_type` ENUM('baby_grow','ball_gown ','belt','bikini','blazer','blouse','bow_tie','boxers','bra','bra_and_knicker_set','briefs','camisole','cardigan','cargos','catsuit','chemise','coat','corset','cravat','cufflinks','cummerbund','dinner_jacket','dress','dressing_gown','dungarees','fleece','gloves','hair_accessory','hat','hoody','jacket','jeans','jogging_suit','jumper','kaftan','kilt','knickers','kurta','lingerie','nightgown','nightwear','overalls','pashmina','polo_shirt','poncho','pyjamas','robe','romper','sarong','scarf','shawl','shellsuit','shirt','shorts','skirt','socks','stockings','suit','sweatshirt','swimming_costume','swimming_shorts','swimming_trunks','swimwear','t_shirt','tailcoat','tankini','thong','tie','tights','top','tracksuit','trousers','underwear','vest','vest_underwear','waistcoat','waterproof','zip') DEFAULT NULL,
	`clothes_material` VARCHAR(200) DEFAULT NULL,
	`clothes_colour` VARCHAR(200) DEFAULT NULL,
	`clothes_neck_size` DOUBLE DEFAULT NULL,
	`clothes_hand_wrist_size` DOUBLE DEFAULT NULL,
	`clothes_hand_length` DOUBLE DEFAULT NULL,
	`clothes_stomach_size` DOUBLE DEFAULT NULL,
	`clothes_shoulder_size` DOUBLE DEFAULT NULL,
	`clothes_body_length` VARCHAR(200) DEFAULT NULL,
	`clothes_back_body_length` VARCHAR(200) DEFAULT NULL,
	`clothes_chest_size` VARCHAR(200) DEFAULT NULL,
	`clothes_back_body_length_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_chest_length_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_material_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_neck_size_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_hand_wrist_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_hand_length_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_stomach_size_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_shoulder_size_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_colour_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_body_length_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_hand_length_type` ENUM('short_sleeve','long_sleeve','sleeveless') DEFAULT NULL,
	`clothes_dimension_label` ENUM('small','medium','large','extra_large','extra_extra_large','biggy') DEFAULT NULL,
	`clothes_dimension_label_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_trouser_length` DOUBLE DEFAULT NULL,
	`clothes_waist_size` DOUBLE DEFAULT NULL,
	`clothes_thigh_size` DOUBLE DEFAULT NULL,
	`clothes_ankle_size` DOUBLE DEFAULT NULL,
	`clothes_trouser_length_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_trouser_size_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_ankle_size_variation` VARCHAR(200) DEFAULT NULL,
	`clothes_is_designed_for` ENUM('male','female','unisex') DEFAULT NULL,
	`clothes_target_demography` ENUM('adults','teens','preteens','babies') DEFAULT NULL,
	`clothes_baby_age_range` VARCHAR(200) DEFAULT NULL,
	`shoes_measurement_unit` ENUM('centimeter','meter','inches','yards') DEFAULT NULL,
	`shoe_men_type` ENUM('oxfords','slip_ons','saddle_shoes','boat_shoes','leather_laced_heavy_sole_shoes','canvas_shoes','loafers','sandals','athletic_shoes','work_boots','hiking_boots','western_boots','dress_boots','safety_boots','slippers','trainers','snickers') DEFAULT NULL,
	`shoe_female_type` ENUM('oxfords','pumps','stilettos','kitten_heels','ankle_booties','ankle_strap_heels','wedges','cone_heels','athletic_shoes','gladiator_sandals','gladiator_boots','sling_back_heels','ballerina_flats','open_toe_sandals','peep_toe_heels','cork_high_heels','platform','spool_heels','mary_janes','scarpin','espadrille_heels','mules','thigh_high_boots','loafer','canvas','fantasy','slippers','trainers','snickers') DEFAULT NULL,
	`shoe_colour` VARCHAR(200) DEFAULT NULL,
	`shoe_size` INT(10) DEFAULT 0,
	`shoe_colour_variation` VARCHAR(200) DEFAULT NULL,
	`shoe_size_variation` VARCHAR(200) DEFAULT NULL,
	`shoe_material` VARCHAR(200) DEFAULT NULL,
	`shoe_weight_variation` VARCHAR(200) DEFAULT NULL,
	`shoe_material_variation` VARCHAR(200) DEFAULT NULL,
	`shoe_sole_material` VARCHAR(200) DEFAULT NULL,
	`shoe_sole_material_variation` VARCHAR(200) DEFAULT NULL,
	`shoe_is_designed_for` ENUM('male','female','unisex') DEFAULT NULL,
	`shoe_target_demography` ENUM('adults','teens','preteens','babies') DEFAULT NULL,
	`baby_shoes_age_range` VARCHAR(200) DEFAULT NULL,
	`suit_size` INT(10) DEFAULT 0,
	`suit_colour` VARCHAR(200) DEFAULT NULL,
	`suit_colour_variation` VARCHAR(200) DEFAULT NULL,
	`suit_size_variation` VARCHAR(200) DEFAULT NULL,
	`image_dimension_width` DOUBLE DEFAULT 0,
	`image_dimension_height` DOUBLE DEFAULT 0,
	`image_dimension_capacity_in_mb` DOUBLE DEFAULT 0,
	`image_dimension_variation` VARCHAR(200) DEFAULT NULL,
	`image_measurement_unit` ENUM('millimeters','centimeters','inches','picas','pixels','points') DEFAULT NULL,
	`image_measurement_unit_symbol` ENUM('mm','cm','in','pi','px','pt') DEFAULT NULL,
	`image_format` ENUM('jpeg','jpg','png','gif') DEFAULT NULL,
	`image_resolution` INT(10) DEFAULT 0,
	`image_resolution_unit` ENUM('pixels/inch','pixels/cm') DEFAULT NULL,
	`image_resolution_variation` VARCHAR(200) DEFAULT NULL,
	`image_file_for_download` VARCHAR(200) DEFAULT NULL,
	`footage_format` ENUM('mp4','avi','wmv','flv','mov') DEFAULT NULL,
	`footage_production_type` ENUM('recorded_video','after_effects','animation') DEFAULT NULL,
	`footage_quality_type` ENUM('8k','4k','qhd','fhd','hd','sd','low') DEFAULT NULL,
	`footage_scan_type` ENUM('progressive','interlaced') DEFAULT NULL,
	`footage_scan_type_unit` ENUM('p','i') DEFAULT NULL,
	`footage_dimension_width` DOUBLE DEFAULT 0,
	`footage_dimension_height` DOUBLE DEFAULT 0,
	`footage_resolution` INT(10) DEFAULT 0,
	`footage_aspect_ratio` VARCHAR(200) DEFAULT NULL,
	`footage_clip_length`  DOUBLE DEFAULT 0,
	`footage_size`  DOUBLE DEFAULT 0,
	`footage_frame_rate`  DOUBLE DEFAULT 0,
	`footage_quality_type_variation` VARCHAR(200) DEFAULT NULL,
	`footage_aspect_ratio_variation` VARCHAR(200) DEFAULT NULL,
	`footage_resolution_variation` VARCHAR(200) DEFAULT NULL,
	`footage_dimension_capacity_in_mb` DOUBLE DEFAULT 0,
	`footage_file` VARCHAR(200) DEFAULT NULL,
	`sound_format` ENUM('mp3','aac','3gp','aiff','gsm','wma','webm') DEFAULT NULL,
	`sound_production_type` ENUM('recorded_sound','after_effects_sound') DEFAULT NULL,
	`sound_file` VARCHAR(200) DEFAULT NULL,
	`sound_clip_length`  DOUBLE DEFAULT 0,
	`sound_size`  DOUBLE DEFAULT 0,
	`sound_format_variation` VARCHAR(200) DEFAULT NULL,
	`book_authors` VARCHAR(200) DEFAULT NULL,
	`book_edition` VARCHAR(200) DEFAULT NULL,
	`book_isbn` VARCHAR(200) DEFAULT NULL,
	`book_total_page` INT(10) DEFAULT 0,
	`book_year_of_print` INT(10) DEFAULT 0,
	`book_format` ENUM('hardcopy','papercopy','softcopy','mobile') DEFAULT NULL,
	`book_print_quality` ENUM('black_and_white_but_poor_quality','black_and_white_but_fine_quality','coloured_but_poor_quality','coloured_but_fine_quality') DEFAULT NULL,
	`book_target_demography` ENUM('students','teachers','professionals','researchers','all') DEFAULT NULL,
	`book_other_secondary_targets` VARCHAR(200) DEFAULT NULL,
	`book_writing_style` ENUM('academics','self_study','hands_on','informational','exploratory','motivational','persuasive','advisorial','editorial') DEFAULT NULL,
	`book_type` ENUM('book','academic_thesis','market_research','business_research','scientific_research','environmental_assessment_report','legal_opinion','trade_and_investment_advice','security_assessment_report','financial_impact_assessment','business_financing','business_plan') DEFAULT NULL,
	`book_number_of_chapters` INT(10) DEFAULT 0,
	`book_format_variation` VARCHAR(200) DEFAULT NULL,
	`book_edition_variation` VARCHAR(200) DEFAULT NULL,
	`book_softcopy_file` VARCHAR(200) DEFAULT NULL,
	`book_softcopy_file_size` VARCHAR(200) DEFAULT NULL,
	`book_preview_file` VARCHAR(200) DEFAULT NULL,
	`book_preview_file_size` VARCHAR(200) DEFAULT NULL,
	`product_variation_id` INT(10) DEFAULT 0,
	`create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `fk_services_for_products_idx` (`service_id`),
  KEY `fk_category_category_products_idx` (`category_id`),
  KEY `fk_product_type_type_idx` (`product_type_id`),
  KEY `fk_product_has_code_idx` (`code`),
  CONSTRAINT `fk_services_for_products_idx` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_type_type_idx` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_for_products_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 

 
   DROP TABLE IF EXISTS `product_constituents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE `product_constituents` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` text NULL,
   `condition` text DEFAULT NULL,
   `feature` text DEFAULT NULL,
   `specifications` text DEFAULT NULL,
  `icon` VARCHAR(100) DEFAULT NULL,
  `headline_image` VARCHAR(100) DEFAULT NULL,
   `product_front_view` VARCHAR(100) DEFAULT NULL,
   `product_right_side_view` VARCHAR(100) DEFAULT NULL,
   `product_top_view` VARCHAR(100) DEFAULT NULL,
   `product_inside_view` VARCHAR(100) DEFAULT NULL,
   `product_engine_view` VARCHAR(100) DEFAULT NULL,
   `product_back_view` VARCHAR(100) DEFAULT NULL,
   `product_left_side_view` VARCHAR(100) DEFAULT NULL,
   `product_bottom_view` VARCHAR(100) DEFAULT NULL,
   `product_dashboard_view` VARCHAR(100) DEFAULT NULL,
   `product_contents_or_booth_view` VARCHAR(100) DEFAULT NULL,
  `icon_size` INT(20) DEFAULT 0,
  `image_size` INT(20) DEFAULT 0,
   `product_front_view_size` INT(20) DEFAULT 0,
  `product_right_side_view_size` INT(20) DEFAULT 0,
  `product_top_view_size` INT(20) DEFAULT 0,
  `product_inside_view_size` INT(20) DEFAULT 0,
  `product_engine_view_size`INT(20) DEFAULT 0,
  `product_back_view_size` INT(20) DEFAULT 0,
  `product_left_side_view_size`INT(20) DEFAULT 0,
  `product_bottom_view_size` INT(20) DEFAULT 0,
  `product_dashboard_view_size` INT(20) DEFAULT 0,
  `product_contents_or_booth_view_size` INT(20) DEFAULT 0,
  `prevailing_retail_selling_price` DOUBLE DEFAULT NULL,
   `maximum_portion` INT(10) DEFAULT 1,
   `per_portion_price` DOUBLE DEFAULT NULL,
  `discount_rate` DOUBLE DEFAULT NULL,
  `discounted_amount` DOUBLE DEFAULT NULL,
  `displayable_on_store` BOOLEAN DEFAULT 0,
  `quantity` DOUBLE DEFAULT NULL,
   `minimum_number_of_product_to_buy` INT(10) DEFAULT 0,
   `whats_in_a_park` text DEFAULT NULL,
   `whats_product_per_item` VARCHAR(100) NOT NULL,
   `price_validity_period` VARCHAR(100) DEFAULT NULL,
    `brand` VARCHAR(200) NULL,
   `maker` VARCHAR(200) NULL,
   `origin` VARCHAR(200) NULL,
   `start_price_validity_period` DATETIME DEFAULT NULL,
   `end_price_validity_period` DATETIME DEFAULT NULL,
   `quantity_of_product_in_the_pack` DOUBLE DEFAULT NULL,
   `weight` DOUBLE DEFAULT 0,
  `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `fk_constituents_for_products_idx` (`product_id`),
    CONSTRAINT `fk_constituents_for_products_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 
 
 DROP TABLE IF EXISTS `product_has_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_specifications` (
  `product_id` INT(10) unsigned NOT NULL,
  `specification_id` INT(10) unsigned NOT NULL,
   `specification_value` VARCHAR(250) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`, `specification_id`),
  KEY `fk_product_has_apecification_idx` (`product_id`),
  KEY `fk_specification_has_product_idx` (`specification_id`),
  CONSTRAINT `fk_product_has_apecification_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_specification_has_product_idx` FOREIGN KEY (`specification_id`) REFERENCES `product_specification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


 DROP TABLE IF EXISTS `constituent_has_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constituent_has_specifications` (
  `constituent_id` INT(10) unsigned NOT NULL,
  `specification_id` INT(10) unsigned NOT NULL,
   `specification_value` VARCHAR(250) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`constituent_id`, `specification_id`),
  KEY `fk_constituent_has_apecification_idx` (`constituent_id`),
  KEY `fk_specification_has_constituent_idx` (`specification_id`),
  CONSTRAINT `fk_constituent_has_apecification_idx` FOREIGN KEY (`constituent_id`) REFERENCES `product_constituents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_specification_has_constituent_idx` FOREIGN KEY (`specification_id`) REFERENCES `product_specification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
 
 
  
  
  
  DROP TABLE IF EXISTS `authitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
  
  
  
  DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
 CREATE TABLE `members` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `picture` VARCHAR(60) DEFAULT NULL,
  `picture_size` INT(20) DEFAULT 0,
   `address1` VARCHAR(100) DEFAULT NULL,
   `address2` VARCHAR(100) DEFAULT NULL,
   `city_id` INT(10) DEFAULT 0,
   `state_id` INT(10) DEFAULT 0,
   `country_id` INT(10) DEFAULT 0,
   `usertype` ENUM('staff', 'others') NOT NULL,
   `accounttype` ENUM('consumer', 'merchant') NOT NULL,
   `membership_number` VARCHAR(20) NULL,
   `delivery_address1` VARCHAR(100) DEFAULT NULL,
   `delivery_address2` VARCHAR(100) DEFAULT NULL,
   `delivery_city_id` INT(10) UNSIGNED DEFAULT NULL,
   `delivery_state_id` INT(10) UNSIGNED DEFAULT NULL,
   `delivery_country_id` INT(10) UNSIGNED DEFAULT NULL,
   `status` ENUM('inactive', 'active','suspended') NOT NULL,
   `category` ENUM('individual', 'corporate') NOT NULL,
  `name_of_organization` VARCHAR(200) NULL,
  `unique_registration_number` VARCHAR(100) NULL,
  `business_category` ENUM('telecommunication', 'banking & finance','insurance','agriculture','government','education','health','oil & gas','manufacturing','information & communication technology','software','services','consultancy','retail','humanities','pharmaceutical','sports','media','entertainment','others') NULL,
  `corporate_address1` VARCHAR(100) DEFAULT NULL,
   `corporate_address2` VARCHAR(100) DEFAULT NULL,
   `corporate_city_id` INT(10) UNSIGNED DEFAULT NULL,
   `corporate_state_id` INT(10) UNSIGNED DEFAULT NULL,
   `corporate_country_id` INT(10) UNSIGNED DEFAULT NULL,
   `landline` VARCHAR(100) NULL,
   `mobile_line` VARCHAR(100) NULL,
  `firstname` VARCHAR(60) NULL,
  `middlename` VARCHAR(60) NULL,
  `lastname` VARCHAR(100) NULL,
  `name` VARCHAR(250) NOT NULL,
  `dateofbirth` DATETIME NULL,
  `religion` ENUM('christianity', 'islam', 'hinduism', 'buddhism','traditional','none','others') NULL,
  `gender` ENUM('male', 'female') NULL,
  `maritalstatus` ENUM('married', 'divorced', 'spinster', 'bachelor', 'widowed','others') NULL,
  `role` VARCHAR(64) NOT NULL,
   `can_recieve_connections` BOOLEAN DEFAULT 0,
  `account_number` VARCHAR(100) DEFAULT NULL,
  `account_title` VARCHAR(100) DEFAULT NULL,
  `member_bank` VARCHAR(100) DEFAULT NULL,
  `activated_time` DATETIME DEFAULT NULL,
  `deactivated_time` DATETIME DEFAULT NULL,
  `suspended_time` DATETIME DEFAULT NULL,
   `activated_by` INT(10) DEFAULT NULL,
   `deactivated_by` INT(10) DEFAULT NULL,
  `suspended_by` INT(10) DEFAULT NULL,
  `create_time` DATETIME DEFAULT NULL,
 `create_user_id` INT(10) DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `create_time` (`create_time`),	
  KEY `fk_city_user_idx` (`city_id`),
  KEY `fk_userrole_authitem_idx` (`role`),
 KEY `fk_state_user_idx` (`state_id`), 
 KEY `fk_country_for_this_member_idx` (`country_id`),
 /*CONSTRAINT `fk_city_user_idx` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,*/
/*  CONSTRAINT `fk_state_user_idx` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,*/
  /*CONSTRAINT `fk_country_for_this_member_idx` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,*/
  CONSTRAINT `fk_userrole_authitem_idx` FOREIGN KEY (`role`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 /*!40101 SET character_set_client = @saved_cs_client */;
 
 

DROP TABLE IF EXISTS `authitemchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `authassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_assignment_userid` FOREIGN KEY (`userid`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `member_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_login` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `login_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_member_login_idx` (`member_id`),
  CONSTRAINT `fk_member_member_login_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `membership_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_subscription` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `membership_type_id` int(10) unsigned NOT NULL,
  `membership_start_date`  DATETIME DEFAULT NULL,
  `membership_end_date` DATETIME DEFAULT NULL,
  `status` ENUM('inactive','active','suspended') NOT NULL,
  `subscription_type` ENUM('monthly','yearly') NOT NULL,
  `number_of_years` INT(10) DEFAULT 1,
  `number_of_months` INT(10) DEFAULT 1,
  `expecting_payment` BOOLEAN DEFAULT 0,
  `is_term_acceptable` BOOLEAN DEFAULT 0,
  `date_activated` DATETIME DEFAULT NULL,
  `date_deactivated` DATETIME DEFAULT NULL,
  `date_suspended` DATETIME DEFAULT NULL,
  `date_extended` DATETIME DEFAULT NULL,
   `date_renewed` DATETIME DEFAULT NULL,
  `activated_by_id` INT(10) DEFAULT NULL,
  `deactivated_by_id` INT(10) DEFAULT NULL,
  `suspended_by_id` INT(10) DEFAULT NULL,
  `extended_by_id` INT(10) DEFAULT NULL,
   `renewed_by_id` INT(10) DEFAULT NULL,
  `subscription_initiation_date` DATETIME DEFAULT NULL,
  `subscription_initiated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_member_type_idx` (`member_id`),
  KEY `fk_type_type_member_idx` (`membership_type_id`),
  CONSTRAINT `fk_member_member_type_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_type_member_idx` FOREIGN KEY (`membership_type_id`) REFERENCES `membershiptype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(200) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `currency_symbol` varchar(5) DEFAULT NULL,
  `description` text NULL,
  `country_id` int(10) unsigned NOT NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_has_currencies_currencies_idx` (`country_id`),
  CONSTRAINT `fk_country_has_currencies_currencies_idx` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `timezone` varchar(200) DEFAULT NULL,
  `offset` DOUBLE DEFAULT NULL,
  `description` text NULL,
  `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `platform_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_settings` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform_default_currency_id` INT(10) UNSIGNED NOT NULL,
  `platform_default_time_zone_id` INT(10) UNSIGNED NOT NULL,
  `managemenr_fee_in_percetanges` DOUBLE DEFAULT NULL,
  `handling_charges_in_percetanges` DOUBLE DEFAULT NULL,
  `shipping_charges_in_percetanges` DOUBLE DEFAULT NULL,
  `discount_rate` DOUBLE DEFAULT NULL,
  `monthly_discount_rate` DOUBLE DEFAULT 0,
  `include_management_fees` BOOLEAN DEFAULT 0,
  `include_handling_charges` BOOLEAN DEFAULT 0,
  `include_shipping_charges` BOOLEAN DEFAULT 0,
  `effect_discount_for_subscription` BOOLEAN DEFAULT 0,
  `min_years_required_for_discount` int(10) NULL,
  `min_months_required_for_discount` int(10) default 0,
  `unique_number_differentiator` int(10) DEFAULT 0,
  `top_priority_delivery_in_percentage` DOUBLE DEFAULT 0,
  `priority_delivery_in_percentage` DOUBLE DEFAULT 0,
  `standard_delivery_in_percentage` DOUBLE DEFAULT 0,
  `minimum_top_priority_delivery_amount` DOUBLE DEFAULT 0,
  `minimum_priority_delivery_amount` DOUBLE DEFAULT 0,
  `minimum_standard_delivery_amount` DOUBLE DEFAULT 0,
  `escrow_minimum_amount` DOUBLE DEFAULT 0,
  `escrow_rate_in_percentages` DOUBLE DEFAULT 0,
  `business_subscription_daily_quotation_limit` DOUBLE DEFAULT 0,
  `business_prime_subscription_daily_quotation_limit` DOUBLE DEFAULT 0,
  `basic_prime_subscription_daily_quotation_limit` DOUBLE DEFAULT 0,
  `business_subscription_monthly_quotation_limit` DOUBLE DEFAULT 0,
  `business_prime_subscription_monthly_quotation_limit` DOUBLE DEFAULT 0,
  `basic_prime_subscription_monthly_quotation_limit` DOUBLE DEFAULT 0,
  `product_maximum_video_size` DOUBLE DEFAULT 0,
  `maximum_allowable_cash_transaction` DOUBLE DEFAULT 0,
  `product_code_pad_length` INT(10) DEFAULT 0,
  `icon_height` int(10) NOT NULL,
  `icon_width` int(10) NOT NULL,
  `icon_mime_type` SET('image/png','image/jpg','image/jpeg','image/gif','application/x-shockwave-flash','image/psd','image/bmp','image/tiff','application/octet-stream','image/jp2','image/vnd.wap.wbmp','image/xbm','image/vnd.microsoft.icon'),
  `poster_height` int(10) NOT NULL,
  `poster_width` int(10) NOT NULL,
  `poster_mime_type` SET('image/png','image/jpg','image/jpeg','image/gif','application/x-shockwave-flash','image/psd','image/bmp','image/tiff','application/octet-stream','image/jp2','image/vnd.wap.wbmp','image/xbm','image/vnd.microsoft.icon'),
   `create_time` DATETIME DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `create_user_id` INT(10) DEFAULT NULL,
    `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_platform_currency_currency_idx` (`platform_default_currency_id`),
  KEY `fk_platform_timezone_timezone_idx` (`platform_default_time_zone_id`),
  CONSTRAINT `fk_platform_currency_currency_idx` FOREIGN KEY (`platform_default_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
   CONSTRAINT `fk_platform_timezone_timezone_idx` FOREIGN KEY (`platform_default_time_zone_id`) REFERENCES `timezones` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` int(10) unsigned NOT NULL,
  `description` text NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL,
  `description` text NULL,
  `default_store` BOOLEAN DEFAULT 0,
  `country_id` INT(10) UNSIGNED NOT NULL,
  `language_id` INT(10) UNSIGNED NOT NULL,
  `timezone_id` int(10) unsigned NOT NULL,
   `type` ENUM('public','private','partner_inline','network_inline') NOT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_store_store_idx` (`country_id`),
   KEY `fk_language_for_store_store_idx` (`language_id`),
  KEY `fk_timezone_store_store_idx` (`timezone_id`),
  KEY `fk_store_currency_currency_idx` (`currency_id`),
  CONSTRAINT `fk_country_store_store_idx` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_language_for_store_store_idx` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_timezone_store_store_idx` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
   CONSTRAINT `fk_store_currency_currency_idx` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) DEFAULT NULL,
  `status` ENUM('open','closed') NOT NULL,
  `type` ENUM('custom','platform') NOT NULL,
  `is_term_acceptable` BOOLEAN DEFAULT 0,
   `delivery_address1` VARCHAR(100) DEFAULT NULL,
   `delivery_address2` VARCHAR(100) DEFAULT NULL,
   `delivery_city_id` INT(10) UNSIGNED DEFAULT NULL,
   `delivery_state_id` INT(10) UNSIGNED DEFAULT NULL,
   `delivery_country_id` INT(10) UNSIGNED DEFAULT NULL,
   `delivery_mobile_number` VARCHAR(100) DEFAULT NULL,
   `address_landmark` VARCHAR(100) DEFAULT NULL,
   `nearest_bus_stop` VARCHAR(100) DEFAULT NULL,
   `person_in_care_of` VARCHAR(200) DEFAULT NULL,
  `order_initiation_date` DATETIME DEFAULT NULL,
  `last_updated_date` DATETIME DEFAULT NULL,
  `order_initiated_by` INT(10) DEFAULT NULL,
  `order_updated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `order_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_has_products` (
  `order_id` INT(10) unsigned NOT NULL,
  `product_id` INT(10) unsigned NOT NULL,
  `number_of_portion` INT(10) DEFAULT 0,
  `amount_saved_per_item_on_this_order` DOUBLE DEFAULT NULL,
  `prevailing_retail_selling_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `cobuy_member_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `start_price_validity_period` DATETIME DEFAULT NULL,
  `end_price_validity_period` DATETIME DEFAULT NULL,
  `is_escrow_only` BOOLEAN DEFAULT 0,
  `is_escrow_accepted` BOOLEAN DEFAULT 0,
  `is_hamper` BOOLEAN DEFAULT 0,
   `is_quote_only` BOOLEAN DEFAULT 0,
  `is_quote_and_escrow_only` BOOLEAN DEFAULT 0,
   `is_presubscription` BOOLEAN DEFAULT 0,
   `is_presubscription_and_escrow` BOOLEAN DEFAULT 0,
   `is_presubscription_drawdown` BOOLEAN DEFAULT 0,
   `is_postsubscription` BOOLEAN DEFAULT 0,
   `is_postsubscription_and_escrow` BOOLEAN DEFAULT 0,
    `is_presubscription_topup` BOOLEAN DEFAULT 0,
   `is_mainstore` BOOLEAN DEFAULT 0,
   `quote_id` INT(10) DEFAULT 0,
   `escrow_id` INT(10) DEFAULT 0,
   `hamper_terms_and_condition` BOOLEAN DEFAULT 0,
    `month_of_delivery` VARCHAR(100) DEFAULT NULL,
   `year_of_delivery` VARCHAR(100) DEFAULT NULL,
   `payment_frequency` VARCHAR(100) DEFAULT NULL,
   `future_trading` BOOLEAN DEFAULT 0,
   `decision` ENUM('buy','rent','paas') NOT NULL,
   `rent_cost_per_day` DOUBLE DEFAULT 0,
	`maximum_rent_quantity_per_cycle` INT(10) DEFAULT 0,
	`minimum_rent_duration` INT(10) DEFAULT 0,
	`minimum_rent_quantity_per_cycle` INT(10) DEFAULT 0,
	`actual_rent_duration` INT(10) DEFAULT 0,
	`actual_rent_quantity` INT(10) DEFAULT 0,
	 `monthly_paas_subscription_cost` DOUBLE DEFAULT 0,
	 `minimum_quantity_for_paas_subscription` INT(10) DEFAULT 0,
	 `maximum_quantity_for_paas_subscription` INT(10) DEFAULT 0,
	 `minimum_paas_duration` INT(10) DEFAULT 0,
	 `maximum_paas_duration` INT(10) DEFAULT 0,
	 `actual_paas_duration` INT(10) DEFAULT 0,
	 `paas_product_quantity` INT(10) DEFAULT 0,
	  `monthly_faas_subscription_cost` DOUBLE DEFAULT 0,
	  `minimum_quantity_for_faas_subscription` INT(10) DEFAULT 0,
	 `maximum_quantity_for_faas_subscription` INT(10) DEFAULT 0,
	 `minimum_faas_duration` INT(10) DEFAULT 0,
	 `maximum_faas_duration` INT(10) DEFAULT 0,
	 `actual_faas_duration` INT(10) DEFAULT 0,
	 `faas_product_quantity` INT(10) DEFAULT 0,
   `initial_payment_rate` DOUBLE DEFAULT 0,
  `date_ordered` DATETIME DEFAULT NULL,
  `date_last_update` DATETIME DEFAULT NULL,
  `ordered_by` INT(10) DEFAULT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  KEY `fk_product_has_order_idx` (`product_id`),
  KEY `fk_order_has_product_idx` (`order_id`),
  CONSTRAINT `fk_order_has_product_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `order_has_constituents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_has_constituents` (
  `order_id` INT(10) unsigned NOT NULL,
  `constituent_id` INT(10) unsigned NOT NULL,
  `number_of_portion` INT(10) DEFAULT 0,
  `amount_saved_per_item_on_this_order` DOUBLE DEFAULT NULL,
  `prevailing_retail_selling_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `cobuy_member_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `start_price_validity_period` DATETIME DEFAULT NULL,
  `end_price_validity_period` DATETIME DEFAULT NULL,
  `date_ordered` DATETIME DEFAULT NULL,
  `date_last_update` DATETIME DEFAULT NULL,
  `ordered_by` INT(10) DEFAULT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`, `constituent_id`),
  KEY `fk_constituent_has_order_idx` (`constituent_id`),
  KEY `fk_order_has_constituent_idx` (`order_id`),
  CONSTRAINT `fk_order_has_constituent_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_constituent_has_order_idx` FOREIGN KEY (`constituent_id`) REFERENCES `product_constituents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `member_amended_constituents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_amended_constituents` (
  `member_id`  INT(10) UNSIGNED NOT NULL,
  `constituent_id` int(10) unsigned NOT NULL,
  `selected_quantity` int(10) NOT NULL,
  `prevailing_retail_selling_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `cobuy_member_price_per_item_at_purchase` DOUBLE DEFAULT NULL,
  `start_price_validity_period` DATETIME DEFAULT NULL,
  `end_price_validity_period` DATETIME DEFAULT NULL,
  PRIMARY KEY (`member_id`,`constituent_id`),
  KEY `fk_member_amended_constituent_idx` (`member_id`),
   KEY `fk_constituent_amended_by_member_idx` (`constituent_id`),
 	CONSTRAINT `fk_member_amended_constituent_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `fk_constituent_amended_by_member_idx` FOREIGN KEY (`constituent_id`) REFERENCES `product_constituents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `banker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banker` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(200) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `swift_code` varchar(30) DEFAULT NULL,
  `sort_code` varchar(30) DEFAULT NULL,
   `type` ENUM ('savings','current', 'domiciliary','hybrid'),
   `default_bank` INT DEFAULT 0,
   `account_name` varchar(200) DEFAULT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `subscription_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_payment` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('pending','unconfirmed','confirmed','failed') NOT NULL,
  `payment_mode` ENUM('wallet','online') DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `bank_account_id`  INT(10) DEFAULT 0, 
  `remark` varchar(200) DEFAULT NULL,
  `reason_for_failure` text DEFAULT NULL,
  `amount`  DOUBLE NOT NULL,
  `net_amount`  DOUBLE NOT NULL,
  `discounted_amount`  DOUBLE DEFAULT 0,
  `payment_date` DATETIME DEFAULT NULL,
  `paid_by_id` int(10) unsigned NOT NULL,
  `membership_type_id` int(10) unsigned NOT NULL,
  `payment_confirmed_by` int(10) NULL,
  `date_of_confirmation` DATETIME DEFAULT NULL,
   PRIMARY KEY (`id`),
  KEY `fk_payment_made_by_member_idx` (`paid_by_id`),
  KEY `fk_payment_for_membership_type_idx` (`membership_type_id`),
  KEY `fk_payment_made_to_account_number_idx` (`bank_account_id`),
	CONSTRAINT `fk_payment_made_by_member_idx` FOREIGN KEY (`paid_by_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	/*CONSTRAINT `fk_payment_made_to_account_number_idx` FOREIGN KEY (`bank_account_id`) REFERENCES `banker` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,*/
	CONSTRAINT `fk_payment_for_membership_type_idx` FOREIGN KEY (`membership_type_id`) REFERENCES `membershiptype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;





DROP TABLE IF EXISTS `assigning_order_for_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigning_order_for_delivery` (
  `member_id`  INT(10) UNSIGNED NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
   `status` ENUM('pending','ontransit','failed','ondispute','delivered') NOT NULL,
   `failed_remark` TEXT DEFAULT NULL,
   `ondispute_remark` TEXT DEFAULT NULL,
   `delivered_remark` TEXT DEFAULT NULL,
   `ontransit_remark` TEXT DEFAULT NULL,
  `order_assigned_by` int(10) NOT NULL,
  `order_assigned_to` int(10) NOT NULL,
  `date_of_assignment` DATETIME DEFAULT NULL,
  `ontransit_commencement_date` DATETIME DEFAULT NULL,
  `delivery_return_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`member_id`,`order_id`),
  KEY `fk_order_for_assignment_idx` (`order_id`),
  KEY `fk_member_with_assignment_idx` (`member_id`),
 	CONSTRAINT `fk_order_for_assignment_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT `fk_member_with_assignment_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_delivery` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `status` ENUM('unconfirmed','confirmed') NOT NULL,
  `member_remark` TEXT DEFAULT NULL,
  `order_delivered_by` int(10) NOT NULL,
  `date_of_delivery` DATETIME DEFAULT NULL,
  `delivery_confirmed_by` int(10) NOT NULL,
  `date_of_delivery_confirmation` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_for_delivery_idx` (`order_id`),
 	CONSTRAINT `fk_order_for_delivery_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;





DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` ENUM('pending','unconfirmed','confirmed','failed') NOT NULL,
  `payment_mode` ENUM('wallet','online','ondelivery') DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `bank_account_id`  INT(10) DEFAULT 0
  `remark` varchar(200) DEFAULT NULL,
   `reason_for_failure` text DEFAULT NULL,
  `net_amount`  DOUBLE NOT NULL,
   `revenue`  DOUBLE NOT NULL,
   `gross_amount`  DOUBLE NOT NULL,
   `delivery_charges`  DOUBLE NOT NULL,
   `delivery_type`  varchar(50) DEFAULT NULL,
   `discounted_amount`  DOUBLE DEFAULT 0,
   `escrow_charge`  DOUBLE NOT NULL,
   `vat`  DOUBLE DEFAULT 0,
  `payment_date` DATETIME DEFAULT NULL,
  `paid_by` int(10) NULL,
  `payment_confirmed_by` int(10)  NULL,
  `date_of_confirmation` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_for_order_idx` (`order_id`),
  KEY `fk_platform_user_payment_payment_idx` (`paid_by`),
 KEY `fk_payment_to_account_number_idx` (`bank_account_id`),
  CONSTRAINT `fk_payment_fpr_order_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_to_account_number_idx` FOREIGN KEY (`bank_account_id`) REFERENCES `banker` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `currency_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_exchange` (
  `base_currency_id` INT(10) UNSIGNED NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `exchange_rate` DOUBLE NOT NULL,
  `create_time` DATETIME DEFAULT NULL,
 `update_time` DATETIME DEFAULT NULL,
 `created_by` INT(10) DEFAULT NULL,
 `updated_by` INT(10) DEFAULT NULL,
 PRIMARY KEY (`base_currency_id`,`currency_id`),
  KEY `fk_platform_base_currency_idx` (`base_currency_id`),
  KEY `fk_platform_other_currencies_idx` (`currency_id`),
  CONSTRAINT `fk_platform_base_currency_idx` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_platform_other_currencies_idx` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `bank_collect_for_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_collect_for_country` (
  `bank_id` INT(10) unsigned NOT NULL,
  `country_id` INT(10) unsigned NOT NULL,
  `status` ENUM('inactive','active') NOT NULL,
  `payment_mode` ENUM ('bank_transfer','online', 'cash','hybrid'),
  `approved` INT DEFAULT 0,
  `approved_user_id` INT(10) DEFAULT NULL,
  `disapproved_user_id` INT(10) DEFAULT NULL,
   `activated_user_id` INT(10) DEFAULT NULL,
   `activated_time` DATETIME DEFAULT NULL,
  `approved_time` DATETIME DEFAULT NULL,
  `disapproved_time` DATETIME DEFAULT NULL,
  `initiator_create_time` DATETIME DEFAULT NULL,
  `initiator_update_time` DATETIME DEFAULT NULL,
  `initiator_create_user_id` INT(10) DEFAULT NULL,
  `initiator_update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`bank_id`, `country_id`),
  KEY `fk_country_has_bank_idx` (`country_id`),
  KEY `fk_bank_has_country_idx` (`bank_id`),
  CONSTRAINT `fk_country_has_bank_idx` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bank_has_country_idx` FOREIGN KEY (`bank_id`) REFERENCES `banker` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `requester_name` varchar(200) DEFAULT NULL,
  `requester_type` ENUM ('investor','merchant', 'corporate_institution','public_institution','individual') NULL,
  `requester_institution` varchar(20) DEFAULT NULL,
  `requester_email` varchar(100)  NOT NULL,
  `requester_landline` varchar(20) DEFAULT NULL,
  `requester_mobile_number` varchar(100)  DEFAULT NULL,
  `how_to_contact_requester` ENUM ('email','landline', 'mobile_phone','all') NULL,
  `best_time_to_contact_requester` ENUM ('before_12noon','between_12noon_and_3pm', 'between_3pm_and_7pm','between_7pm_and_9pm') NULL,
  `best_day_to_contact_requester` ENUM ('monday','tuesday', 'wednesday','thursday','friday','saturday','sunday','weekdays_only','weekends_only') NULL,
  `request` text NOT NULL,
  `subject` text NOT NULL,
  `request_time` DATETIME DEFAULT NULL,
   PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `website_about_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_about_us` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `introduction` text NOT NULL,
  `who_we_are` text NOT NULL,
  `who_we_serve` text NOT NULL,
   `our_mission_and_vision` text NOT NULL,
   `status` ENUM('inactive','active') NOT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `website_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_services` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `introduction` text NOT NULL,
  `service_general` text NOT NULL,
  `service_share` text NOT NULL,
   `service_business` text NOT NULL,
   `status` ENUM('inactive','active') NOT NULL,
    `image_header_1` VARCHAR(200) DEFAULT NULL,
	`image_header_2` VARCHAR(200) DEFAULT NULL,
	`image_header_3` VARCHAR(200) DEFAULT NULL,
	`image_header_4` VARCHAR(200) DEFAULT NULL,
	`image_header_5` VARCHAR(200) DEFAULT NULL,
	`image_header_6` VARCHAR(200) DEFAULT NULL,
	`products_on_sales` VARCHAR(200) DEFAULT NULL,
	`less_than_1000` VARCHAR(200) DEFAULT NULL,
	`for_rent` VARCHAR(200) DEFAULT NULL,
	`for_options` VARCHAR(200) DEFAULT NULL,
	`baby_products` VARCHAR(200) DEFAULT NULL,
	`groceries` VARCHAR(200) DEFAULT NULL,
	`fashion_and_beauty` VARCHAR(200) DEFAULT NULL,
	`office_products` VARCHAR(200) DEFAULT NULL,
	`book_and_learning` VARCHAR(200) DEFAULT NULL,
	`smartphones` VARCHAR(200) DEFAULT NULL,
	`computers` VARCHAR(200) DEFAULT NULL,
	`wholesales_and_commodity` VARCHAR(200) DEFAULT NULL,
	`home_services` VARCHAR(200) DEFAULT NULL,
	`all_categories` VARCHAR(200) DEFAULT NULL,
	`advert_mini_header` VARCHAR(200) DEFAULT NULL,
	`primary_books_and_learning` VARCHAR(200) DEFAULT NULL,
	`secondary_books_and_learning` VARCHAR(200) DEFAULT NULL,
	`tertiary_books_and_learning` VARCHAR(200) DEFAULT NULL,
	`professional_books_and_learning` VARCHAR(200) DEFAULT NULL,
	`other_books_and_learning` VARCHAR(200) DEFAULT NULL,
	`learning_tools_and_learning` VARCHAR(200) DEFAULT NULL,
	`farming_services` VARCHAR(200) DEFAULT NULL,
    `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `website_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_membership` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `introduction` text NOT NULL,
  `membership_basic` text NOT NULL,
  `membership_business` text NOT NULL,
  `membership_business_prime` text NOT NULL,
  `membership_basic_prime` text NOT NULL,
   `membership_dons` text NOT NULL,
   `status` ENUM('inactive','active') NOT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `terms_and_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terms_and_conditions` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `membership_terms_and_conditions` text NOT NULL,
  `purchase_terms_and_conditions` text NOT NULL,
   `generic_terms_and_conditions` text NOT NULL,
   `status` ENUM('inactive','active') NOT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quote_number` varchar(200) DEFAULT NULL,
  `product_id` INT(10) unsigned NOT NULL,
  `quote_file` VARCHAR(100) DEFAULT NULL,
  `is_escrowed` BOOLEAN DEFAULT 0,
   `is_for_future` BOOLEAN DEFAULT 0,
 `status` ENUM('live','expired','rejected','accepted') NULL,
  `minimum_number_of_product_to_buy` INT(10) DEFAULT 0,
  `whats_product_per_item` VARCHAR(100) NOT NULL,
  `quantity` INT(10) DEFAULT 0,
  `total_amount_quoted` DOUBLE DEFAULT NULL,
   `direction` ENUM('initiation','reciept') NOT NULL,
  `quote_initiation_date` DATETIME DEFAULT NULL,
  `quote_modification_date` DATETIME DEFAULT NULL,
  `quote_acceptance_date` DATETIME DEFAULT NULL,
  `quote_rejection_date` DATETIME DEFAULT NULL,
  `quote_expected_date_of_expiry` DATETIME DEFAULT NULL,
  `quote_response_date` DATETIME DEFAULT NULL,
  `quote_initiated_by` INT(10) DEFAULT NULL,
  `quote_modified_by` INT(10) DEFAULT NULL,
  `quote_response_from` INT(10) DEFAULT NULL,
  `quote_rejected_by` INT(10) DEFAULT NULL,
  `quote_accepted_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_quote_is_for_product_idx` (`product_id`),
   CONSTRAINT `fk_quote_is_for_product_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `escrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escrow` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `escrow_number` varchar(200) DEFAULT NULL,
  `product_id` INT(10) unsigned NOT NULL,
  `quote_id` INT(10) DEFAULT NULL,
  `escrow_agreement_file` VARCHAR(100) DEFAULT NULL,
  `is_quoted` BOOLEAN DEFAULT 0,
 `is_futuristic` BOOLEAN DEFAULT 0,
 `status` ENUM('live','expired','rejected','accepted','invoked') NOT NULL,
 `escrow_operation_for` ENUM('noncart','post','pre') NOT NULL,
  `minimum_number_of_product_to_buy` INT(10) DEFAULT 0,
  `whats_product_per_item` VARCHAR(100) NOT NULL,
  `quantity` INT(10) DEFAULT NULL,
  `price_per_item` DOUBLE DEFAULT NULL,
 `is_invoked` BOOLEAN DEFAULT 0,
 `accepted_escrow_invocation_terms` BOOLEAN DEFAULT 0,
  `reason_for_invocation` text DEFAULT NULL,
  `total_amount_purchased` DOUBLE DEFAULT NULL,
   `direction` ENUM('initiation','reciept') NOT NULL,
  `escrow_initiation_date` DATETIME DEFAULT NULL,
  `escrow_acceptance_date` DATETIME DEFAULT NULL,
  `escrow_rejection_date` DATETIME DEFAULT NULL,
  `escrow_expected_date_of_expiry` DATETIME DEFAULT NULL,
  `escrow_response_date` DATETIME DEFAULT NULL,
  `escrow_initiated_by` INT(10) DEFAULT NULL,
  `escrow_response_from` INT(10) DEFAULT NULL,
  `escrow_rejected_by` INT(10) DEFAULT NULL,
  `escrow_accepted_by` INT(10) DEFAULT NULL,
  `escrow_invocation_date` DATETIME DEFAULT NULL,
  `escrow_invoked_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_escrow_is_for_product_idx` (`product_id`),
   CONSTRAINT `fk_escrow_is_for_product_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `futures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `futures` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `future_number` varchar(200) DEFAULT NULL,
  `quote_id` INT(10) UNSIGNED NOT NULL,
  `future_agreement_file` VARCHAR(100) DEFAULT NULL,
  `is_quoted` BOOLEAN DEFAULT 0,
 `is_escrowed` BOOLEAN DEFAULT 0,
 `status` ENUM('live','expired','rejected','accepted') NOT NULL,
  `minimum_number_of_product_to_buy` INT(10) DEFAULT 0,
  `whats_product_per_item` VARCHAR(100) NOT NULL,
  `quantity` INT(10) DEFAULT NULL,
  `total_amount_of_purchase` DOUBLE DEFAULT NULL,
  `delivery_month` varchar(15) DEFAULT NULL,
  `delivery_year` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `staggered_payment_frequency` varchar(15) DEFAULT NULL,
   `direction` ENUM('initiation','reciept') NOT NULL,
  `futures_initiation_date` DATETIME DEFAULT NULL,
  `futures_acceptance_date` DATETIME DEFAULT NULL,
  `futures_rejection_date` DATETIME DEFAULT NULL,
  `futures_expected_date_of_expiry` DATETIME DEFAULT NULL,
  `futures_response_date` DATETIME DEFAULT NULL,
  `futures_response_from` INT(10) DEFAULT NULL,
  `futures_initiated_by` INT(10) DEFAULT NULL,
  `futures_requested_by` INT(10) DEFAULT NULL,
  `futures_rejected_by` INT(10) DEFAULT NULL,
  `futures_accepted_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`),
    KEY `fk_futures_is_for_this_quote_idx` (`quote_id`),
    CONSTRAINT `fk_futures_is_for_this_quote_idx` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `futures_has_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `futures_has_payment` (
  `futures_id`  INT(10) UNSIGNED NOT NULL,
  `payment_id`  INT(10) UNSIGNED NOT NULL,
  `payment_due_date` DATETIME DEFAULT NULL,
  `actual_date_of_payment` DATETIME DEFAULT NULL,
  `status` ENUM('retired','defaulted') NOT NULL,
   PRIMARY KEY (`futures_id`,`payment_id`),
   KEY `fk_futures_is_for_this_payment_idx` (`futures_id`),
   KEY `fk_payment_is_for_this_futures_idx` (`payment_id`),
   CONSTRAINT `fk_futures_is_for_this_payment_idx` FOREIGN KEY (`futures_id`) REFERENCES `futures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_payment_is_for_this_futures_idx` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `member_has_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_has_members` (
  `member_id`  INT(10) UNSIGNED NOT NULL,
  `other_member_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('pending','accepted','rejected','suspended','unsuspended') NOT NULL,
   `relationship` ENUM('family','client','employee','employer','friend','others') NOT NULL,
   `reason_for_suspension` varchar(200) DEFAULT NULL,
  `date_connection_was_requested` DATETIME DEFAULT NULL,
  `date_connection_was_accepted` DATETIME DEFAULT NULL,
  `date_connection_was_rejected` DATETIME DEFAULT NULL,
  `date_connection_was_suspended` DATETIME DEFAULT NULL,
   `connection_requested_by` INT(10) DEFAULT NULL,
   `connection_accepted_by` INT(10) DEFAULT NULL,
   `connection_rejected_by` INT(10) DEFAULT NULL,
    `connection_suspended_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`member_id`,`other_member_id`),
   KEY `fk_member_has_member_idx` (`member_id`),
   KEY `fk_other_member_has_owner_idx` (`other_member_id`),
   CONSTRAINT `fk_member_has_member_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_other_member_has_owner_idx` FOREIGN KEY (`other_member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `hamper_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hamper_has_products` (
  `hamper_id`  INT(10) UNSIGNED NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `quantity` INT(10) DEFAULT 0,
  `date_product_was_added` DATETIME DEFAULT NULL,
  `product_was_added_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`hamper_id`,`product_id`),
   KEY `fk_hamper_has_product_idx` (`hamper_id`),
   KEY `fk_product_is_in_hamper_idx` (`product_id`),
   CONSTRAINT `fk_hamper_has_product_idx` FOREIGN KEY (`hamper_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_is_in_hamper_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `hamper_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hamper_container` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`  varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
   `amount`  DOUBLE DEFAULT 0,
   `service_charge_in_percentages`  DOUBLE DEFAULT 0,
   `minimum_service_charge`  DOUBLE DEFAULT 0,
   `weight`  DOUBLE DEFAULT 0,
   `code` varchar(200) NOT NULL,
   `icon` VARCHAR(100) DEFAULT NULL,
   `create_time` DATETIME DEFAULT NULL,
  `update_time` DATETIME DEFAULT NULL,
  `create_user_id` INT(10) DEFAULT NULL,
  `update_user_id` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `hamper_has_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hamper_has_beneficiary` (
  `hamper_id`  INT(10) UNSIGNED NOT NULL,
  `beneficiary_id`  INT(10) UNSIGNED NOT NULL,
   `hamper_container_id` INT(10) UNSIGNED NOT NULL,
  `status` ENUM('pending','ontransit','received','returned') NOT NULL,
  `delivery_type` ENUM('standard','priority','top') NOT NULL,
  `delivery_is_redirectable` BOOLEAN DEFAULT 0,
  `send_to_cart_terms_and_condition` BOOLEAN DEFAULT 0,
  `is_redirected` BOOLEAN DEFAULT 0,
  `amount_paid_for_redirection` DOUBLE DEFAULT NULL,
  `number_of_hampers_delivered` INT(10) DEFAULT NULL,
  `name_of_actual_receiver_of_the_hamper` varchar(200) DEFAULT NULL,
  `is_redirection_confirmed` BOOLEAN DEFAULT 0,
   `place_of_delivery` varchar(200) DEFAULT NULL,
   `delivery_address_option` ENUM('primary','others') NOT NULL,
   `city_id` INT(10) UNSIGNED NOT NULL,
   `state_id` INT(10) UNSIGNED NOT NULL,
   `country_id` INT(10) UNSIGNED NOT NULL,
  `courier_delivery_comment` varchar(200) DEFAULT NULL,
  `beneficiary_delivery_comment` varchar(200) DEFAULT NULL,
  `reason_for_hamper_return` varchar(200) DEFAULT NULL,
  `date_hamper_was_delivered` DATETIME DEFAULT NULL,
   `date_hamper_was_returned` DATETIME DEFAULT NULL,
   `date_redirection_was_confirmed` DATETIME DEFAULT NULL,
  `delivery_was_made_to` INT(10) DEFAULT NULL,
  `hamper_was_delivered_by` INT(10) DEFAULT NULL,
   `hamper_was_returned_by` INT(10) DEFAULT NULL,
   `hamper_was_sent_by` INT(10) DEFAULT NULL,
   `redirection_was_confirmed_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`hamper_id`,`beneficiary_id`),
   KEY `fk_hamper_has_beneficiary_idx` (`hamper_id`),
   KEY `fk_beneficiary_has_hamper_idx` (`beneficiary_id`),
    KEY `fk_hamper_container_for_member_beneficiary_idx` (`hamper_container_id`),
   CONSTRAINT `fk_hamper_has_beneficiary_idx` FOREIGN KEY (`hamper_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_beneficiary_has_hamper_idx` FOREIGN KEY (`beneficiary_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_hamper_container_for_member_beneficiary_idx` FOREIGN KEY (`hamper_container_id`) REFERENCES `hamper_container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `hamper_has_non_member_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hamper_has_non_member_beneficiary` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hamper_id`  INT(10) UNSIGNED NOT NULL,
  `beneficiary`  varchar(200) DEFAULT NULL,
  `hamper_label`  varchar(200) DEFAULT NULL,
  `hamper_container_id` INT(10) UNSIGNED NOT NULL,
  `status` ENUM('pending','ontransit','received','returned') NOT NULL,
  `delivery_type` ENUM('standard','priority','top') NOT NULL,
   `number_of_hampers_delivered` INT(10) DEFAULT NULL,
  `name_of_actual_receiver_of_the_hamper` varchar(200) DEFAULT NULL,
  `send_to_cart_terms_and_condition` BOOLEAN DEFAULT 0,
   `place_of_delivery` varchar(200) DEFAULT NULL,
   `city_id` INT(10) UNSIGNED NOT NULL,
   `state_id` INT(10) UNSIGNED NOT NULL,
   `country_id` INT(10) UNSIGNED NOT NULL,
  `courier_delivery_comment` varchar(200) DEFAULT NULL,
  `beneficiary_delivery_comment` varchar(200) DEFAULT NULL,
  `reason_for_hamper_return` varchar(200) DEFAULT NULL,
  `date_hamper_was_delivered` DATETIME DEFAULT NULL,
   `date_hamper_was_returned` DATETIME DEFAULT NULL,
  `delivery_was_made_to` INT(10) DEFAULT NULL,
  `hamper_was_delivered_by` INT(10) DEFAULT NULL,
   `hamper_was_returned_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_hamper_has_non_member_beneficiary_idx` (`hamper_id`),
   KEY `fk_hamper_container_for_non_member_beneficiary_idx` (`hamper_container_id`),
   CONSTRAINT `fk_hamper_has_non_member_beneficiary_idx` FOREIGN KEY (`hamper_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_hamper_container_for_non_member_beneficiary_idx` FOREIGN KEY (`hamper_container_id`) REFERENCES `hamper_container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `product_has_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_vendor` (
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `vendor_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('active','inactive') NOT NULL,
  `date_product_was_added_to_vendor` DATETIME DEFAULT NULL,
  `date_product_to_vendor_was_updated` DATETIME DEFAULT NULL,
  `product_was_added_by` INT(10) DEFAULT NULL,
   `product_was_updated_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`product_id`,`vendor_id`),
   KEY `fk_product_was_added_to_vendor_idx` (`product_id`),
   KEY `fk_vendor_owns_product_idx` (`vendor_id`),
   CONSTRAINT `fk_product_was_added_to_vendor_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_vendor_owns_product_idx` FOREIGN KEY (`vendor_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `member_subscribed_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_subscribed_to_products` (
  `member_id`  INT(10) UNSIGNED NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('active','inactive') NOT NULL,
  `type` ENUM('post','pre') NOT NULL,
  `subscription_quantity` INT(10) DEFAULT 0,
  `per_delivery_quantity` INT(10) DEFAULT 0,
  `remaining_subscription_quantity` INT(10) DEFAULT 0,
  `need_escrow_agreement` BOOLEAN DEFAULT 0,
   `is_subscription_in_progress` BOOLEAN DEFAULT 0,
   `is_delivery_scheduled` BOOLEAN DEFAULT 0,
  `is_subscription_payment_inititated` BOOLEAN DEFAULT 0,
   `is_subscription_payment_confirmed` BOOLEAN DEFAULT 0,
   `topup_status` ENUM('inactive','active') DEFAULT NULL,
    `top_up_quantity` INT(10) DEFAULT 0,
	`escrow_id` INT(10) DEFAULT 0,
  `is_escrow_accepted` BOOLEAN DEFAULT 0,
  `escrow_agreement_file` VARCHAR(100) DEFAULT NULL,
   `day_of_delivery` ENUM('monday','tuesday','wednesday','thursday','friday','saturday','sunday','any_day') DEFAULT NULL,
   `week_of_delivery` ENUM('every_first_week','every_second_week','every_third_week','every_forth_week','every_last_week','any_week') DEFAULT NULL,
   `delivery_frequency` ENUM('weekly','bi_weekly','monthly','bi_monthly','quarterly','every_four_months','every_five_months','half_yearly','every_seven_months','every_eight_months','every_nine_months','every_ten_months','every_eleven_months','yearly') DEFAULT NULL,
   `date_of_first_delivery` DATETIME DEFAULT NULL,
   `date_of_last_delivery` DATETIME DEFAULT NULL,
   `date_of_next_delivery` DATETIME DEFAULT NULL,
   `date_product_was_subscribed_to_member` DATETIME DEFAULT NULL,
  `date_product_to_member_was_updated` DATETIME DEFAULT NULL,
  `product_was_subscribed_by` INT(10) DEFAULT NULL,
   `product_was_updated_by` INT(10) DEFAULT NULL,
   `escrow_initiation_date` DATETIME DEFAULT NULL,
   `escrow_initiated_by` INT(10) DEFAULT NULL,
   `subscription_payment_confirmed_by` INT(10) DEFAULT NULL,
   `subscription_payment_initiated_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`product_id`,`member_id`),
   KEY `fk_product_was_subscribed_to_member_idx` (`product_id`),
   KEY `fk_member_subscribed_to_product_idx` (`member_id`),
   CONSTRAINT `fk_product_was_subscribed_to_member_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_member_subscribed_to_product_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher` (
  `id`  INT(10) UNSIGNED NOT NULL,
  `voucher_number` varchar(200) DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `status` ENUM('inactive','active') NOT NULL,
  `voucher_type` ENUM('life','dummy') NOT NULL,
  `voucher_value` DOUBLE DEFAULT NULL,
  `remaining_voucher_value` DOUBLE DEFAULT NULL,
  `topup_value_status` ENUM('inactive','active') DEFAULT NULL,
  `topup_value` DOUBLE DEFAULT NULL,
  `remaining_voucher_share_in_percentage` DOUBLE DEFAULT NULL,
  `accepted_voucher_creation_and_user_terms` BOOLEAN DEFAULT 0,
  `accepted_voucher_topup_terms` BOOLEAN DEFAULT 0,
  `is_voucher_toppedup` BOOLEAN DEFAULT 0,
  `is_voucher_payment_confirmed` BOOLEAN DEFAULT 0,
   `is_topup_payment_confirmed` BOOLEAN DEFAULT 0,
  `date_created` DATETIME DEFAULT NULL,
  `topup_date` DATETIME DEFAULT NULL,
  `date_confirmed` DATETIME DEFAULT NULL,
   `date_topup_confirmed` DATETIME DEFAULT NULL,
  `date_updated` DATETIME DEFAULT NULL,
  `create_by` INT(10) DEFAULT NULL,
  `confirmed_by` INT(10) DEFAULT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  `toppedup_by` INT(10) DEFAULT NULL,
  `topup_confimed_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet` (
  `id`  INT(10) UNSIGNED NOT NULL,
  `member_owner_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('inactive','active') NOT NULL,
  `date_created` DATETIME DEFAULT NULL,
  `date_updated` DATETIME DEFAULT NULL,
  `create_by` INT(10) DEFAULT NULL,
  `updated_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member_owns_wallet_idx` (`member_owner_id`),
  CONSTRAINT `fk_member_owns_wallet_idx` FOREIGN KEY (`member_owner_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `wallet_has_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_has_vouchers` (
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `voucher_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('active','inactive','suspend') NOT NULL,
  `voucher_share_in_percentage` DOUBLE DEFAULT NULL,
  `actual_voucher_share` DOUBLE DEFAULT NULL,
  `available_voucher_value` DOUBLE DEFAULT NULL,
  `used_voucher_value` DOUBLE DEFAULT NULL,
  `usage_commencement_date` DATETIME DEFAULT NULL,
  `date_voucher_was_added_to_wallet` DATETIME DEFAULT NULL,
  `date_voucher_was_updated` DATETIME DEFAULT NULL,
  `voucher_was_added_by` INT(10) DEFAULT NULL,
  `voucher_was_updated_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`wallet_id`,`voucher_id`),
   KEY `fk_wallet_has_vouchers_idx` (`wallet_id`),
   KEY `fk_vouchers_in_wallet_idx` (`voucher_id`),
   CONSTRAINT `fk_wallet_has_vouchers_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_vouchers_in_wallet_idx` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;




DROP TABLE IF EXISTS `voucher_limited_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_limited_to_products` (
  `voucher_id`  INT(10) UNSIGNED NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('active','inactive') NOT NULL,
  `expendable_limits_in_percentage` DOUBLE DEFAULT -1,
  `date_limit_was_added_placed` DATETIME DEFAULT NULL,
  `date_limi_was_updated` DATETIME DEFAULT NULL,
  `voucher_limit_was_placed_by` INT(10) DEFAULT NULL,
  `voucher_limit_was_updated_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`voucher_id`,`product_id`),
   KEY `fk_voucher_is_limited_products_idx` (`voucher_id`),
   KEY `fk_product_is_limited_voucher_idx` (`product_id`),
   CONSTRAINT `fk_voucher_is_limited_products_idx` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_is_limited_voucher_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `voucher_limited_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_limited_to_categories` (
  `voucher_id`  INT(10) UNSIGNED NOT NULL,
  `category_id`  INT(10) UNSIGNED NOT NULL,
  `status` ENUM('active','inactive') NOT NULL,
  `expendable_limits_in_percentage` DOUBLE DEFAULT -1,
  `date_limit_was_added_placed` DATETIME DEFAULT NULL,
  `date_limi_was_updated` DATETIME DEFAULT NULL,
  `voucher_limit_was_placed_by` INT(10) DEFAULT NULL,
  `voucher_limit_was_updated_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`voucher_id`,`category_id`),
   KEY `fk_voucher_is_limited_categories_idx` (`voucher_id`),
   KEY `fk_category_is_limited_voucher_idx` (`category_id`),
   CONSTRAINT `fk_voucher_is_limited_categories_idx` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_category_is_limited_voucher_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `quote_has_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_has_response` (
  `quote_id`  INT(10) UNSIGNED NOT NULL,
  `member_id`  INT(10) UNSIGNED NOT NULL,
   `status` ENUM('pending','accepted','rejected') NOT NULL,
   `is_quote_escrowed` BOOLEAN DEFAULT 0,
   `is_displayable` BOOLEAN DEFAULT 0,
   `is_quote_for_future` BOOLEAN DEFAULT 0,
   `is_escrow_terms_accepted` BOOLEAN DEFAULT 0,
  `is_future_facility_terms_accepted` BOOLEAN DEFAULT 0,
   `is_platform_quotation_terms_accepted` BOOLEAN DEFAULT 0,
   `quotation_file` VARCHAR(100) DEFAULT NULL,
   `video_filename` VARCHAR(200) DEFAULT NULL,
    `is_with_video` BOOLEAN DEFAULT 0,
   `total_amount_quoted` DOUBLE DEFAULT NULL,
   `delivery_cost` DOUBLE DEFAULT NULL,
  `date_quotation_was_sent` DATETIME DEFAULT NULL,
  `quotation_sent_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`quote_id`,`member_id`),
   KEY `fk_quote_has_response_idx` (`quote_id`),
   KEY `fk_response_is_for_quote_idx` (`member_id`),
   CONSTRAINT `fk_quote_has_response_idx` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_response_is_for_quote_idx` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wallet_has_product_expendable_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_has_product_expendable_limit` (
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `expendable_value` DOUBLE DEFAULT 0,
  PRIMARY KEY (`wallet_id`,`product_id`),
   KEY `fk_wallet_has_expendable_product_idx` (`wallet_id`),
   KEY `fk_expendable_product_for_wallet_idx` (`product_id`),
   CONSTRAINT `fk_wallet_has_expendable_product_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_expendable_product_for_wallet_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wallet_has_category_expendable_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_has_category_expendable_limit` (
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `category_id`  INT(10) UNSIGNED NOT NULL,
  `expendable_value` DOUBLE DEFAULT 0,
  PRIMARY KEY (`wallet_id`,`category_id`),
   KEY `fk_wallet_has_expendable_category_idx` (`wallet_id`),
   KEY `fk_expendable_category_for_wallet_idx` (`category_id`),
   CONSTRAINT `fk_wallet_has_expendable_category_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_expendable_category_for_wallet_idx` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `expendability_limit_adjuster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expendability_limit_adjuster` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `previous_limit` DOUBLE DEFAULT NULL,
  `current_limit` DOUBLE DEFAULT NULL,
  `adjusted_at` ENUM('product','category') NOT NULL,
  `date_adjusted` DATETIME DEFAULT NULL,
  `date_reconstructed` DATETIME DEFAULT NULL,
  `adjusted_by` INT(10) DEFAULT NULL,
  `reconstructed_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
   KEY `fk_wallet_has_expendable_adjuster_idx` (`wallet_id`),
   KEY `fk_product_has_expendable_adjuster_idx` (`product_id`),
   KEY `fk_order_has_expendable_adjuster_idx` (`order_id`),
   CONSTRAINT `fk_wallet_has_expendable_adjuster_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_has_expendable_adjuster_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_order_has_expendable_adjuster_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wallet_adjuster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_adjuster` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `voucher_id`  INT(10) UNSIGNED NOT NULL,
  `previous_voucher_available_balance` DOUBLE DEFAULT NULL,
  `previous_voucher_used_balance` DOUBLE DEFAULT NULL,
  `current_voucher_available_balance` DOUBLE DEFAULT NULL,
  `current_voucher_used_balance` DOUBLE DEFAULT NULL,
  `date_adjusted` DATETIME DEFAULT NULL,
  `date_reconstructed` DATETIME DEFAULT NULL,
  `adjusted_by` INT(10) DEFAULT NULL,
  `reconstructed_by` INT(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
   KEY `fk_wallet_has_voucher_adjuster_idx` (`wallet_id`),
   KEY `fk_voucher_has_wallet_adjuster_idx` (`voucher_id`),
   KEY `fk_order_has_wallet_adjuster_idx` (`order_id`),
   CONSTRAINT `fk_wallet_has_voucher_adjuster_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_voucher_has_wallet_adjuster_idx` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_order_has_wallet_adjuster_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `undelivered_ordered_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `undelivered_ordered_products` (
  `id`  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_id`  INT(10) UNSIGNED NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id`  INT(10) UNSIGNED NOT NULL,
  `product_total_cost` DOUBLE DEFAULT NULL,
  `product_delivery_cost` DOUBLE DEFAULT NULL,
  `settlement_from` ENUM('limits_and_free_pool','free_pool_only','limits_only') NOT NULL,
  `remark` VARCHAR(200) DEFAULT NULL,
  `date_registered` DATETIME DEFAULT NULL,
  `registered_by` INT(10) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `fk_order_has_undelivered_product_idx` (`order_id`),
   KEY `fk_wallet_has_unpaid_delivered_product_idx` (`wallet_id`),
   KEY `fk_product_could_not_be_delivered_idx` (`product_id`),
   CONSTRAINT `fk_wallet_has_unpaid_delivered_product_idx` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_order_has_undelivered_product_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_product_could_not_be_delivered_idx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `keyword` VARCHAR(200) DEFAULT NULL,
   PRIMARY KEY (`id`),
  KEY `fk_product_idx`(`product_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;






//setup scrips

//create the country

insert into country (name, continent,description,enable_vat_collection,country_code,create_time) values
('Nigeria','Africa','A country in West Africa',1,'NGN',NOW());

//create the state
insert into state (name, country_id,description,state_code,state_number,create_time) values
('Lagos',1,'A state in Nigeria','LGR','L0',NOW());

//create the city

insert into city (name, state_id,zip_code,description,city_number,create_time) values
('Ikoyi',1,'00001','A city in Lagos','I0',NOW());

//create  two roles 'admin' and 'user'

insert into AuthItem (`name`, `type`, `description`) values 

('admin', 2, 'this is the admin role'),
('user', 2, 'This is the user privilege');


//create the super admin user

insert into members (username, email, password, firstname, lastname,country_id, state_id, city_id, role, usertype,status,category,gender) values
('uchengadi', 'uche.ngadi@cobuy.com.ng','$2y$11$985grftem5bghfdr25KJEuiE5UvLzbW89KPOpS0H/ME0HmmWgwGo.','Uche','Ngadi',1,1,1,'admin','staff','active','individual','gender');


//assign user to role

insert into AuthAssignment (itemname, userid) values ('admin', 1);


insert into stores (currency_id,default_store,









    