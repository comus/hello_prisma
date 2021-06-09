CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateTable
CREATE TABLE "annual_transcript_settings" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "terms" INTEGER,
    "cls_ids" TEXT[],
    "show_rank" INTEGER,
    "not_ranked_student_ids" TEXT[],
    "inclusive_student_ids" TEXT[],
    "options" JSON,
    "name" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "assessment_reports" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "assessment_template_id" VARCHAR(255),
    "submission_start_date" TIMESTAMPTZ(6),
    "submission_end_date" TIMESTAMPTZ(6),
    "date_of_issue" TIMESTAMPTZ(6),
    "is_english" BOOLEAN DEFAULT false,
    "cls_ids" VARCHAR(255)[],
    "schooluser_ids" VARCHAR(255)[],
    "options" JSON,
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "title" VARCHAR(255),
    "subtitle" VARCHAR(255),
    "term" INTEGER,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "assessment_templates" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "revision" INTEGER,
    "code" VARCHAR(255),
    "school_id" VARCHAR(255),
    "sections" JSON,
    "assessment_report_id" VARCHAR(255),
    "is_source" BOOLEAN DEFAULT true,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "assessments" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "assessment_report_id" VARCHAR(255),
    "data" JSON,
    "cls_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "attendance_rules" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "days" INTEGER[],
    "remarks" TEXT,
    "priority" INTEGER,
    "start_date" TIMESTAMPTZ(6),
    "end_date" TIMESTAMPTZ(6),
    "cls_ids" TEXT[],
    "schooluser_ids" TEXT[],
    "is_exempt" BOOLEAN,
    "is_all_academic_staff" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "blockly" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "game_name" VARCHAR(255),
    "game_level" INTEGER,
    "school_id" VARCHAR(255),
    "finish_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "user_game_level" INTEGER,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "book_borrow_rule" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "is_student" BOOLEAN DEFAULT false,
    "is_teacher" BOOLEAN DEFAULT false,
    "is_cls" BOOLEAN DEFAULT false,
    "borrow_quantity" INTEGER,
    "borrow_day" INTEGER,
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "book_borrowing_records" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "appointment_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "book_id" VARCHAR(255),
    "revert_at" TIMESTAMPTZ(6),
    "revert_state" BOOLEAN DEFAULT false,
    "extension_state" BOOLEAN DEFAULT false,
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "book_info" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "isbn" VARCHAR(255),
    "name" VARCHAR(255),
    "author" VARCHAR(255),
    "publishing_house" TEXT,
    "publishing_date" TIMESTAMPTZ(6),
    "page" INTEGER,
    "language" VARCHAR(255),
    "translation" VARCHAR(255),
    "Introduction" TEXT,
    "school_id" VARCHAR(255),
    "borrow_num" INTEGER,
    "sort_id" VARCHAR(255),
    "call_number" VARCHAR(255),
    "title" TEXT[],
    "series" VARCHAR(255),
    "book_photo" VARCHAR(255),
    "price" REAL,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "book_recommend" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "isbn" VARCHAR(255),
    "school_id" VARCHAR(255),
    "comment" TEXT,
    "recommend_group" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "books" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "isbn" VARCHAR(255),
    "position" VARCHAR(255),
    "book_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "state" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "books_sort" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "sort_num" VARCHAR(255),
    "default_position" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "classes" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "english_name" VARCHAR(255),
    "slug" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,
    "archived_at" TIMESTAMPTZ(6),
    "label_ids" TEXT[],

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "coach_referrals" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "creator_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "health_reason" TEXT,
    "developing_reason" TEXT,
    "in_school_reason" TEXT,
    "family_reason" TEXT,
    "conduct_reason" TEXT,
    "sentiment_reason" TEXT,
    "remake" TEXT,
    "prev_method" TEXT,
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "staff_id" VARCHAR(255),
    "dispatcher_id" VARCHAR(255),
    "is_closed" BOOLEAN DEFAULT false,
    "closed_at" TIMESTAMPTZ(6),
    "handle_mode" INTEGER,
    "is_read" BOOLEAN DEFAULT false,
    "cls_teacher_response" TEXT,
    "principal_response" TEXT,
    "edit_logs" JSON,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "comment" TEXT,
    "schooluser_id" VARCHAR(255),
    "cls_id" VARCHAR(255),
    "creator_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "courses" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "cls_id" VARCHAR(255),
    "type" VARCHAR(255),
    "term" INTEGER DEFAULT 0,
    "english_name" VARCHAR(255),
    "slug" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,
    "credits" REAL DEFAULT 0,
    "archived_at" TIMESTAMPTZ(6),
    "terms" INTEGER[],
    "token" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "etiologies" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "seq_id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "english_name" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "follow_up" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "seq_id" SERIAL NOT NULL,
    "creator_id" VARCHAR(255),
    "referral_id" VARCHAR(255),
    "content" TEXT,
    "sub_title" TEXT,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "grades" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "term" INTEGER,
    "school_dashboard_id" VARCHAR(255),
    "term_transcript_id" VARCHAR(255),
    "grades" DOUBLE PRECISION[],
    "ratio_grades" DOUBLE PRECISION[],
    "course_id" VARCHAR(255),
    "sub_course" VARCHAR(255),
    "ratio_sub_course" REAL DEFAULT 1,
    "cls_id" VARCHAR(255),
    "conduct" TEXT,
    "rewards_punishments" TEXT,
    "lates" INTEGER,
    "absences" INTEGER,
    "absenteeisms" INTEGER,
    "comment" TEXT,
    "rating" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "health_operations_log" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "module_name" VARCHAR(255),
    "module_english_name" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "homework" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "cls_id" VARCHAR(255),
    "course_id" VARCHAR(255),
    "creator_id" VARCHAR(255),
    "title" VARCHAR(255),
    "content" TEXT,
    "end_at" TIMESTAMPTZ(6),
    "files" JSON,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "homework_score" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "fraction" REAL,
    "schooluser_id" VARCHAR(255),
    "homework_id" VARCHAR(255),
    "describe" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "intelligences" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "seq_id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "english_name" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "knex_migrations" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "batch" INTEGER,
    "migration_time" TIMESTAMPTZ(6),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "knex_migrations_lock" (
    "index" SERIAL NOT NULL,
    "is_locked" INTEGER,

    PRIMARY KEY ("index")
);

