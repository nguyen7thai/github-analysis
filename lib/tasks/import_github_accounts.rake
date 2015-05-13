namespace :github do
  desc "import github accounts data"
  task :update_accounts => :environment do |t|
    arr = [["trangnguyen-EA", "trang.nguyen@eastagile.com", "10447216", "trangnguyen"],
      ["EastAgileCI", nil, "4362873", nil],
      ["eastagileVN", nil, "135245", nil],
      ["liamdempseydma", nil, "8634792", nil],
      ["lwsinclair", nil, "2829939", nil],
      ["reighley-christopher", nil, "1404070", nil],
      ["stefangeorg", "stefan.georg@eastagile.com", "2084069", nil],
      ["anhhuy1605", "huy.nguyen@eastagile.com", "2297242", "huynguyen"],
      ["buiminhtri318", "tri.bui@eastagile.com", "8347229", "tribui"],
      ["buubui", "buu.bui@eastagile.com", "5128246", "buubui"],
      ["ceege111", "cjm@eastagile.com", "157273", "cjm"],
      ["chautoni", "thach.chau@eastagile.com", "640707", "thachchau"],
      ["ciminuv", "cuong.nguyen@eastagile.com ", "6657053", "cuongnguyen "],
      ["dondonnguyen", "don.nguyen@eastagile.com", "6724423", "donnguyen"],
      ["giang271291", "giang.nguyen@eastagile.com", "747633", "giangnguyen"],
      ["hieueastagile", "hieu.hoang@eastagile.com", "10395094", "hieuhoang"],
      ["hoanghuynh", "hoang.huynh@eastagile.com", "105269", "hoanghuynh"],
      ["hoangphanea", "hoang.phan@eastagile.com", "7765168", "hoangphan"],
      ["huyha85", "huy.ha@eastagile.com", "146665", "huyha"],
      ["isthelte", "thinh.nguyen@eastagile.com", "4986010", "thinhnguyen"],
      ["jacobdam", "phuc.dam@eastagile.com", "74298", "phucdam"],
      ["khoIT", "khoi.tran@eastagile.com", "2936086", "khoitran"],
      ["LienDang", "lien.dang@eastagile.com", "1421838", "liendang"],
      ["lqthien", "thien.lam@eastagile.com", "2116568", "thienlam"],
      ["maiphan", "mai.phan@eastagile.com", "6842224", "maiphan"],
      ["maxdota", "ngoc.nguyen@eastagile.com", "4739223", "ngocnguyen"],
      ["ngocluong", "ngoc.luong@eastagile.com", "7664156", "ngocluong"],
      ["nguyen7thai", "thai.nguyen@eastagile.com", "6300159", "thainguyen"],
      ["nguyentran87", "nguyen.tran@eastagile.com", "5975670", "nguyentran"],
      ["nhphong", "phong.nguyen@eastagile.com", "7122485", "phongnguyen"],
      ["NikkeRuokolainen", "nikke.ruokolainen@eastagile.com ", "6657050", "nikkeruokolainen "],
      ["oyster", "quang.huynh@eastagile.com", "116719", "quanghuynh"],
      ["PhamTheQuang", "quang.pham@eastagile.com", "9523726", "quangpham"],
      ["quangle", "quang.le@eastagile.com", "1405205", "quangle"],
      ["sonpt86", "son.pham@eastagile.com", "10589924", "sonpham"],
      ["squallcs12", "bang.dao@eastagile.com", "2298505", "bangdao"],
      ["T-Pham", "thanh.pham@eastagile.com", "1930855", "thanhpham"],
      ["tanduong", "tan.duong@eastagile.com", "7553677", "tanduong"],
      ["thaixuannguyen", "thai.xuan@eastagile.com", "8155322", "thaixuan"],
      ["thanhthao", "thao.tran@eastagile.com", "270221", "thaotran"],
      ["thaochau", "thao.chau@eastagile.com", "9522870", "thaochau"],
      ["thaohoangvn", "thao.hoang@eastagile.com", "9031068", "thaohoang"],
      ["thuyphan-ea", "thuy.phan@eastagile.com", "11834063", "thuyphan"],
      ["tklarryonline", "luan.nguyen@eastagile.com", "2020169", "luannguyen"],
      ["toannguyen177", "toan.nguyen@eastagile.com", "11712794", "toannguyen"],
      ["toantran-ea", "toan.tran@eastagile.com", "8085722", "toantran"],
      ["tobernguyen", "long.nguyen@eastagile.com", "10015525", "longnguyen"],
      ["TrangHo", "trang.ho@eastagile.com", "1122727", "trangho"],
      ["tri-dang", "tri.dang@eastagile.com", "6835551", "tridang"],
      ["trongtan", "tan.vu@eastagile.com", "2929285", "tanvu"],
      ["tuanmai", "tuan.mai@eastagile.com", "6701979", "tuanmai"],
      ["Vanalite", "nghia.doan@eastagile.com", "818645", "nghiadoan"]]

    arr.each do |a|
      GithubAccount.create(username: a[0], email: a[1], github_id: a[2], name: a[3])
    end
  end
end
