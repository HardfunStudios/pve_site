# frozen_string_literal: true

json.array! @text_contents, partial: 'text_contents/text_content', as: :text_content
