require 'prawn/table'

image "app/assets/images/asog_pdf.png", :width => 330, :height => 80, :position => 112
move_down 20

text "Progress Report as of #{Date.today.strftime('%b' +" " +'%d' +", "+ '%Y')}", :align => :center
move_down 5
text "#{@project}(#{@project.kpa_cluster})", :align => :center

move_down 30

text "Expenditure:", :indent_paragraphs => 15, :size => 14
move_down 10

items = [["Item","Budget","Amount spent","Balance left","Percentage spent (%)"]]
items += @project.items.map do |item|
  [
    item.item_title,
    item.budget,
    item.amount_spent,
    item.balance_left,
    item.percentage_spent
  ]
end

items += [["Total",
  " ",
  "#{@project.total_amount_spent}",
  "#{@project.total_budget - @project.total_amount_spent}",
  "#{@project.actual_expenditure_percentage}"]]

pdf.table(items,
  :position => :center,
  :column_widths => [100, 105, 105, 105, 100],
  :cell_style => {
    :borders => [:left, :top, :bottom, :right],
    :border_width => 2,
    :align => :right
  }) do |t|
  t.row(0).background_color = '1C3F94'
  t.row(0).text_color = 'ffffff'
end

move_down 30

text "Tasks:", :indent_paragraphs => 15, :size => 14

move_down 10

tasks = [
  ["Total tasks finished: #{@project.tasks.where("isFinished = true").count}",
    "Tasks remaining: #{ @project.tasks.where("isFinished = false").count}",
    "Overdue tasks: #{@project.get_overdue_tasks}"
  ]
]

pdf.table(tasks, :position => :center,
:column_widths => [170, 170, 170],
:cell_style => {
  :borders => [:left, :top, :bottom, :right],
  :border_width => 2,
  :align => :center
})

move_down 30

text "Staff whose contract expires within 30 days:", :indent_paragraphs => 15, :size => 14

move_down 20

staff = [["Staff name", "Contract expiration Date"]]
staff += @project.get_expiring_staff.map do |staff|
    [
      "#{staff}",
      "#{staff.contract_expiration_date.strftime('%b' +" " +'%d' +", "+ '%Y')}"
    ]
end

pdf.table(staff, :position => :center,
:column_widths => [190, 190],
:cell_style => {
  :borders => [:left, :top, :bottom, :right],
  :border_width => 2,
  :align => :center
})do |t|
t.row(0).background_color = '1C3F94'
t.row(0).text_color = 'ffffff'
end
