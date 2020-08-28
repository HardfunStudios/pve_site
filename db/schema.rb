# frozen_string_literal: true
# 
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_828_172_820) do
  create_table 'attached_files', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'origin_url'
    t.string 'local_url'
    t.string 'file_type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categories', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'term_wp_id'
    t.string 'name'
    t.string 'slug'
    t.integer 'term_group'
    t.integer 'term_taxonomy_id'
    t.string 'taxonomy'
    t.string 'description'
    t.integer 'parent_wp_id'
    t.integer 'count'
    t.string 'filter'
    t.bigint 'parent_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
  end

  create_table 'image_files', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'origin_url'
    t.string 'local_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'post_attached_files', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'attached_file_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['attached_file_id'], name: 'index_post_attached_files_on_attached_file_id'
    t.index ['post_id'], name: 'index_post_attached_files_on_post_id'
  end

  create_table 'post_categories', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_post_categories_on_category_id'
    t.index ['post_id'], name: 'index_post_categories_on_post_id'
  end

  create_table 'post_image_files', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'image_file_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['image_file_id'], name: 'index_post_image_files_on_image_file_id'
    t.index ['post_id'], name: 'index_post_image_files_on_post_id'
  end

  create_table 'post_tags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'tag_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_post_tags_on_post_id'
    t.index ['tag_id'], name: 'index_post_tags_on_tag_id'
  end

  create_table 'post_videos', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.bigint 'video_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_post_videos_on_post_id'
    t.index ['video_id'], name: 'index_post_videos_on_video_id'
  end

  create_table 'posts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'post_author'
    t.datetime 'post_date_gmt'
    t.text 'post_content'
    t.string 'post_title'
    t.string 'post_status'
    t.text 'post_excerpt'
    t.string 'comment_status'
    t.string 'ping_status'
    t.string 'post_name'
    t.datetime 'post_modified'
    t.datetime 'post_modified_gmt'
    t.string 'post_content_filtered'
    t.integer 'post_parent'
    t.integer 'wp_id'
    t.integer 'menu_order'
    t.string 'guid'
    t.string 'post_type'
    t.string 'post_mime_type'
    t.integer 'comment_count'
    t.string 'filter'
    t.json 'post_meta'
    t.string 'post_thumbnail'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'term_wp_id'
    t.string 'name'
    t.string 'slug'
    t.integer 'term_group'
    t.integer 'term_taxonomy_id'
    t.string 'taxonomy'
    t.string 'description'
    t.integer 'parent_wp_id'
    t.integer 'count'
    t.string 'filter'
    t.bigint 'parent_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['parent_id'], name: 'index_tags_on_parent_id'
  end

  create_table 'text_contents', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.text 'content'
    t.bigint 'post_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['post_id'], name: 'index_text_contents_on_post_id'
  end

  create_table 'videos', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'categories', 'categories', column: 'parent_id'
  add_foreign_key 'post_attached_files', 'attached_files'
  add_foreign_key 'post_attached_files', 'posts'
  add_foreign_key 'post_categories', 'categories'
  add_foreign_key 'post_categories', 'posts'
  add_foreign_key 'post_image_files', 'image_files'
  add_foreign_key 'post_image_files', 'posts'
  add_foreign_key 'post_tags', 'posts'
  add_foreign_key 'post_tags', 'tags'
  add_foreign_key 'post_videos', 'posts'
  add_foreign_key 'post_videos', 'videos'
  add_foreign_key 'tags', 'tags', column: 'parent_id'
  add_foreign_key 'text_contents', 'posts'
end
