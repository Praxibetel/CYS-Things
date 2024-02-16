ListBox chapterListBox = new ListBox();

foreach (Data.Mag.Tables.Game_Chapters chapter in chapterList)
{
  chapterListBox.Items.Add(new ListItem(chapter.Title, chapter.Chapter_Id.ToString()));

  if (this.linkType == "Chapter" && chapter.Chapter_Id == this.destinationID)
  {
    chapterListBox.SelectedValue = chapter.Chapter_Id.ToString();
  }
}

chapterListBox.ID = "list_chapter";
chapterListBox.Rows = Math.Min(10, chapterList.Count() + 2);
chapterListBox.ViewStateMode = System.Web.UI.ViewStateMode.Enabled;
chapterListBox.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('radio_page').checked = false; " +
  "document.getElementById('radio_end_game').checked = false; " +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_chapter').checked = true; "
);

RadioButton pageRadioButton = new RadioButton();
pageRadioButton.ID = "radio_page";
pageRadioButton.Text = "Page";
pageRadioButton.Checked = this.linkType == "Page";
pageRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_chapter').value = -1; " +
  "document.getElementById('row_chapter').style.display = 'none'; " +
  "document.getElementById('row_page').style.display = 'block'; " +
  "document.getElementById('radio_end_game').checked = false; " +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_chapter').checked = false;"
);

RadioButton chapterRadioButton = new RadioButton();
chapterRadioButton.ID = "radio_chapter";
chapterRadioButton.Text = "Chapter";
chapterRadioButton.Checked = this.linkType == "Chapter";
chapterRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('row_chapter').style.display = 'block'; " +
  "document.getElementById('radio_end_game').checked = false; " +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_page').checked = false;"
);

RadioButton endGameRadioButton = new RadioButton();
endGameRadioButton.ID = "radio_end_game";
endGameRadioButton.Text = "End Game and Leave Comments";
endGameRadioButton.Checked = this.linkType == "End Game";
endGameRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('list_chapter').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('row_chapter').style.display = 'none'; " +
  "document.getElementById('radio_page').checked = false;" +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_chapter').checked = false;"
);

RadioButton previousPageRadioButton = new RadioButton();
previousPageRadioButton.ID = "radio_previous";
previousPageRadioButton.Text = "Previous Page";
previousPageRadioButton.Checked = this.linkType == "Previous Page";
previousPageRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('list_chapter').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('row_chapter').style.display = 'none'; " +
  "document.getElementById('radio_page').checked = false;" +
  "document.getElementById('radio_end_game').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_chapter').checked = false;"
);

RadioButton resetRadioButton = new RadioButton();
resetRadioButton.ID = "radio_reset";
resetRadioButton.Text = "Reset Story";
resetRadioButton.Checked = this.linkType == "Reset Game";
resetRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('list_chapter').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('row_chapter').style.display = 'none'; " +
  "document.getElementById('radio_page').checked = false;" +
  "document.getElementById('radio_end_game').checked = false;" +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_save').checked = false;" +
  "document.getElementById('radio_chapter').checked = false;"
);

RadioButton saveRadioButton = new RadioButton();
saveRadioButton.ID = "radio_save";
saveRadioButton.Text = "Save Story";
saveRadioButton.Checked = this.linkType == "Save Game";
saveRadioButton.Attributes.Add("OnClick",
  "document.getElementById('list_page').value = -1; " +
  "document.getElementById('list_chapter').value = -1; " +
  "document.getElementById('row_page').style.display = 'none'; " +
  "document.getElementById('row_chapter').style.display = 'none'; " +
  "document.getElementById('radio_page').checked = false;" +
  "document.getElementById('radio_end_game').checked = false;" +
  "document.getElementById('radio_previous').checked = false;" +
  "document.getElementById('radio_reset').checked = false;" +
  "document.getElementById('radio_chapter').checked = false;"
);

Button btnSave = new Button { Text = "Save Link", ID = "btn_save_link" };
btnSave.Click += new EventHandler(onBtnSaveClick);
