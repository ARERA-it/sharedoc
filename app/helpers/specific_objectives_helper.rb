module SpecificObjectivesHelper

  def file_status_string(sharepoint_file)
    case file_status(sharepoint_file)
    when :locked
      "Locked by #{sharepoint_file.locked_by_user.title}"
    when :checked_out
      "Checked Out by #{sharepoint_file.checked_out_by_user.title}"
    when :checked_in
      "Checked In"
    end
  end

  def file_status(sharepoint_file)
    if sharepoint_file.locked_by_user
      :locked
    elsif sharepoint_file.checked_out_by_user
      :checked_out
    else
      :checked_in
    end
  end
end