-- CreateTable
CREATE TABLE "labels" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "leaves" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "type" VARCHAR(255),
    "description" TEXT,
    "state" BOOLEAN,
    "remarks" TEXT,
    "sessions" INTEGER,
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "leisure_applications" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "leisure_registration_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "is_accepted" BOOLEAN DEFAULT false,
    "priority" INTEGER,
    "state" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "leisure_registrations" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "course_id" VARCHAR(255),
    "name" VARCHAR(255),
    "limit" INTEGER,
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "cls_ids" TEXT[],
    "teacher_id" VARCHAR(255),
    "activity_start" VARCHAR(255),
    "activity_end" VARCHAR(255),
    "filter" VARCHAR(255),
    "content" TEXT,
    "is_filted" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "leisure_transcripts" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "course_ids" TEXT[],
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "term" INTEGER,
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "marksheets" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "term" INTEGER,
    "school_dashboard_id" VARCHAR(255),
    "term_transcript_id" VARCHAR(255),
    "grades" JSON,
    "conduct" TEXT,
    "rewards_punishments" TEXT,
    "lates" INTEGER,
    "absences" INTEGER,
    "absenteeisms" INTEGER,
    "total_score" REAL,
    "avg_score" REAL,
    "cls_rank" VARCHAR(255),
    "group_rank" VARCHAR(255),
    "comment" TEXT,
    "student_data" JSON,
    "annual_transcript_id" VARCHAR(255),
    "awards" TEXT,
    "conclusion" TEXT,
    "usual" REAL,
    "exam" REAL,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "medical_records" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "creator_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "remark" TEXT,
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "chief_complaint" VARCHAR(255),
    "symptoms" TEXT[],
    "seq_id" SERIAL NOT NULL,
    "admission_at" TIMESTAMPTZ(6),
    "discharge_at" TIMESTAMPTZ(6),
    "treatment" TEXT,
    "symptom" VARCHAR(255),
    "notified" BOOLEAN,
    "edit_logs" JSON,
    "application_type" VARCHAR(255),
    "application_remark" TEXT,
    "application_created_at" TIMESTAMPTZ(6),
    "application_modified_at" TIMESTAMPTZ(6),
    "leave_school_at" TIMESTAMPTZ(6),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "mobile_token" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "token" VARCHAR(255),
    "user_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "creator_id" VARCHAR(255),
    "schooluser_ids" TEXT[],
    "date_of_issue" TIMESTAMPTZ(6),
    "title" VARCHAR(255),
    "content" TEXT,
    "selections" TEXT[],
    "submission_date_end" TIMESTAMPTZ(6),
    "is_reply" BOOLEAN DEFAULT false,
    "is_school_notification" BOOLEAN DEFAULT false,
    "cls_ids" TEXT[],
    "is_issued" BOOLEAN DEFAULT false,
    "files" TEXT[],
    "is_all_teachers" BOOLEAN DEFAULT false,
    "is_all_students" BOOLEAN DEFAULT false,
    "is_to_students" BOOLEAN DEFAULT false,
    "is_to_guardians" BOOLEAN DEFAULT false,
    "school_dashboard_id" VARCHAR(255),
    "label_ids" TEXT[],

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "post_photos" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "post_id" VARCHAR(255),
    "key" VARCHAR(255),
    "url" VARCHAR(255),
    "face_records" JSON,
    "participant_ids" VARCHAR(255)[],
    "school_id" VARCHAR(255),
    "delete_face_ids" VARCHAR(255)[],
    "type" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "posts" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "creator_id" VARCHAR(255),
    "title" VARCHAR(255),
    "content" TEXT,
    "course_id" VARCHAR(255),
    "cls_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "participant_ids" VARCHAR(255)[],
    "seq_id" SERIAL NOT NULL,
    "cls_ids" VARCHAR(255)[],
    "course_ids" VARCHAR(255)[],
    "talent_id" VARCHAR(255),
    "is_school_post" BOOLEAN DEFAULT false,
    "content_blocks" TEXT,
    "type" VARCHAR(255),
    "show_all_photos" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "preventives_isolation" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "creator_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "reason" TEXT,
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,
    "edit_logs" JSON,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "punch_records" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "card_no" VARCHAR(255),
    "punch_in_at" TIMESTAMPTZ(6),
    "punch_out_at" TIMESTAMPTZ(6),
    "absenteeisms" INTEGER,
    "lates" INTEGER,
    "section" INTEGER,
    "official_leaves" INTEGER,
    "absences" INTEGER,
    "school_dashboard_id" VARCHAR(255),
    "attendance_date" DATE,
    "edit_logs" JSON,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "questionnaire" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "questionnaire_title" VARCHAR(255),
    "questionnaire_introduction" VARCHAR(255),
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "questionnaire_group" VARCHAR(255),
    "questionnaire_cls_ids" TEXT[],
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "questionnaire_options" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "options_title" VARCHAR(255),
    "options_num" INTEGER,
    "questionnaire_id" VARCHAR(255),
    "options_type" VARCHAR(255),
    "required" BOOLEAN DEFAULT true,
    "photo_url" VARCHAR(255),
    "options_content" TEXT[],
    "exclude_options" INTEGER[],

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "questionnaire_schooluser" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "questionnaire_id" VARCHAR(255),
    "options_content" TEXT[],
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "ranks" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "name" VARCHAR(255),
    "upper_limit" INTEGER,
    "lower_limit" INTEGER,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "role" VARCHAR(255),
    "module" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "roll_calls" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "course_id" VARCHAR(255),
    "student_ids" TEXT[],
    "creator_id" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "school_sport" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_dashboard_id" VARCHAR(255),
    "start_at" TIMESTAMPTZ(6),
    "end_at" TIMESTAMPTZ(6),
    "sign_up_start_at" TIMESTAMPTZ(6),
    "sign_up_end_at" TIMESTAMPTZ(6),
    "clsIds" TEXT[],
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "school_sport_default_item" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "type" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "school_sport_group" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "gender" VARCHAR(255),
    "sport_id" VARCHAR(255),
    "birthday_start" TIMESTAMPTZ(6),
    "birthday_end" TIMESTAMPTZ(6),
    "limit" INTEGER,
    "is_relay" BOOLEAN DEFAULT false,
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "school_sport_item" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "default_item_id" VARCHAR(255),
    "sport_group_id" VARCHAR(255),
    "preliminary_round" BOOLEAN DEFAULT false,
    "scene_people_number" INTEGER,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schools" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "english_name" VARCHAR(255),
    "slug" VARCHAR(255),
    "created_by" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,
    "collection_id" VARCHAR(255),
    "has_intelligence_module" BOOLEAN DEFAULT false,
    "has_assessment_module" BOOLEAN DEFAULT false,
    "has_health_module" BOOLEAN DEFAULT false,
    "has_notification_module" BOOLEAN DEFAULT false,
    "has_student_module" BOOLEAN DEFAULT false,
    "has_attendance_module" BOOLEAN DEFAULT false,
    "has_homework_module" BOOLEAN DEFAULT false,
    "has_coach_module" BOOLEAN DEFAULT false,
    "token" VARCHAR(255),
    "has_transcript_module" BOOLEAN DEFAULT false,
    "has_library_module" BOOLEAN DEFAULT false,
    "has_activity_module" BOOLEAN DEFAULT false,
    "has_questionnaire_module" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schools_dashboards" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "school_id" VARCHAR(255),
    "is_default" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schooluser_homework" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "homework_id" VARCHAR(255),
    "remark" TEXT,
    "submit_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "files" JSON,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schooluser_photos" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "key" VARCHAR(255),
    "url" VARCHAR(255),
    "face_id" VARCHAR(255),
    "image_id" VARCHAR(255),
    "face_records" JSON,
    "school_id" VARCHAR(255),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schooluser_sport" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "item_id" VARCHAR(255),
    "path" INTEGER,
    "scene" INTEGER,
    "finals_path" INTEGER,
    "score" INTEGER,
    "finals_score" INTEGER,
    "schooluser_ids" TEXT[],
    "is_promotion" BOOLEAN DEFAULT false,
    "is_new_record" BOOLEAN DEFAULT false,
    "ranking" INTEGER,
    "abstain" BOOLEAN DEFAULT false,
    "remark" VARCHAR(255),
    "school_id" VARCHAR(255),
    "sport_group_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schooluser_sport_personnel" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "schooluser_join_num" VARCHAR(255),
    "sport_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schoolusers" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "email" VARCHAR(255),
    "profile_photo" VARCHAR(255),
    "user_id" VARCHAR(255),
    "username" VARCHAR(255),
    "is_student" BOOLEAN DEFAULT false,
    "is_teacher" BOOLEAN DEFAULT false,
    "is_director" BOOLEAN DEFAULT false,
    "is_admin" BOOLEAN DEFAULT false,
    "english_name" VARCHAR(255),
    "gender" VARCHAR(255),
    "student_no" VARCHAR(255),
    "id_no" VARCHAR(255),
    "edu_no" VARCHAR(255),
    "card_no" VARCHAR(255),
    "school_id" VARCHAR(255),
    "groups" VARCHAR(255)[],
    "seq_id" SERIAL NOT NULL,
    "archived_at" TIMESTAMPTZ(6),
    "is_paramedic" BOOLEAN DEFAULT false,
    "is_guardian" BOOLEAN DEFAULT false,
    "children_ids" TEXT[],
    "archived_reason" VARCHAR(255),
    "is_notification_admin" BOOLEAN,
    "is_attendance_admin" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schoolusers_classes" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "cls_id" VARCHAR(255),
    "num" INTEGER,
    "is_student" BOOLEAN DEFAULT false,
    "is_cls_teacher" BOOLEAN DEFAULT false,
    "is_teacher" BOOLEAN DEFAULT false,
    "seq_id" SERIAL NOT NULL,
    "archived_at" TIMESTAMPTZ(6),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "schoolusers_courses" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "course_id" VARCHAR(255),
    "is_student" BOOLEAN DEFAULT false,
    "is_course_teacher" BOOLEAN DEFAULT false,
    "is_teacher" BOOLEAN DEFAULT false,
    "archived_at" TIMESTAMPTZ(6),
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "special_health_conditions" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "creator_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "etiology_id" VARCHAR(255),
    "etiology_detail" TEXT,
    "school_id" VARCHAR(255),
    "seq_id" SERIAL NOT NULL,
    "hospital" VARCHAR(255),
    "emergency_phones" TEXT[],
    "diseases" TEXT[],
    "reason" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "edit_logs" JSON,
    "special_case" TEXT,
    "special_attention" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "students" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "name" VARCHAR(255),
    "english_name" VARCHAR(255),
    "gender" VARCHAR(255),
    "nationality" VARCHAR(255),
    "enrollment_at" TIMESTAMPTZ(6),
    "birth_at" TIMESTAMPTZ(6),
    "birthplace" VARCHAR(255),
    "phone_number" VARCHAR(255),
    "address" VARCHAR(255),
    "father_name" VARCHAR(255),
    "father_occupation" VARCHAR(255),
    "father_phone" VARCHAR(255),
    "mother_name" VARCHAR(255),
    "mother_occupation" VARCHAR(255),
    "mother_phone" VARCHAR(255),
    "guardianship" VARCHAR(255),
    "guardian_name" VARCHAR(255),
    "guardian_occupation" VARCHAR(255),
    "guardian_phone" VARCHAR(255),
    "id_no" VARCHAR(255),
    "id_type" VARCHAR(255),
    "id_issue_location" VARCHAR(255),
    "edu_no" VARCHAR(255),
    "homecoming_permit_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "goldcard_no" VARCHAR(255),
    "schsub_code" VARCHAR(255),
    "portuguese_name" VARCHAR(255),
    "grand" VARCHAR(255),
    "cls_code" VARCHAR(255),
    "cls_no" VARCHAR(255),
    "parents_marital" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "sub_attendance_rules" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "start_time" TIME(6),
    "end_time" TIME(6),
    "type" VARCHAR(255),
    "lates" INTEGER,
    "absenteeisms" INTEGER,
    "rule_id" VARCHAR(255),
    "remarks" TEXT,
    "is_exempt" BOOLEAN,
    "is_after_school" BOOLEAN,
    "section" INTEGER,
    "session" INTEGER,
    "late_start" TIME(6),
    "late_end" TIME(6),
    "is_to_school" BOOLEAN,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "talents" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "seq_id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "intelligence_id" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "term_transcript_settings" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "school_id" VARCHAR(255),
    "school_dashboard_id" VARCHAR(255),
    "term" INTEGER,
    "term_start_at" TIMESTAMPTZ(6),
    "term_end_at" TIMESTAMPTZ(6),
    "submission_start_at" TIMESTAMPTZ(6),
    "submission_end_at" TIMESTAMPTZ(6),
    "date_of_issue" TIMESTAMPTZ(6),
    "annual_transcript_setting_id" VARCHAR(255),
    "name" VARCHAR(255),
    "usual_ratio" REAL,
    "exam_ratio" REAL,
    "total_ratio" REAL,
    "completed_files" TEXT[],

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "google_provider_id" VARCHAR(255),
    "username" VARCHAR(255),
    "name" VARCHAR(255),
    "email" VARCHAR(255),
    "profile_photo" TEXT,
    "is_admin" BOOLEAN DEFAULT false,
    "groups" VARCHAR(255)[],
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "seq_id" SERIAL NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_notifications" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "notification_id" VARCHAR(255),
    "schooluser_id" VARCHAR(255),
    "reply" VARCHAR(255),
    "is_read" BOOLEAN DEFAULT false,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "volunteer" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "schooluser_id" VARCHAR(255),
    "activity_name" VARCHAR(255),
    "service_start_at" TIMESTAMPTZ(6),
    "service_end_at" TIMESTAMPTZ(6),
    "group_category" VARCHAR(255),
    "service_sort" TEXT[],
    "institution_name" VARCHAR(255),
    "teacher_id" VARCHAR(255),
    "state" BOOLEAN DEFAULT false,
    "school_dashboard_id" VARCHAR(255),
    "school_id" VARCHAR(255),
    "hours" REAL,

    PRIMARY KEY ("seq_id")
);

-- CreateTable
CREATE TABLE "volunteer_stage" (
    "id" UUID DEFAULT uuid_generate_v4(),
    "seq_id" SERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMPTZ(6),
    "deleted_at" TIMESTAMPTZ(6),
    "stage_name" VARCHAR(255),
    "stage_start_at" VARCHAR(255),
    "stage_end_at" VARCHAR(255),
    "school_id" VARCHAR(255),

    PRIMARY KEY ("seq_id")
);
