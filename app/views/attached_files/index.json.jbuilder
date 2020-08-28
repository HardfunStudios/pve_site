# frozen_string_literal: true

json.array! @attached_files, partial: 'attached_files/attached_file', as: :attached_file
