# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170605034245) do

  create_table "administrations", force: :cascade do |t|
    t.integer  "congress_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["congress_id"], name: "index_administrations_on_congress_id"
    t.index ["user_id"], name: "index_administrations_on_user_id"
  end

  create_table "authorships", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "author_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_id"], name: "index_blogs_on_news_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "presentations_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "congress_id"
    t.index ["congress_id"], name: "index_categories_on_congress_id"
    t.index ["presentations_id"], name: "index_categories_on_presentations_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "body"
    t.integer  "replies_id"
    t.integer  "likes_id"
    t.integer  "dislikes_id"
    t.boolean  "is_important"
    t.boolean  "is_inappropriate"
    t.boolean  "reviewed"
    t.boolean  "denounced"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "presentation_id"
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["dislikes_id"], name: "index_comments_on_dislikes_id"
    t.index ["likes_id"], name: "index_comments_on_likes_id"
    t.index ["presentation_id"], name: "index_comments_on_presentation_id"
    t.index ["replies_id"], name: "index_comments_on_replies_id"
  end

  create_table "congresses", force: :cascade do |t|
    t.string   "name"
    t.string   "organizer"
    t.integer  "responsible_id"
    t.integer  "calendar_id"
    t.integer  "blog_id"
    t.integer  "categories_id"
    t.integer  "administrators_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "facebook_dir"
    t.string   "twitter_dir"
    t.index ["administrators_id"], name: "index_congresses_on_administrators_id"
    t.index ["blog_id"], name: "index_congresses_on_blog_id"
    t.index ["calendar_id"], name: "index_congresses_on_calendar_id"
    t.index ["categories_id"], name: "index_congresses_on_categories_id"
    t.index ["responsible_id"], name: "index_congresses_on_responsible_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.integer  "comments_id"
    t.integer  "amount_comments"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["comments_id"], name: "index_discussions_on_comments_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "ending_date"
    t.time     "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "congress_id"
    t.integer  "user_id"
    t.index ["congress_id"], name: "index_events_on_congress_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "expositions", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "presenter_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.binary   "image"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "congress_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.index ["author_id"], name: "index_news_on_author_id"
    t.index ["cached_votes_down"], name: "index_news_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_news_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_news_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_news_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_news_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_news_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_news_on_cached_weighted_total"
    t.index ["congress_id"], name: "index_news_on_congress_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.integer  "authors_id"
    t.string   "title"
    t.string   "abstract"
    t.integer  "uploader_id"
    t.binary   "document"
    t.integer  "status"
    t.integer  "discussion_id"
    t.integer  "presenters_id"
    t.integer  "likes_id"
    t.integer  "dislikes_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "pdf_file_file_name"
    t.string   "pdf_file_content_type"
    t.integer  "pdf_file_file_size"
    t.datetime "pdf_file_updated_at"
    t.integer  "category_id"
    t.index ["authors_id"], name: "index_presentations_on_authors_id"
    t.index ["category_id"], name: "index_presentations_on_category_id"
    t.index ["discussion_id"], name: "index_presentations_on_discussion_id"
    t.index ["dislikes_id"], name: "index_presentations_on_dislikes_id"
    t.index ["likes_id"], name: "index_presentations_on_likes_id"
    t.index ["presenters_id"], name: "index_presentations_on_presenters_id"
    t.index ["uploader_id"], name: "index_presentations_on_uploader_id"
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["reply_id"], name: "index_replies_on_reply_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",                            null: false
    t.string   "user_id",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
