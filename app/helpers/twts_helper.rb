module TwtsHelper
  def choose_new_or_edit
    if action_name=='new' || action_name=='create' || action_name=='confirm'
      { uri: confirm_twts_path, header: '新規作成', label: 'ツイートする' }
    elsif action_name=='edit' || action_name=='update'
      { uri: twt_path, header: '編集', label: '編集結果を保存する' }
    end
  end
end
