btnSubmit.Click += (s, e) =>
{
    if (!this.Page.IsValid) return;
    if (!btnSubmit.Visible) return;
    MagDataFactory
        .GetInlineExecutor()
        .ExecuteNonQuery(
            "UPDATE [Forums_Posts] SET [Subject]=@Subject, [Body]=@Body WHERE [Post_Id]=@Post_Id",
            new[] 
            { 
                new SqlParameter("@Subject", Formatting.EscapeUnicodeHTML(txtSubject.Text)),
                new SqlParameter("@Body", Formatting.EscapeUnicodeHTML(ctlCysRTEditor.Text)),
                new SqlParameter("@Post_Id", this.PostId)
            });
    
    LegacyLogger.PostMessage(this.PostId);

    this.Response.Redirect(
        MessagePage.BuildUrl(this.ForumId, this.Post.Message_Id) 
        + "#" + this.Post.Post_Id.ToString());
};
